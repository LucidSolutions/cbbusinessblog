<cfoutput>
<cfif prc.currentRoutedURL EQ "blog/">	
	<cfif cb.themeSetting( "showBannerImg" ) NEQ ''>
		<div class="banner" style="background: url(#cb.themeSetting( "showBannerImg" )#) no-repeat 0px 0px;">
	<cfelse>
		<div class="banner" style="background: url('/modules/contentbox/themes/business_blog/includes/images/banner.jpg') no-repeat 0px 0px;">
	</cfif>
		<div class="container">
			<cfif cb.themeSetting( "showBannerHeading" ) NEQ ''>
				<h2>#cb.themeSetting( "showBannerHeading" )#</h2>
			<cfelse>
				<h2>Contrary to popular belief!!!</h2>
			</cfif>
			<cfif cb.themeSetting( "showBannerContent" ) NEQ ''>
				<p>#cb.themeSetting( "showBannerContent" )#</p>
			<cfelse>
				<p>
					Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
				</p>
			</cfif>
			<cfif cb.themeSetting( "showBannerURL" ) NEQ ''>
				<a href="#cb.themeSetting( "showBannerURL" )#">READ ARTICLE</a>
			</cfif>
		</div>
	</div>
</cfif>
<!--- Body Main --->
<cfif prc.entriesCount EQ 1>
	<div class="technology-1">
<cfelse>
	<div class="technology">
</cfif>
	<div class="container">	
		<cfif len( rc.category ) OR len( rc.q )>
			<div class="col-md-12 col-sm-12">
				<div class="vide">
					<!--- Content --->
					<!--- ContentBoxEvent --->
					#cb.event( "cbui_preArchivesDisplay" )#

					<cfif len( rc.category )>
						<div class="alert alert-info">
							Category Filtering: '#encodeForHTML( rc.category )#'
							<a href="#cb.linkBlog()#" class="btn orange-btn pull-right" title="Remove filter and view all entries"> Remove Filter</a>
						</div>
						<br/>
					</cfif>

					<!--- Are we searching --->
					<cfif len( rc.q )>
						<div class="alert alert-info">
							<a class="btn orange-btn" href="#cb.linkBlog()#" title="Clear search and view all entries"> Clear Search</a>
							Searching by: '#encodeForHTML( rc.q )#'
						</div>
						<br/>
					</cfif>
				</div>
			</div>
		</cfif>

		<!--- Content --->
		<div class="col-md-9 col-sm-12 technology-left">
			<!--- Are we filtering by category? --->
			
			<!--- ContentBoxEvent --->
			#cb.event( "cbui_preIndexDisplay" )#
				
			<!--- Entries displayed here --->
			<div class="tech-no">
				#cb.quickEntries()#
				<cfif prc.entriesCount>
				<!--- Pagination --->
					<div class="tc-ch paging">
						#cb.quickPaging()#
					</div>
				</cfif>
			</div>			
			
			<!--- ContentBoxEvent --->
			#cb.event( "cbui_postIndexDisplay" )#
		</div>
	
		<!--- SideBar --->
		<cfif args.sidebar>
			<div class="col-md-3 col-sm-12 technology-right" id="blog-sidenav">
				#cb.quickView( view='_blogsidebar', args=args )#
			</div>
		</cfif>
		<div class="clearfix"></div>
	</div>
</div>	
</cfoutput>
<script type="text/javascript">
	$('.paging').find('.col-xs-12').addClass('col-md-6');
	$('.paging').find('.col-xs-12').last().addClass('customPaging');
</script>