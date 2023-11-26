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

<script type="text/javascript">






$j(document).ready(function(){
	
	
	$j("#userInsertBtn").on("click",function(){

		var $frm = $j('.memberInsertForm :input');

		console.log($frm);

		var param = $frm.serialize();
		
		console.log(param);
		
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
				setTimeout(function(){
	                location.href = "/board/boardList.do";
	            }, 3000);
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

<!-- ### 4글자 이하는 입력안되게 설정 -->
							<td><select name="userPhone1" id="firstPhone">
									<c:forEach items="${uniquePhoneList}" var="phone">
										<option value="${phone.codeName}" >${phone.codeName}</option>
									</c:forEach>
							</select> -<input id="userPhone2" name="userPhone2" class="onlyNum4"
								style="width: 50px" required>-<input id="userPhone3"
								class="onlyNum4" name="userPhone3" style="width: 50px" required></td>
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
				<td align="right" colspan="2"><button type="submit"
						id="userInsertBtn">join</button></td>

			</tr>
		</table>
	</form>




	<script type="text/javascript">

//주소 숫자 지정
$j(function () {
	$j("#postNo").on("input", function () {
		let formattedPostNo = this.value.replace(/\D/g, ""); // 입력된 값 중 숫자가 아닌 문자 제거
		if (formattedPostNo.length > 5) {
			formattedPostNo = formattedPostNo.slice(0, 3) + "-" + formattedPostNo.slice(3, 6); // xxx-xxx 형식으로 변경
		}
		this.value = formattedPostNo;
	});
});


//핸드폰 중간번호 지정
$j(function () {
	$j('.onlyNum4').on('input', function (event) {
		let value = $j(this).val();
		value = value.replace(/\D/g, ''); // 입력된 값 중 숫자가 아닌 문자 제거
		value = value.substring(0, 4); // 처음부터 4자리까지의 값 유지
		$j(this).val(value); // 결과를 다시 입력란에 적용
	});

	$j('.onlyNum4').on('keypress', function (event) {
		if ($j(this).val().length >= 4) {
			event.preventDefault(); // 4자리 이후의 입력을 방지
		}
	});
});



//비밀번호 체크
$j(function () {
	const $userPwd = $j('#userPwd');
	const $checkPwd = $j('#checkPwd');
	const $pwdCheckResult = $j('#pwdCheckResult');

	$checkPwd.keyup(function () {
		if ($userPwd.val() === $checkPwd.val()) {
			$pwdCheckResult.show();
			$pwdCheckResult.css("color", "green").text("비밀번호가 같습니다");
		} else {
			$pwdCheckResult.show();
			$pwdCheckResult.css("color", "red").text("비밀번호가 일치하지 않습니다");
		}
	});
});



//아이디 중복 확인
$j(function () {

	$j("#checkId").click(
		function () {

			let userId = $j("#userId").val();

			$j("#checkId").prop("disabled", true);

			$j.ajax({
				type: 'POST',
				url: "/member/memberCheckId.do",
				data: {
					"userId": userId
				},
				success: function (data) {
					if (data === "Y") {
						console.log("성공");
						$j('#checkResult').show();
						$j("#checkResult").css("color", "green")
							.text("사용 가능한 ID입니다");
						$j("#userPwd").trigger("focus");
						$j("#checkId").prop("disabled", false);
					} else {
						console.log("실패");
						$j('#checkResult').show();
						$j("#checkResult").css("color", "red")
							.text("중복된 ID 입니다");
						$j("#userId").val("").trigger("focus");

					}
				},
				error: function (error) {
					alert(error);
				},
				complete: function () {
					// 요청 완료 후 버튼 다시 활성화
					$j("#checkId").prop("disabled", false);
				}
			});
		});
});


//비밀번호 글자수
$j(function () {
    const $numCheck = $j('#numCheck');
    const $userInsertBtn = $j('#userInsertBtn');

    $j('#userPwd').on('input', function () {
        const password = $j(this).val();

        if (password.length < 6) {
            $numCheck.show().css("color", "red").text("6글자 이상 입력해주세요");
        } else if (password.length > 12) {
            $numCheck.show().css("color", "red").text("12글자를 초과했습니다");
        } else {
            $numCheck.hide();
           // $userInsertBtn.prop("disabled", false); // 활성화
        }
    });
});

</script>




</body>
</html>