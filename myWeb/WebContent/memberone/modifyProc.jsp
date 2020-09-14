<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="memberone.StudentDAO"%>
<% StudentDAO dao = StudentDAO.getInstance(); %>
<jsp:useBean id="vo" class="memberone.StudentVO"/>
<jsp:setProperty name="vo" property="*"/>
<%
	String loginID = (String)session.getAttribute("loginID");
	vo.setId(loginID);
	dao.updateMember(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<meta http-equiv="Refresh" content="3;url=login.jsp">
</head>
<body>
	<center>
		<font size="5" face="바탕체">
			<b>회원정보가 수정 되었습니다.</b><br><br>
			3초 후에 회원 페이지로 이동합니다.
		</font>
	</center>
</body>
</html>