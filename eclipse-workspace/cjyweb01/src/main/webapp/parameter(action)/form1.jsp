<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		ul { list-style:none;}
		li { line-height:50px; }
		label {
			width:60px;
			float:left;
		}
	</style>
</head>
<body>
	<h1>예약 정보</h1>
	<form action="process1.jsp" method="post">
		<ul>
			<li>
				<label for="r-name">이 름</label>
				<input type="text" id="r-name" name="r-name" autofocus="autofocus" required="required">
			</li>
			<li>
				<label for="r-phone">휴대폰</label>
				<input type="tel" id="r-phone" name="r-phone" required="required">
			</li>
			<li>
				<label for="r-email">이메일</label>
				<input type="email" id="r-email" name="r-mail" required="required">
			</li>
			<li>
				<input type="submit" value="예약하기">
		</ul>
	</form>
</body>
</html>