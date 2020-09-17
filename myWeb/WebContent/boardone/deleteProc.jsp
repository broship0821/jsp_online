<%@page import="boardone.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String pass = request.getParameter("pass");
	BoardDAO dbPro = BoardDAO.getInstance();
	int check = dbPro.deleteArticle(num, pass);
	if(check==1){//삭제 성공시
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<% } else {//수정 실패시 %>
	<script language="JavaScript">
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
<% } %>