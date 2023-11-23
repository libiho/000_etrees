<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<br>

		<form class="loginCheck">
	<table align="center">
		<tr>
			<td>
				<table border="1">
					<td align="center" width="100px">id</td>
					<td width="250px"><input type="text" id="userId" name="userId"
						required></td>
					</tr>

					<tr>
						<td align="center">pw</td>
						<td><input type="password" id="userPwd" name="userPwd"
							required></td>
					</tr>
				</table>
			</td>
		<tr>
			<td colspan="2" align="right"><input type="submit"
				id="submitBtn" value="login"></td>
		</tr>

	</table>
		</form>

	<script type="text/javascript">
	$j(document).ready(function() {

	    $j("#submitBtn").on("click", function() {
	    	
	    	$j(this).prop('disabled', true);
	    	/*
	          var userId = $j('#userId').val();
	        var userPwd = $j('#userPwd').val();
	        */	       
	       var $frm = $j('.loginCheck :input');
			var param = $frm.serialize();

	        $j.ajax({
	            url: "/member/memberLoginAction.do",
	            dataType: "json",
	            type: "POST",
	            data: 
	            	param
	            	/*  
	            {
	                "userId": userId,
	                "userPwd": userPwd
	            }
	            	*/
	            ,
	            success: function(data, textStatus, jqXHR) {
	                alert("로그인 성공");
	                alert("메세지:" + data.success);
	                location.href = "/board/boardList.do";
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                alert("로그인 실패");
	            },
	            complete: function() {
	                // AJAX 요청이 완료되면 버튼 다시 활성화
	                $j("#submitBtn").prop('disabled', false);
	            }
	        });
	    });
	});

	</script>

</body>
</html>