<cfoutput>
<div class="header">
    <div class="header-top">
        <div class="container">
			<div class="logo col-md-4 col-lg-4 col-sm-4 col-xs-12">
				<a href="#cb.linkHome()#" title="#cb.siteTagLine()#"><h1>#cb.siteName()#</h1></a>
			</div>
			<div class="social col-md-4 col-lg-5 col-sm-4 col-xs-12 text-center">
				<ul>
					<cfif cb.themeSetting( "showFacebookOnTop" ) NEQ ''>
						<li><a href="#cb.themeSetting( "showFacebookOnTop" )#" class="facebook"> </a></li>
					</cfif>
					<cfif cb.themeSetting( "showTwitterOnTop" ) NEQ ''>
						<li><a href="#cb.themeSetting( "showTwitterOnTop" )#" class="facebook twitter"> </a></li>
					</cfif>
					<cfif cb.themeSetting( "showGoogleOnTop" ) NEQ ''>
						<li><a href="#cb.themeSetting( "showGoogleOnTop" )#" class="facebook chrome"> </a></li>
					</cfif>
					<cfif cb.themeSetting( "showLinkedinOnTop" ) NEQ ''>
						<li><a href="#cb.themeSetting( "showLinkedinOnTop" )#" class="facebook in"> </a></li>
					</cfif>
					<cfif cb.themeSetting( "showBehanceOnTop" ) NEQ ''>
						<li><a href="#cb.themeSetting( "showBehanceOnTop" )#" class="facebook beh"> </a></li>
					</cfif>
					<cfif cb.themeSetting( "showVimeoOnTop" ) NEQ ''>
						<li><a href="#cb.themeSetting( "showVimeoOnTop" )#" class="facebook vem"> </a></li>
					</cfif>
					<cfif cb.themeSetting( "showYoutubeOnTop" ) NEQ ''>
						<li><a href="#cb.themeSetting( "showYoutubeOnTop" )#" class="facebook yout"> </a></li>
					</cfif>
				</ul>
			</div>
			<div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
				#cb.widget( "SearchForm" )#
			</div>
		</div>
	</div>

	<div class="head-bottom">
	    <div class="container">
	        <div class="navbar-header">
	          	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##navbar" aria-expanded="false" aria-controls="navbar">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
	          	</button>	          	
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">	       
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
						<cfif cb.isBlogView()>
							<li class="active">
						<cfelse>
							<li>
						</cfif>
							<a href="#cb.linkBlog()#">Blog</a>
						</li>
					</cfif>
				</ul>
	        </div>
	    </div>
	</div>
</div>
<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu">';

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
