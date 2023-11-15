<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Map<String, String[]>paramMap = request.getParameter("hobby");
	// out.println(request.getParameter("r-name")); // 권장 x
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String field = request.getParameter("field");
	String hobby = request.getParameter("hobby");
	String gender = request.getParameter("gender");
	String motive = request.getParameter("motive");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1, td{
		text-align: center;
	}
	table{
		
	}
</style>
</head>
<body>
<%
	for(String key : paramMap.keySet()){
		String[] values = paramMap.get(key);
		if (values.length > 1) {
			for(int i=0; i<values.length; i++){
				out.println(key + "[" + i + "]:" + values[i]);
			}
		} else {
			out.println(key + ":" + values[0] + "</br>");
		}
	}
%>
name: <%=name %> <br/>
phone: <%=phone %> <br/>
field: <%=field %> <br/>
hobby: <%=hobby %> <br/>
gender: <%=gender %> <br/>
motive: <%=motive %> <br/>
</body>
</html>