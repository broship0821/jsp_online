<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1번 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<link href="style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="script.js"></script>
<!-- 2번 -->
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
						<input value="검색" type="button" onClick="#"/>
					</td>
				</tr>
			</table>
		</form>
		<table>
		<!-- 3번 -->
			<tr>
				<td align="center">
					<a href="javascript:this.close();">닫기</a>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>