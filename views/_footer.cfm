<cfoutput>
	<div class="foot-nav">
		<div class="container">
			<ul class="nav navbar-nav">
				<cfset menuData = cb.rootMenu( type="data", levels="2" )>
				<!--- Iterate and build pages --->
				<cfloop array="#menuData#" index="menuItem">
					<cfif structKeyExists( menuItem, "subPageMenu" )>
						<li class="dropdown">
							<a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <b class="caret"></b></a>
							#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
						</li>
					<cfelse>
						<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
							<li class="active">
						<cfelse>
							<li>
						</cfif>
							<a href="#menuItem.link#">#menuItem.title#</a>
						</li>
					</cfif>
				</cfloop>

				<!--- Blog Link, verify active --->
				<cfif ( !prc.cbSettings.cb_site_disable_blog )>
					<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
						<a href="#cb.linkBlog()#">Blog</a>
					</li>
				</cfif>
			</ul>
		</div>
	</div>
	<div class="copyright">
		<div class="container">
			<p>Copyright &copy; #cb.siteName()#.  All rights reserved.123</p>
			<p>Powered by ContentBox v#cb.getContentBoxVersion()#</p>
		</div>
	</div>
	<div class="clearfix"></div>
</cfoutput>