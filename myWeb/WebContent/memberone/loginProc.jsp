<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="memberone.StudentDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int check = dao.loginCheck(id, pass);
%>

<%
	if(check==1){//로그인 성공
		session.setAttribute("loginID", id);
		response.sendRedirect("login.jsp");
	} else if(check==0){//비밀번호 오류
%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
<%
	} else {//존재하지 않는 아이디
%>
		<script>
			alert("존재하지 않는 아이디 입니다.");
			history.go(-1);
		</script>
<%
	}
%>