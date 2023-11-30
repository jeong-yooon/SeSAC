<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#com {
	transform: scaleX(-1);
}

#message {
	font-size: 2.0em;
}
</style>
</head>
<body>
<table>
	<caption>결과</caption>
<tr>
	<th>You</th>
	<th rowspan="2"> vs </th>
	<th>Com</th>
</tr>
<tr>
	<td><img src="../img/${you}.png" id="you" /></td>
	<td><img src="../img/${com}.png" id="com" /></td>
</tr>
<tr>
	<td colspan="3"><div id="message">${result}</div></td>
</tr>
</table>
</body>
</html>