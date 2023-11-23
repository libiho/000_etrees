
// 주소 숫자 지정
$j(function () {
	$j("#postNo").on("input", function () {
		let formattedPostNo = this.value.replace(/\D/g, ""); // 입력된 값 중 숫자가 아닌 문자 제거
		if (formattedPostNo.length > 5) {
			formattedPostNo = formattedPostNo.slice(0, 3) + "-" + formattedPostNo.slice(3, 6); // xxx-xxx 형식으로 변경
		}
		this.value = formattedPostNo;
	});
});


// 핸드폰 중간번호 지정
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



// 비밀번호 체크
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



// 아이디 중복 확인
$j(function () {

	$j("#userInsertBtn")
		.prop("disabled", true);
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


