<cfoutput>
<div class="comment-top">
	<div class="media-left" id="comment_#comment.getCommentID()#">
		<cfif len(comment.getAuthorURL())>
			<a name="comment_#comment.getCommentID()#"></a>
			<a href="##">#cb.quickAvatar(author=comment.getAuthorEmail(),size=70)#</a>
			<a href="<cfif NOT findnocase("http",comment.getAuthorURL())>http://</cfif>#comment.getAuthorURL()#" title="Open #comment.getAuthorURL()#"><i class="icon-link"></i>
			</a>
		</cfif>
	</div>
	<div class="media-body">
		<h4 class="media-heading">
			#comment.getAuthor()#
		</h4>
		<p>
			#comment.getContent()#
		</p>
		#comment.getDisplayCreatedDate()#
	</div>
	<br>
</div>
<div class="clearfix"></div>
</cfoutput>