<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <table align="center" border="1px">
	<form action="/recruit/check" method="post"  onsubmit="return checkNull();">

        <tr>
            <th>
                이름
            </th>
            <td>
                <input type="text" name="name" id="" autofocus>
            </td>
        </tr>
        <tr>
            <th>휴대폰번호</th>
            <td>
                <input type="text" name="phone" oninput="autoHyphen(this)" maxlength="13">
            </td>
        </tr>
        <tr>
            <th colspan="2">
            <input type="submit" value="입사지원" id="btn">
            </th>
        </tr>

	</form>
    </table>


<script>


	function checkNull(event){

        
        let name = $j('input[name="name"]').val();
		let phone = $j('input[name="phone"]').val();
        

        if(validatePhoneNumber(phone)){
            alert('번호 다시 입력해주세요')
            return false;
        } else{
          console.log('정규식 번호 통과');
        }
        
        
        if(name === null || name === ''){
            alert('이름 입력해주세요');
            return false;
		}
		
        if(phone === null || phone === ''){
            alert('비밀번호 입력해주세요');
            return false;
        }

		
	}


function validatePhoneNumber(phoneNumber) {
    // 공백 제거
    phoneNumber = phoneNumber.replace(/\s-/g, '');

    console.log("phoneNumber : "+phoneNumber);

    const phonePattern = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;	

    console.log(phonePattern.test(phoneNumber));

    return !phonePattern.test(phoneNumber);
}



const autoHyphen = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}


</script>	
	


</body>
</html>