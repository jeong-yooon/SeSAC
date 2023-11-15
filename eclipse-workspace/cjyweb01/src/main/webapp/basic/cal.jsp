<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // scriptlet
	Calendar c = Calendar.getInstance(); // 이번달
	Calendar c2 = Calendar.getInstance(); // 저번달
	Calendar c3 = Calendar.getInstance(); // 다음달

	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH)+1;
%>
<table border="1">
	<caption><%=year%>, <%=month%></caption>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
	<!-- <td colspan="7">-----------------------</td> -->
	</tr>
	<tr>
	<%
	c.set(year, month-1, 1);
	c2.set(year, month-2,1);
    c3.set(year, month, 1);
    
	int week = c.get(Calendar.DAY_OF_WEEK);
	int nextMonthWeek = c3.get(Calendar.DAY_OF_WEEK);
	System.out.println(week);
	int endday=c.getActualMaximum(Calendar.DAY_OF_MONTH);
	int lastendday=c2.getActualMaximum(Calendar.DAY_OF_MONTH);
	System.out.println(endday);
	System.out.println(lastendday);

	for(int w=week-1; w > 0; w--) {%>
		<td><%= lastendday-w+1%></td>
	<%}
	for(int d=1, w=week; d<=endday; d++, w++) {%>
		<td><%= d %></td>
		<% if (w % 7 == 0)%></tr>
	<%}%>
	<%for(int w=1; w<3; w++) {%>
		<td><%= w%></td>
	<%}%>
</table>
</body>
</html>