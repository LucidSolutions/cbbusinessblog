<cfoutput>
<!--- Body Main --->
<div class="technology-1">
	<div class="container">
		<div class="col-md-9 col-sm-12 technology-left">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_preEntryDisplay")#
				<!--- post --->
				<div class="business" id="post_#prc.entry.getContentID()#">
					<div class=" blog-grid2">
						<div class="blog-text">
							<div class="tch-img">
								<cfif #prc.entry.getfeaturedImageURL()# NEQ ''>
									<img src="#prc.entry.getfeaturedImageURL()#" class="img-responsive" alt=""/>
								<cfelse>
									<!--- <img src="#cb.themeRoot()#/includes/images/No_image_available_600_x_450.svg.png" class="img-responsive" alt="" style="margin:0 auto; margin-top:15px;"/> --->
								</cfif>
							</div>
							<!--- Title --->
							<h5>#prc.entry.getTitle()#</h5>
							<!--- content --->
							<p>
								#prc.entry.renderContent()#
							</p>
							<cfif cb.themeSetting( "singleBlogOptions", true )>
								<div class="blog-poast-info">
									<ul>
										<li><i class="glyphicon glyphicon-user"> </i><a class="admin" href="##"> #prc.entry.getAuthorName()# </a></li>
										<li><i class="glyphicon glyphicon-calendar"> </i>#prc.entry.getDisplayPublishedDate()#</li>
										<li><i class="glyphicon glyphicon-comment"> </i><a href="#cb.linkEntry(prc.entry)###comments" title="View Comments"> #prc.entry.getNumberOfApprovedComments()# Comments</a></li>
										<li><i class="glyphicon glyphicon-eye-open"> </i>#prc.entry.getnumberOfHits()# views</li>
										<cfif cb.themeSetting( "addThisURL" ) NEQ ''>
											<li>
												<div class="addthis_inline_share_toolbox_x89b" data-url="#cb.linkEntry( prc.entry )#" data-title="#prc.entry.getTitle()#"></div>
											</li>
										</cfif>
									</ul>
								</div>
							</cfif>
						</div>
					</div>
					<!--- Comments Bar --->
					<cfif !args.print>
						<div class="comment-top">
							<h2>#html.anchor(name="comments")#</h2>
							<div class="media-body">
								<cfif NOT cb.isCommentsEnabled(prc.entry)>
									<i class="icon-warning-sign icon-2x"></i>
									Comments are currently closed
								<cfelse>
									<hr>
									<h3>Comments(#prc.entry.getNumberOfApprovedComments()#)</h3>
									<p id="comments">
										#cb.quickComments()#
									</p>	
									<hr>
									<h3>Leave a Comment</h3>
									<p id="commentFormShell">
										#cb.quickCommentForm( prc.entry )#
									</p>
								</cfif>								
							</div>
						</div>
					
						<!--- Separator --->
						<div class="separator"></div>
					</cfif>
				</div>
		</div>
		
				<!--- ContentBoxEvent --->
				#cb.event("cbui_postEntryDisplay")#

		<cfif args.sidebar>
			<div class="col-md-3 col-sm-12 technology-right" id="blog-sidenav">
				#cb.quickView(view='_blogsidebar', args=args)#
			</div>
		</cfif>
		<div class="clearfix"></div>
	</div>
</div>
</cfoutput>