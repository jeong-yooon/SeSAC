<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// out.println(request.getParameter("r-name")); // 권장 x
	String name = request.getParameter("r-name");
	String phone = request.getParameter("r-phone");
	String mail = request.getParameter("r-mail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
name: <%=name %> <br/>
phone: <%=phone %> <br/>
mail: <%=mail %> <br/>
</body>
</html>