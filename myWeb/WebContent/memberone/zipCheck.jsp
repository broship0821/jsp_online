<%@page import="memberone.ZipCodeVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberone.StudentDAO"%>
<% StudentDAO dao = StudentDAO.getInstance(); %>
<%
	request.setCharacterEncoding("utf-8");
	String check = request.getParameter("check");
	String dong = request.getParameter("dong");
	Vector<ZipCodeVO> zipcodeList = dao.zipcodeRead(dong);
	int totalList = zipcodeList.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<link href="style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="script.js"></script>
<script>
	function dongCheck(){
		if(document.zipForm.dong.value==""){
			alert("동 이름을 입력하세요");
			document.zipForm.dong.focus();
			return;
		}
		document.zipForm.submit();
	}
	
	function sendAddress(zipcode, sido, gugun, dong, ri, bunji){
		var address = sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
		opener.document.regForm.zipcode.value = zipcode;
		opener.document.regForm.address1.value = address;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<center>
		<b>우편번호 찾기</b>
		<form action="zipCheck.jsp" name="zipForm" method="post">
			<table>
				<tr>
					<td>
						동이름 입력:
						<input name="dong" type="text">
						<input value="검색" type="button" onClick="dongCheck()"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="check" value="n">
		</form>
		<table>
		<%
			if(check.equals("n")){
				if(zipcodeList.isEmpty()){
		%>
					<tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>
		<%
				} else{
		%>
					<tr><td align="center"><br>검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td></tr>
		<%
					for(int i=0;i<totalList;i++){
						ZipCodeVO vo = zipcodeList.elementAt(i); //벡터 안에있는 자료 순서대로 검색
						String tempZipcode = vo.getZipcode();
						String tempSido = vo.getSido();
						String tempGugun = vo.getGugun();
						String tempDong = vo.getDong();
						String tempRi = vo.getRi();
						String tempBunji = vo.getBunji();
						if(tempRi==null) tempRi = " ";
						if(tempBunji==null) tempBunji = " ";
		%>
					<tr><td>
					<a href="javascript:sendAddress('<%=tempZipcode %>', '<%=tempSido %>', '<%=tempGugun %>', '<%=tempDong %>', '<%=tempRi %>', '<%=tempBunji %>')"><%=tempZipcode %>&nbsp;<%=tempSido %>&nbsp;<%=tempGugun %>&nbsp;<%=tempDong %>&nbsp;<%=tempRi %>&nbsp;<%=tempBunji %></a><br>
		<%
					} //end for
				}//end else
			} //end 제일 바깥 if
		%>
		</td></tr>
			<tr>
				<td align="center">
					<a href="javascript:this.close();">닫기</a>
				</td>
			</tr>
		</table>
		
	</center>
</body>
</html>