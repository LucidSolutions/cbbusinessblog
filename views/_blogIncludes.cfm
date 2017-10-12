<cfoutput>
<title>#cb.getContentTitle()#</title>

<!--- ********************************************************************************* --->
<!--- 					META TAGS														--->
<!--- ********************************************************************************* --->
<meta charset="utf-8" /> 
<meta name="generator" 	 	content="ContentBox powered by ColdBox" />
<meta name="robots" 	 	content="index,follow" />
<meta name="viewport" 		content="width=device-width, initial-scale=1">
<meta name="description" 	content="#cb.getContentDescription()#" />
<meta name="keywords" 	 	content="#cb.getContentKeywords()#" />

#cb.getOpenGraphMeta()#

<!--- Base HREF for SES enabled URLs --->
<base href="#cb.siteBaseURL()#" />

<!--- ********************************************************************************* --->
<!--- 					RSS DISCOVERY													--->
<!--- ********************************************************************************* --->
<cfif cb.themeSetting( "rssDiscovery", true )>
	<link rel="alternate" type="application/rss+xml" title="Recent Blog Updates" href="#cb.linkRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Blog Comment Updates" href="#cb.linkRSS(comments=true)#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Page Updates" href="#cb.linkPageRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Page Comment Updates" href="#cb.linkPageRSS(comments=true)#" />	
	<link rel="alternate" type="application/rss+xml" title="Recent Content Updates" href="#cb.linkSiteRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Content Comment Updates" href="#cb.linkSiteRSS(comments=true)#" />
	<cfif cb.isEntryView()>
		<link rel="alternate" type="application/rss+xml" title="Entry's Recent Comments" href="#cb.linkRSS( comments=true, entry=cb.getCurrentEntry() )#" />
	</cfif>
</cfif>

<!--- ********************************************************************************* --->
<!--- 					CSS 															--->
<!--- ********************************************************************************* --->

<!--- Swatch and Skin --->

<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="#cb.themeRoot()#/includes/css/bootstrap.css?v=1" />
<link rel="stylesheet" href="#cb.themeRoot()#/includes/css/style.css?v=1" />
<script src="#cb.themeRoot()#/includes/js/jquery-1.11.1.min.js" ></script>
<script src="#cb.themeRoot()#/includes/js/bootstrap.min.js" ></script>
<cfif cb.themeSetting( "addThisURL" ) NEQ ''>
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js##pubid=#cb.themeSetting( "addThisURL" )#"></script>
</cfif>

<!-- endinjector -->

<!---<cfif len( cb.themeSetting( 'cssStyleOverrides' ) )>
	<style>
		#cb.themeSetting( 'cssStyleOverrides' )#
	</style>	
</cfif>--->

<!--- ********************************************************************************* --->
<!--- 					JAVASCRIPT														--->
<!--- ********************************************************************************* --->
<!-- injector:js -->

<!-- endinjector -->
</cfoutput>