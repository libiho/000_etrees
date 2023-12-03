
//주소 숫자 지정
$j(function() {
	$j("#postNo").on("input", function() {
		let formattedPostNo = this.value.replace(/\D/g, ""); // 입력된 값 중 숫자가 아닌 문자 제거
		if (formattedPostNo.length > 5) {
			formattedPostNo = formattedPostNo.slice(0, 3) + "-" + formattedPostNo.slice(3, 6); // xxx-xxx 형식으로 변경
		}
		this.value = formattedPostNo;
	});
});


//핸드폰 중간번호 지정
$j(function() {

	var $phoneNum = $j('#onlyNumFourth');

	$j('.onlyNum4').on('input', function(event) {
		let value = $j(this).val();
		value = value.replace(/\D/g, ''); // 입력된 값 중 숫자가 아닌 문자 제거
		value = value.substring(0, 4); // 처음부터 4자리까지의 값 유지
		$j(this).val(value); // 결과를 다시 입력란에 적용

		// 모든 입력 필드가 4글자인 경우 버튼 활성화
		if ($j('.onlyNum4').toArray().every(field => $j(field).val().length === 4)) {
			$j("#userInsertBtn").prop("disabled", false);
			$phoneNum.hide();
		} else {
			$j("#userInsertBtn").prop("disabled", true);
			$phoneNum.show();
			$phoneNum.css("color", "red").text("각 번호 4글자 작성해주십시오");
		}
	});

	$j('.onlyNum4').on('keypress', function(event) {
		if ($j(this).val().length >= 4) {
			event.preventDefault(); // 4자리 이후의 입력을 방지
		}
	});


});



//비밀번호 체크
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



//아이디 중복 확인
$j(function() {

	$j("#checkId").click(
		function() {

			let userId = $j("#userId").val();

			$j("#checkId").prop("disabled", true);

			$j.ajax({
				type: 'POST',
				url: "/member/memberCheckId.do",
				data: {
					"userId": userId
				},
				success: function(data) {
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
				error: function(error) {
					alert(error);
				},
				complete: function() {
					// 요청 완료 후 버튼 다시 활성화
					$j("#checkId").prop("disabled", false);
				}
			});
		});
});


//비밀번호 글자수
$j(function() {
	const $numCheck = $j('#numCheck');
	const $userInsertBtn = $j('#userInsertBtn');

	$j('#userPwd').on('input', function() {
		const password = $j(this).val();

		if (password.length < 6) {
			$numCheck.show().css("color", "red").text("6글자 이상 입력해주세요");
		} else if (password.length > 12) {
			$numCheck.show().css("color", "red").text("12글자를 초과했습니다");
		} else {
			$numCheck.hide();
		}
	});
});


