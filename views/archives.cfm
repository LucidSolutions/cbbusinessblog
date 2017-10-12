<cfoutput>
<!--- Body Main --->
<div class="technology-1">
	<div class="container">
		<div class="col-md-12 col-sm-12">
			<div class="vide">
				<!--- Content --->
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preArchivesDisplay" )#

				<!--- Archives --->
				<cfif rc.year NEQ 0>
					<div class="alert alert-info">
						<a class="pull-right btn orange-btn btn-sm" href="#cb.linkBlog()#" title="Remove filter and view all entries">Remove Filter</a>
						
						Year: '#rc.year#'
						<cfif rc.month NEQ 0>- Month: '#rc.month#'</cfif>
						<cfif rc.day NEQ 0>- Day: '#rc.day#'</cfif>
					</div>
				</cfif>
				<!--- Title --->
				<h3>Blog Archives - #prc.entriesCount# Record(s)</h3><br>
			</div>
		</div>
		<div class="col-md-9 col-sm-12 technology-left">
			<!--- Display Entries using ContentBox collection template rendering
			The default convention for the template is "entry.cfm" you can change it via the quickEntries() 'template' argument.
			I could have done it manually, but why? --->
					 
			#cb.quickEntries()#

			<!--- Paging via ContentBox via quick HTML, again I could have done it manually, but why? --->
			<cfif prc.entriesCount>
				<div class="tc-ch paging">
					#cb.quickPaging()#
				</div>
			</cfif>
			
			<!--- ContentBoxEvent --->
			#cb.event( "cbui_postArchivesDisplay" )#
		</div>

		<!--- SideBar: That's right, I can render any layout views by using quickView() or coldbox render methods --->
		<cfif args.sidebar>
			<div class="col-md-3 col-sm-12 technology-right" id="blog-sidenav">
				#cb.quickView( view='_blogsidebar', args=args )#
			</div>
		</cfif>	
		<div class="clearfix"></div>		
	</div>		
</div>
</cfoutput>