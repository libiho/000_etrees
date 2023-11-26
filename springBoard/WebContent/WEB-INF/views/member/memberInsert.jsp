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
				alert("ȸ������ ����");
				
				alert("�޼���:"+data.success);
				
				/* ### ����Ʈ�� �Ȱ��°� �ذ� */
				setTimeout(function(){
	                location.href = "/board/boardList.do";
	            }, 3000);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("ȸ������ ����");
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
							value="�ߺ�Ȯ��">

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

<!-- ### 4���� ���ϴ� �Է¾ȵǰ� ���� -->
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
								placeholder="���ڷθ� �Է����ּ���"></td>
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

//�ּ� ���� ����
$j(function () {
	$j("#postNo").on("input", function () {
		let formattedPostNo = this.value.replace(/\D/g, ""); // �Էµ� �� �� ���ڰ� �ƴ� ���� ����
		if (formattedPostNo.length > 5) {
			formattedPostNo = formattedPostNo.slice(0, 3) + "-" + formattedPostNo.slice(3, 6); // xxx-xxx �������� ����
		}
		this.value = formattedPostNo;
	});
});


//�ڵ��� �߰���ȣ ����
$j(function () {
	$j('.onlyNum4').on('input', function (event) {
		let value = $j(this).val();
		value = value.replace(/\D/g, ''); // �Էµ� �� �� ���ڰ� �ƴ� ���� ����
		value = value.substring(0, 4); // ó������ 4�ڸ������� �� ����
		$j(this).val(value); // ����� �ٽ� �Է¶��� ����
	});

	$j('.onlyNum4').on('keypress', function (event) {
		if ($j(this).val().length >= 4) {
			event.preventDefault(); // 4�ڸ� ������ �Է��� ����
		}
	});
});



//��й�ȣ üũ
$j(function () {
	const $userPwd = $j('#userPwd');
	const $checkPwd = $j('#checkPwd');
	const $pwdCheckResult = $j('#pwdCheckResult');

	$checkPwd.keyup(function () {
		if ($userPwd.val() === $checkPwd.val()) {
			$pwdCheckResult.show();
			$pwdCheckResult.css("color", "green").text("��й�ȣ�� �����ϴ�");
		} else {
			$pwdCheckResult.show();
			$pwdCheckResult.css("color", "red").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		}
	});
});



//���̵� �ߺ� Ȯ��
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
						console.log("����");
						$j('#checkResult').show();
						$j("#checkResult").css("color", "green")
							.text("��� ������ ID�Դϴ�");
						$j("#userPwd").trigger("focus");
						$j("#checkId").prop("disabled", false);
					} else {
						console.log("����");
						$j('#checkResult').show();
						$j("#checkResult").css("color", "red")
							.text("�ߺ��� ID �Դϴ�");
						$j("#userId").val("").trigger("focus");

					}
				},
				error: function (error) {
					alert(error);
				},
				complete: function () {
					// ��û �Ϸ� �� ��ư �ٽ� Ȱ��ȭ
					$j("#checkId").prop("disabled", false);
				}
			});
		});
});


//��й�ȣ ���ڼ�
$j(function () {
    const $numCheck = $j('#numCheck');
    const $userInsertBtn = $j('#userInsertBtn');

    $j('#userPwd').on('input', function () {
        const password = $j(this).val();

        if (password.length < 6) {
            $numCheck.show().css("color", "red").text("6���� �̻� �Է����ּ���");
        } else if (password.length > 12) {
            $numCheck.show().css("color", "red").text("12���ڸ� �ʰ��߽��ϴ�");
        } else {
            $numCheck.hide();
           // $userInsertBtn.prop("disabled", false); // Ȱ��ȭ
        }
    });
});

</script>




</body>
</html>