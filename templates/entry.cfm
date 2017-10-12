<cfoutput>
	<div class="tc-ch">
		<div class="tch-img">
			<cfif #entry.getfeaturedImageURL()# NEQ ''>
				<a href="#cb.linkEntry(entry)#"><img src="#entry.getfeaturedImageURL()#" class="img-responsive" alt=""/></a>
			<cfelse>
				<!--- <a href="#cb.linkEntry(entry)#"><img src="#cb.themeRoot()#/includes/images/No_image_available_600_x_450.svg.png" class="img-responsive" alt="" style="margin:0 auto; margin-top:15px;"/></a> --->
			</cfif>
		</div>
		<cfif #entry.getfeaturedImageURL()# NEQ ''>
			<a class="blog blue" href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#">#entry.getTitle()#</a>
			<h3><a href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#">#entry.getTitle()#</a></h3>
		<cfelse>
			<h3><a href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#">#entry.getTitle()#</a></h3>
		</cfif>
		<p> 
			<cfif entry.hasExcerpt()>
				#entry.renderExcerpt()#
				<div class="post-more">
					<a href="#cb.linkEntry( entry )#" title="Read The Full Entry!"><button class="btn btn-success">Read More...</button></a>
				</div>
			<cfelse>
				#entry.renderContent()#
			</cfif>
		</p>
		<div class="blog-poast-info">
			<ul>
				<li><i class="glyphicon glyphicon-user"> </i><a class="admin" href="##"> #entry.getAuthorName()# </a></li>
				<li><i class="glyphicon glyphicon-calendar"> </i>#entry.getDisplayPublishedDate()#</li>
				<li><i class="glyphicon glyphicon-comment"> </i><a href="#cb.linkEntry(entry)###comments" title="View Comments"> #entry.getNumberOfApprovedComments()# Comments</a></li>
				<li><i class="glyphicon glyphicon-eye-open"> </i>#entry.getnumberOfHits()# views</li>
				<cfif cb.themeSetting( "addThisURL" ) NEQ ''>
					<li>
						<div class="addthis_inline_share_toolbox_x89b" data-url="#cb.linkEntry( entry )#" data-title="#entry.getTitle()#"></div>
					</li>
				</cfif>
			</ul>
		</div>
	</div>
	<div class="clearfix"></div>				
</cfoutput>