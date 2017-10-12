<cfoutput>
<!--- Body Main --->
<div class="technology">
	<div class="container">
		<div class="col-md-9 technology-left">
			<!--- ContentBoxEvent --->
			#cb.event( "cbui_prePageDisplay" )#
			<div class="business">
				<div class=" blog-grid2">
					<div class="blog-text">
						<h5>Search Results</h5>
						<!--- Search Results --->
						<p>#cb.getSearchResultsContent()#</p>
					</div>
				</div>
			</div>
			<!--- Search paging --->
			<div class="tc-ch paging">
				#cb.quickSearchPaging()#
			</div>
		</div>
		<cfif args.sidebar>
			<div class="col-md-3 technology-right" id="blog-sidenav">
				#cb.quickView(view='_blogsidebar', args=args)#
			</div>
		</cfif>
		<div class="clearfix"></div>
	</div>
</div>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postPageDisplay" )#
</cfoutput>