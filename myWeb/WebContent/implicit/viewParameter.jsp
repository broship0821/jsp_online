<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
	<b>request.getParameter() 메소드 사용</b><br><br>
	name 파라미터 = <%=request.getParameter("name") %><br><br>
	address 파라미터 = <%=request.getParameter("address") %><br><br>
	<br><br><br><br>
	
	<b>request.getParameterValues() 메소드 사용</b><br><br>
	<%
		String[] values = request.getParameterValues("pet");
		if(values!=null){
			for(int i=0;i<values.length;i++){
	%>
				<%=values[i] %>
	<%
			}
		}
	%>
	<br><br><br><br>
	
	<b>request.getParameterNames() 메소드 사용</b><br><br>
	<%
		Map parameterMap = request.getParameterMap();
		Enumeration enumData = request.getParameterNames();
		while(enumData.hasMoreElements()){
			String name = (String)enumData.nextElement();
	%>
			<%=name %> :
	<%
			
			String[] nameParam = (String[])parameterMap.get(name);
			for(int i=0; i<nameParam.length;i++){
	%>
				<%=nameParam[i] %><br>
				
	<%
			}
		}
	%>
</body>
</html>