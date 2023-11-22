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
$j(function(){
 
    
    $j("#checkId").click(function(){
    
        let $userId = $j("#userId").val();
        
       console.log(userId);
         
        $j.ajax({
            type:'POST', 
            url:"/member/memberCheckId.do", 
            data: {"userId":userId}, 
            success: function(data){ 
                if(data == "Y"){ // 만약 성공할시
                    $j('#checkResult').show();
					$j("#checkResult").css("color", "green").text("사용가능"); 
                    $j("#userPwd").trigger("focus");
                 
             }else{ // 만약 실패할시
            	    $j('#checkResult').show();
					$j("#checkResult").css("color", "red").text("아이디 중복"); 
                     $j("#userId").val("").trigger("focus");
             }
                 
         },
            error : function(error){alert(error);}
        });
        
    });
    
});
 
 
</script>
</head>
<body>
<br>

	<table align="center" >

		<tr>
			<td align="left" colspan="2"><a href="/board/boardList.do">List</a></td>
		</tr>

		<form action="" method="post">

			<tr>
				<td>
					<table align="center" border="2px">

						<td width="150px" class="tCenter">id</td>
						<td width="400px"><input type="text" id="userId"
							name="userId">
							<button id="checkId" type="button">중복확인</button> <div id="checkResult" style="font-size:0.8em; display:none"></td>
						<!-- ### 중복확인 안하면 회원가입 불가 
				### 중복되면 alert창 또는 중복메세지 출력
				-->
			</tr>
			<tr>
				<td class="tCenter">pw</td>
				<!-- ### 6~12자리 ,  -->
				<td><input type="password" id="userPwd" name="userPwd" required></td>
			</tr>
			<tr>
				<td class="tCenter">pw check</td>
				<td><input type="password" id="checkPwd" required></td>
				<!-- ### pw랑 다르면 알람창 또는 다른메세지 출력 -->
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
					name="middlePhone" style="width: 50px">-<input type="text"
					id="lastPhone" name="lastPhone" style="width: 50px"></td>
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
		</form>
	</table>
	</td>
	<tr>
		<td align="right" colspan="2">join</td>

	</tr>
	</table>










</body>
</html>