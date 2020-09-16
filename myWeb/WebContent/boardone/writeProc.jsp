<%@page import="boardone.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="article" scope="page" class="boardone.BoardVO"/>
<jsp:setProperty name="article" property="*"/>
<%
	article.setRegdate(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	BoardDAO dbPro = BoardDAO.getInstance();
	dbPro.insertArticle(article);
	response.sendRedirect("list.jsp");
%>