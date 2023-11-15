<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reserv" class="beans.Reservation" scope="page"/>
<jsp:setProperty property="*" name="reserv"/>
<%-- 

	beans.Reservation reserv = new beans.Reservation();
	reserv.setName(request.getParameter("name"));
	reserv.setPhone(request.getParameter("phone"));
	reserv.setEmail(request.getParameter("email"));

 --%>
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
name: <%=reserv.getName() %> <br/>
phone: <%=reserv.getPhone() %> <br/>
mail: <%=reserv.getEmail() %> <br/>
</body>
</html>