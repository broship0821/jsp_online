<%@page import="boardone.BoardVO"%>
<%@page import="boardone.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="view/color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script.js"></script>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try{
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.updateGetArticle(num);
%>
<body bgcolor="<%=bodyback_c%>">
	<center><b>글수정</b></center><br><br>
	<form method="post" name="writeForm" action="updateProc.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
		<table width="400" border="1" cellpadding="0" cellspacing="0" align="center" bgcolor="<%=bodyback_c %>">
			<tr>
				<td width="70" bgcolor="<%=value_c %>" align="center">이름</td>
				<td width="330" align="left">
					<input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>"/>
					<input type="hidden" name="num" value="<%=article.getNum() %>">
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c %>" align="center">제목</td>
				<td width="330" align="left">
					<input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>"/>
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c %>" align="center">Email</td>
				<td width="330" align="left">
					<input type="text" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>"/>
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c %>" align="center">내  용</td>
				<td width="330" align="left">
					<textarea rows="13" cols="40" name="content"><%=article.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c %>" align="center">비밀번호</td>
				<td width="330" align="left">
					<input type="password" size="8" maxlength="12" name="pass" />
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" bgcolor="<%=value_c %>">
					<input type="submit" value="글수정"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="목록" onclick="window.location.href='list.jsp?pageNum=<%=pageNum%>'"/>
				</td>
			</tr>
		</table>
	</form>
	<%}catch(Exception e){} %>
</body>
</html>