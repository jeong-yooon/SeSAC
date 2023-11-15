<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#top{
	height: 150px;
	background-color: yellow;
}

#menu{
	width:250px; 
	background-color:red; 
	height:450px;
}

#content{
	background-color:green;
}
</style>
</head>
<body style="margin: 0;">
<%
String msg = "안녕하세요~";
%>
<table style="width: 1180px">
<tr>
	<td id="top" colspan="2"><%@include file="top.jsp"%></td>
</tr>
<tr>
	<td id="menu"><%@include file="menu.jsp"%></td>
	<td id="content"><%@include file="content.jsp"%></td>
</tr>
</table>
</body>
</html>