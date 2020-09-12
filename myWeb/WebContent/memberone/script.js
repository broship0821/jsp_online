function idCheck(id){
	if(id == ""){
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
	}else{
		url="idCheck.jsp?id=" + id;
		window.open(url, "post", "width=300,height=150");
	}
}

function zipCheck(){
	url="zipCheck.jsp?check=y";
	window.open(url, "post", "toolbar=no, width=500, height=300, directories=no status=yes, scrollbars=yes, menubar=no");
}