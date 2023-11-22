<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">
.tCenter {
	text-align: center;
}
</style>

<script>
	$j(function() {

		$j("#userInsertBtn")
		.prop("disabled", true);
			$j("#checkId").click(
					function() {

						let userId = $j("#userId").val();
						
						$j("#checkId").prop("disabled", true);

						$j.ajax({
							type : 'POST',
							url : "/member/memberCheckId.do",
							data : {
								"userId" : userId
							},
							success : function(data) {
								if (data === "Y") {
									console.log("성공");
									$j('#checkResult').show();
									$j("#checkResult").css("color", "green")
											.text("사용 가능한 ID입니다");
									$j("#userPwd").trigger("focus");
									// 사용 가능한 경우 회원가입 버튼 활성화
									$j("#userInsertBtn")
											.prop("disabled", false);
									 // $j("#userId").prop("readonly", true);
								} else {
									console.log("실패");
									$j('#checkResult').show();
									$j("#checkResult").css("color", "red")
											.text("중복된 ID 입니다");
									$j("#userId").val("").trigger("focus");
									
								}
							},
							error : function(error) {
								alert(error);
							},
							complete : function() {
								// 요청 완료 후 버튼 다시 활성화
								$j("#checkId").prop("disabled", false);
							}
						});
					});
	});
</script>

<script type="text/javascript">



$j(function() {
    const $userPwd = $j('#userPwd'); 
    const $checkPwd = $j('#checkPwd'); 
    const $pwdCheckResult = $j('#pwdCheckResult'); 

    $checkPwd.keyup(function() {
        if ($userPwd.val() === $checkPwd.val()) { 
            $pwdCheckResult.show();
            $pwdCheckResult.css("color", "green").text("비밀번호가 같습니다");
        } else {
            $pwdCheckResult.show();
            $pwdCheckResult.css("color", "red").text("비밀번호가 일치하지 않습니다");
        }
    });
});


</script>

</head>
<body>
	<br>

	<table align="center">

		<tr>
			<td align="left" colspan="2"><a href="/board/boardList.do">List</a></td>
		</tr>

		<form action="" method="post" id="memberInsertForm">
		<tr>
			<td>
				<table align="center" border="2px">

					<td width="150px" class="tCenter">id</td>
					<td width="400px"><input type="text" id="userId" name="userId">
						<button id="checkId" type="button">중복확인</button>
						<div id="checkResult" style="font-size: 0.8em; display: none"></td>
					</tr>
					<tr>
						<td class="tCenter">pw</td>
						<!-- ### 6~12자리 ,  -->
						<td><input type="password" id="userPwd" name="userPwd"
							required></td>
					</tr>
					<tr>
						<td class="tCenter">pw check</td>
						<td><input type="password" id="checkPwd" required>
						<div id="pwdCheckResult" style="font-size: 0.8em; display: none">
						</td>
					</tr>
					<tr>
						<td class="tCenter" required>name</td>
						<td><input type="text" id="userName" name="userName"></td>
					</tr>
					<tr>
						<td class="tCenter" required>phone</td>
						<td><select name="firstPhone" id="firstPhone">
								<!-- ### 여기 db로 불러오기 -->
								<option value="ko" selected>010</option>
								<option value="us">011</option>

						</select> <!-- ### 각 번호는 4자리 --> -<input type="text" id="middlePhone"
							name="middlePhone" style="width: 50px">-<input
							type="text" id="lastPhone" name="lastPhone" style="width: 50px"></td>
					</tr>
					<tr>
						<td class="tCenter">postNo</td>
						<!-- ### xxx-xxx 형식으로 작성되야함! -->
						<td><input type="text" id="postNo" name="postNo"></td>
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
			<td align="right" colspan="2"><button type="submit"
					id="userInsertBtn">join</button></td>

		</tr>
	</table>
	</form>









</body>
</html>