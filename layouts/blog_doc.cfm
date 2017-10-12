<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<!--- Page Includes --->
	#cb.quickView( "_blogIncludes" )#

	<!--- ContentBoxEvent --->
	#cb.event("cbui_beforeHeadEnd")#
</head>
<body>
	<!--- ContentBoxEvent --->
	#cb.event("cbui_afterBodyStart")#

	<!--- Main Body --->
	<div class="technology">
		<div class="container">			
			<div class="col-md-9 technology-left">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_beforeContent")#

				<!--- Main View --->
				#cb.mainView( args={ sidebar=true, print=true } )#

				<!--- ContentBoxEvent --->
				#cb.event("cbui_afterContent")#
			</div>
		</div>
	</div>
	#cb.quickView(view='_footer')#
	
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeBodyEnd" )#
</body>
</html>
</cfoutput>