<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#
	<cfif cb.themeSetting( "showSideBarImg" ) NEQ ''>
		<div class="blo-top">
			<div class="tech-btm">
				<a href="#cb.themeSetting( "showSideBarURL" )#"><img src="#cb.themeSetting( "showSideBarImg" )#" class="img-responsive" alt=""/></a>
			</div>
		</div>
	</cfif>
	<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
		<div class="blo-top tech-btm">
			<h4>Categories</h4>				
			<ul>#cb.quickCategories()#</ul>		
		</div>
	</cfif>
	<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
		<div class="blo-top tech-btm">
			<h4>Recent Entries</h4>
			#cb.widget( 'RecentEntries' )#
		</div>
	</cfif>
	<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
		<!--- RSS Buttons --->
		<div class="blo-top tech-btm">
			<h4>Site Updates</h4>
			<ul><li><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fa fa-rss"></i></a> <a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!">RSS Feed</a></li></ul>
		</div>
	</cfif>
	<cfif cb.isEntryView()>
		<cfif cb.themeSetting( "showEntryCommentsBlogSide", true )>
		<!--- RSS Entry Comments --->
		<div class="blo-top tech-btm">
			<h4>Entry Comments</h4>
			<ul><li><a href="#cb.linkRSS(comments=true,entry=prc.entry)#" title="Subscribe to our Entry's Comment(s) RSS Feed!"><i class="fa fa-rss"></i></a> <a href="#cb.linkRSS(comments=true,entry=prc.entry)#" title="Subscribe to our Entry's Comment(s) RSS Feed!">RSS Feed</a></li></ul>
		</div>
		</cfif>
	</cfif>
	<cfif cb.themeSetting( "showArchivesBlogSide", true )>
		<div class="blo-top tech-btm">
			<h4>Archives</h4>
			#cb.widget( "Archives" )#
		</div>
	</cfif>
	<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
		<div class="blo-top tech-btm">
			<h4>Entries Search</h4>
			#cb.widget( "SearchForm" )#
		</div>
	</cfif>
	<div class="clearfix"></div>
<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>