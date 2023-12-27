<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table align="center" border="1px">
		<form id="myForm" action="/recruit/check" method="post">

			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="" autofocus></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" name="phoneText" oninput="autoHyphen(this)"
					maxlength="13">
                    <input type="hidden" name="phone" value="">
                </td>
			</tr>
			<tr>
				<th colspan="2"><input type="button" value="입사지원" id="btn">
				</th>
			</tr>

		</form>
	</table>


	<script>


	function checkNull(event){

        
        let name = $j('input[name="name"]').val();
		let phone = $j('input[name="phoneText"]').val();
		
        
    
    if(validatePhoneNumber(phone)){
        alert('번호 다시 입력해주세요')
        $j('input[name="phone"]').focus();
		let btn = $j('#btn');
        btn.disabled = true;
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
	
	
function btnDisabled(){
	btn.disabled = true;
}

function btnActive(){
	btn.disabled = false;
	
}

function postData(){
    let form = document.getElementById('myForm');
   
        form.submit();

}


function validatePhoneNumber(phoneNumber) {
    
    let phone = $j('input[name="phone"]');
    
    phoneNumber = phoneNumber.replace(/-/g, '');

    console.log("phoneNumber : "+phoneNumber);

    phone.val(phoneNumber);

    console.log(phone.val());
    

    const phonePattern = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;	


    return !phonePattern.test(phoneNumber);
}




const autoHyphen = (target) => {
    	let btn = $j('#btn');
		btn.disabled = false;
 target.value = target.value
   .replace(/[^0-9]/g, '')
   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}



$j('#btn').click(function(){
	checkNull();
	postData();
})


</script>



</body>
</html>