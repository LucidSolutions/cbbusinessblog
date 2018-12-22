<cfoutput>
	<div class="foot-nav">
		<div class="container">
			<ul class="nav navbar-nav">
				<cfset menuData = cb.rootMenu( type="data", levels="2" )>
				<!--- Iterate and build pages --->
				<cfloop array="#menuData#" index="menuItem">
					<cfif !structKeyExists( menuItem, "subPageMenu" )>
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
<cfscript>
	any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
		var menu = '<ul class="dropdown-menu custom_class">';

		// Parent
		menu &= '<li><a href="#parentLink#"><i class="fa fa-chevron-down"></i> <strong>#parentTitle#</strong></a></li><li role="separator" class="divider"></li>';

		for( var menuItem in arguments.menuData ){
			if( !structKeyExists( menuItem, "subPageMenu" ) ){
				menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
			} else {
				menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
				menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
				menu &= '</li>';
			}
		}
		menu &= '</ul>';
		return menu;
	}
</cfscript>
</cfoutput>