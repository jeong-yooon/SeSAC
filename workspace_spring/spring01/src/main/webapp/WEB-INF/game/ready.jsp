<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function my_send(you) {
	document.myform.you.value = you;
	document.myform.submit();
}
</script>
</head>
<body>
<form name="myform" action="result" method="post">
가위~ 바위~ 보~!<br/>
<input type="hidden" name="you" />
<img src="../img/scissors.png" onclick="my_send(1)" />
<img src="../img/rock.png"     onclick="my_send(2)" />
<img src="../img/paper.png"    onclick="my_send(3)" />
</form>
</body>
</html>