<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/recruit.js"></script>


</head>
<body>


	<table align="center" border="1px">
		<form id="myForm" action="/recruit/check" method="post">

			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="" autofocus></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" name="phoneHyphen" oninput="autoHyphen(this)"
					maxlength="13">
                    <input type="hidden" name="phone" value="">
                </td>
			</tr>
			<tr>
				<th colspan="2"><input type="button" value="입사지원" id="btn">
				</th>
			</tr>

		</form>
	</table>


	<script>



</script>



</body>
</html>