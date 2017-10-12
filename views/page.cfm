<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">
<!--- ContentBoxEvent --->
#cb.event( "cbui_prePageDisplay" )#

<!--- Body Main --->
<div class="technology-1">
	<div class="container">
		<div class="col-md-9 col-sm-12 technology-left business mrg30T">
			<div class=" blog-grid2">
				<div class="blog-text">
					<cfif !args.print AND !isNull( "prc.page" ) AND prc.page.getSlug() neq cb.getHomePage()>
						<!--- BreadCrumbs --->
						<h5 id="body-breadcrumbs">
							#cb.breadCrumbs( separator="<i class='fa fa-angle-right'></i> " )#
						</h5>
					</cfif>
					<!--- Render Content --->
					<p>#prc.page.renderContent()#</p>
				</div>
			</div>
			<!--- Comments Bar --->
			<cfif cb.isCommentsEnabled( prc.page )>
				<div class="comment-top">
					<h2>#html.anchor(name="comments")#</h2>
					<div class="media-body">
						<hr>
						<h3>Comments(#prc.page.getNumberOfApprovedComments()#)</h3>
						<p id="comments">
							#cb.quickComments()#
						</p>
						<hr>
						<h3>Leave a Comment</h3>
						<p>
							#cb.quickCommentForm( prc.page )#
						</p>
						<br/>
					</div>
				</div>
			</cfif>
    	</div>
	</div>
</div>

<!--- ContentBoxEvent --->
#cb.event("cbui_postPageDisplay")#

</cfoutput>