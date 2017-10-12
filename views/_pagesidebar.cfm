<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event("cbui_BeforeSideBar")#
	<div class="blo-top1">
		<div class="tech-btm">
			<ul>
				#cb.subPageMenu( page=cb.getCurrentPage(), type="li" )#
			</ul>
		</div>
	</div>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_afterSideBar")#
</cfoutput>