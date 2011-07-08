$(document).ready(function() {

	//When page loads...
	$(".account_tab_content").hide(); //Hide all content
	$("ul.account_tabs li:first").addClass("active").show(); //Activate first tab
	$(".account_tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.account_tabs li").click(function() {

		$("ul.account_tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".account_tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});