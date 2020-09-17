<%@page import="boardone.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="article" scope="page" class="boardone.BoardVO"/>
<jsp:setProperty name="article" property="*"/>
<%
	String pageNum = request.getParameter("pageNum");
	BoardDAO dbPro = BoardDAO.getInstance();
	int check = dbPro.updateArticle(article);
	if(check==1){//수정 성공시
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<% } else {//수정 실패시 %>
	<script language="JavaScript">
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
<% } %>