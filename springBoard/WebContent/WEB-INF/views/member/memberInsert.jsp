<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.tCenter {
	text-align: center;
}
</style>

<script
	src="${pageContextpageContext.request.contextPath}/resources/js/member.js"></script>


<script type="text/javascript">






$j(document).ready(function(){
	
	
	$j("#userInsertBtn").on("click",function(){

		var $frm = $j('.memberInsertForm :input');


		var param = $frm.serialize();
		
		
		$j.ajax({
		    url : "/member/memberInsertAction.do",
		    dataType: "json",
		    type: "POST",
		    data : param,
		    success: function(data, textStatus, jqXHR)
		    {
				alert("회원가입 성공");
				
				alert("메세지:"+data.success);
				
				/* ### 리스트로 안가는거 해결 */
				 window.location.href = "/board/boardList.do";
	           
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("회원가입 실패");
		    }
		});
	});
});




</script>











</head>
<body>
	<br>

	<form class="memberInsertForm">
		<table align="center">

			<tr>
				<td align="left" colspan="2"><a href="/board/boardList.do">List</a></td>
			</tr>

			<tr>
				<td>
					<table align="center" border="2px">

						<td width="150px" class="tCenter">id</td>
						<td width="300px"><input type="text" id="userId"
							name="userId" required> <input type="button" id="checkId"
							value="중복확인">

							<div id="checkResult" style="font-size: 0.8em; display: none"></td>

						</tr>
						<tr>
							<td class="tCenter">pw</td>
							<td><input type="password" id="userPwd" name="userPwd"
								required>
								<div id="numCheck" style="font-size: 0.8em; display: none"></td>
						</tr>
						<tr>
							<td class="tCenter">pw check</td>
							<td><input type="password" id="checkPwd" required>
								<div id="pwdCheckResult" style="font-size: 0.8em; display: none"></td>
						</tr>
						<tr>
							<td class="tCenter">name</td>
							<td><input type="text" id="userName" name="userName"
								required></td>
						</tr>
						<tr>
							<td class="tCenter" required>phone</td>

							<td><select name="userPhone1" id="firstPhone">
									<c:forEach items="${uniquePhoneList}" var="phone">
										<option value="${phone.codeName}" >${phone.codeName}</option>
									</c:forEach>
							</select> -<input id="userPhone2" name="userPhone2" class="onlyNum4 middleNum"
								style="width: 50px" required>-<input id="userPhone3"
								class="onlyNum4 lastNum" name="userPhone3" style="width: 50px" required>
								<div id="onlyNumFourth" style="font-size: 0.8em; display: none"></td></td>
						</tr>
						<tr>
							<td class="tCenter">postNo</td>
							<td><input type="text" id="postNo" name="postNo"
								placeholder="숫자로만 입력해주세요"></td>
						</tr>
						<tr>
							<td class="tCenter">address</td>
							<td><input type="text" id="address" name="address"></td>
						</tr>
						<tr>
							<td class="tCenter">company</td>
							<td><input type="text" id="company" name="company"></td>
						</tr>

					</table>
				</td>
			<tr>
				<td align="right" colspan="2"><button type="button"
						id="userInsertBtn">join</button></td>

			</tr>
		</table>
	</form>








</body>
</html>