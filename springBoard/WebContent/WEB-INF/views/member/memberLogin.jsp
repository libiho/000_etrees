<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	         
	       var $frm = $j('.loginCheck :input');
			var param = $frm.serialize();

	        $j.ajax({
	            url: "/member/memberLoginAction.do",
	            dataType: "json",
	            type: "POST",
	            data: 
	            	param
	           
	            ,
	            success: function(data, textStatus, jqXHR) {
	             
	                
	                if (data.success === 'Y') {
	                    alert("로그인 성공");
	                    location.href = "/board/boardList.do";
	                } else {
	                    alert("로그인 실패 다시 입력해주십시오");
	                }
	                
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