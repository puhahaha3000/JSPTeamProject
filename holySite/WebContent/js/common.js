function navBtnCngFnc(){
	var navObj = '';
	var locStr = location.pathname;
	
	if (locStr == "/holySite/member/list" 
		|| locStr == "/holySite/member/update" 
		|| locStr == "/holySite/member/add") {
		
		navObj = document.getElementById("navMember");
		
	} else if(locStr == "/holySite/bulletin/list"
	 	|| locStr == "/holySite/bulletin/update"){
		
		navObj = document.getElementById("navBulletin");
	} else if(locStr == "/holySite/notice/list"
		|| locStr == "/holySite/notice/update"){
		
		navObj = document.getElementById("navNotice");
	}

	if(navObj != ''){
		navObj.style.backgroundColor = "#FFFFFF";
		navObj.style.color = "#59b1eb";
	}
}