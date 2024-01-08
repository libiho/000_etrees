<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<script src="${pageContext.request.contextPath}/resources/js/recruit-memberInsert.js"></script>
 -->

<style>

.required::after{
	content: '*';
	color: red;
}

.placeW {
	text-align: right;
	margin-bottom: 20px;
	margin-right: 300px;
}

table {
	margin-top: 30px;
	margin-bottom: 30px;
}

.placeC {
	text-align: center;
}

.table-Width {
	width: 800px;
}

h3 {
	margin-left: 300px;
}

.checkSize {
	width: 15px;
}

.selectSize {
	width: 50px;
}

.sameWidth {
	width: 170px;
}
</style>
</head>
<body>
	<h2 style="text-align: center;">입사지원서</h2>

	<br>
	<fieldset>

        <!-- 경력 - 자격증 제외 나머지는 필수 항목  -->

		<input type="hidden" name="sumbit" value="recruitVo.sumbit">

		<table align="center" border="1px">
			<tr>
				<th>이름<span class="required"></span></th>
				<td><input type="text" name="name" class="input-field" value="${recruitVo.name}"></td>
				<th>생년월일<span class="required"></span></th>
				<td><input type="hidden" name="birth">
					<input type="text" class="input-field" name="birthHyphen"  maxlength="8" oninput="birthHyphen(this)"></td>
			</tr>
			<tr>
				<th>성별<span class="required"></span></th>
				<td><select name="gender" class="input-field">
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select></td>
				<th>연락처<span class="required"></span></th>
					<td><input type="text" class="input-field" name="phoneHyphen" oninput="autoHyphen(this)" maxlength="13">
				<input type="hidden" name="phone" value="${recruitVo.phone}"></td>
			</tr>
			<tr>

				<th>email<span class="required"></span></th>
				<td><input name="email" class="input-field" oninput="isEmail(this)"></td>
				<th>주소<span class="required"></span></th>
				<td><input type="text" class="input-field"></td>
			</tr>
			<tr>

				<th>희망근무지<span class="required"></span></th>
				<td><select name="location" class="input-field">
						<option value="seoul">서울</option>
						<option value="busan">부산</option>
						<option value="daegu">대구</option>
						<option value="gwangiu">광주</option>
						<option value="incheon">인천</option>
				</select></td>
				<th>근무형태<span class="required"></span></th>
				<td><select name="workType" class="input-field">
						<option value="permanent">정규직</option>
						<option value="contract">계약직</option>
				</select></td>
			</tr>
		</table>


<c:if test="${not empty recruitVo.sumbit } ">

		<table align="center" border="1px" class="table-Width">
			<tr>
				<th>학력사항</th>
				<th>경력사항</th>
				<th>희망연봉</th>
				<th>희망근무지/근무형태</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
</c:if>

		<h3>학력<span class="required"></span></h3>

		<div class="placeW education">
			<button class="education add">추가</button>
			<button class="education delete">삭제</button>
		</div>

		<table align="center" border="1px" class="table-Width education">
			<tr>
				<td class="checkSize"></td>
				<th>재학기간</th>
				<th class="selectSize">구분</th>
				<th class="sameWidth">학교명(소재지)</th>
				<th class="sameWidth">전공</th>
				<th class="sameWidth">학점</th>
			</tr>
			<tr class="template-row">
				<td><input type="checkbox"></td>
				<td><input type="text" name="start_period" class="input-field" > ~ <input class="input-field" type="text" name="end_period"></td>
				<td><select name="division" class="input-field">
						<option value="graduate">졸업</option>
						<option value="attend">재학</option>
						<option value="dropout">중퇴</option>
				</select></td>
				<td><input type="text" name="school_name" class="input-field"></td>
				<td><input type="text" name="major" class="input-field"></td>
				<td><input type="text" name="grade" class="input-field"></td>
			</tr>
		</table>

		<h3>경력</h3>

		<div class="placeW career">
			<button class="career add">추가</button>
			<button class="career delete">삭제</button>
		</div>

		<table align="center" border="1px" class="table-Width career">
			<tr>
				<td class="checkSize"></td>
				<th>근무기간</th>
				<th class="sameWidth">회사명</th>
				<th class="sameWidth">부서/직급/직책</th>
				<th class="sameWidth">지역</th>
			</tr>
			<tr class="template-row">
				<td><input type="checkbox"></td>
				<td><input type="text" name="start_period"> ~ <input type="text" name="end_period"></td>
				<td><input type="text" name="comp_name"></td>
				<td><input type="text" name="salary"></td>
				<td><input type="text" name="location"></td>
			</tr>

		</table>

		<h3>자격증</h3>

		<div class="placeW certificate">
			<button class="certificate add">추가</button>
			<button class="certificate delete">삭제</button>
		</div>

		<table align="center" border="1px" class="table-Width certificate">
			<tr>
				<td class="checkSize"></td>
				<th>자격증명</th>
				<th>취득일</th>
				<th>발행처</th>
			</tr>
			<tr class="template-row">
				<td><input type="checkbox"></td>
				<td><input type="text" name="qualifi_name"></td>
				<td><input type="text" name="acqu_date"></td>
				<td><input type="text" name="organize_name"></td>
			</tr>

		</table>


<!-- 모든 항목 입력 후 저장 및 제출 가능 -->
<!-- ### 저장은 재 로그인시 수정가능, 제출은 로그인시 수정 불가능 -->
<!-- 저장일때는 submit = 'save'로 insert 하고 제출일때는 submit = 'submit' -->
		<div class="placeC">
			<button class="save-btn btn" disabled>저장</button>
			<button class="submit-btn btn" disabled>제출</button>
		</div>



	</fieldset>

	<script>




document.addEventListener("DOMContentLoaded", function() {
  const fields = document.querySelectorAll('.input-field');
  const save_btn = document.querySelector('.save-btn');
  const submit_btn = document.querySelector('.submit-btn');

function toggleBtn(state){
	save_btn.disabled = state;
	submit_btn.disabled = state;
}

toggleBtn(true);

  function checkFields() {
    let isValid = true;

    fields.forEach(field => {
      field.addEventListener('input', () => {
        isValid = Array.from(fields).every(field => field.value.trim() !== '');

        if (isValid) {
			toggleBtn(false);
        } else {
			toggleBtn(true);
        }
      });
    });
  }

  checkFields(); // 페이지 로드 시 필드 상태 확인

  // 기존에 등록된 이벤트 리스너 제거 후 다시 등록
  fields.forEach(field => {
    field.removeEventListener('input', checkFields);
    field.addEventListener('input', checkFields);
  });
});

	function validatePhoneNumber(phoneNumber) {

	    let phone = $j('input[name="phone"]');

	    phoneNumber = phoneNumber.replace(/-/g, '');

	    phone.val(phoneNumber);

	}


	const autoHyphen = (target) => {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);

	    validatePhoneNumber(target.value);
	}

	function showHyphen() {
	    let target = $j('input[name="phone"]').val();

	    let formatPhone = target
	        .replace(/[^0-9]/g, '')
	        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);

	    $j('input[name="phoneHyphen"]').val(formatPhone);
	}


	$j(document).ready(function () {
	    showHyphen();

		saveOrSumbit();
	})	
	
	function saveOrSumbit(){

		let flag = $j('input[name="submit"]').val();

		let name = $j('input[name="name"]');
		let phone = $j('input[name="phoneHyphen"]');
		
		if(flag === 'save'){
		
		}else{ // 저장을 눌렀을경우 수정 불가하게 readonly
				
		name.prop('readonly',true);
		phone.prop('readonly',true);
		
		}

	}
	
	
	

	document.querySelectorAll('.add').forEach(function (button) {
	    button.addEventListener('click', function () {
	        const table = button.parentElement.nextElementSibling; // 버튼 다음에 오는 테이블을 선택합니다.

	        const newRow = table.insertRow(table.rows.length); // 테이블의 맨 끝에 새로운 행을 삽입합니다.
	        const firstRow = table.querySelector('.template-row'); // 템플릿 행을 선택합니다.

	        const cloneRow = firstRow.cloneNode(true); // 템플릿 행을 복제합니다.
	        newRow.innerHTML = cloneRow.innerHTML; // 복제된 행을 실제 테이블 행에 추가합니다.
	    });
	});





	// 삭제 버튼 클릭 시 체크된 항목 삭제
	document.querySelectorAll('.delete').forEach(function (deleteButton) {
	    deleteButton.addEventListener('click', function () {
	        const table = deleteButton.parentElement.nextElementSibling; // 삭제 버튼 다음에 오는 테이블을 선택합니다.
	        const rows = table.querySelectorAll('tr:not(:first-child)'); // 해당 테이블의 모든 행을 선택합니다.

	        rows.forEach(function (row) {

	            const checkbox = row.querySelector('input[type="checkbox"]'); // 각 행의 체크 박스를 선택합니다.


	            if (checkbox.checked && checkbox) {
	                row.remove(); // 체크된 행을 삭제합니다.
	            }
	        });
	    });
	});


	document.querySelector('.save-btn').addEventListener("click",save_Check);

	function save_Check(){

		
	}



function isEmail(email){
	let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	
	if(!regExp.test(email.val())){
		alert('이메일 형식을 다시 확인해주세요');
		email.val() = '';
		email.focus();
	} 
}


function birthHyphen(target){

	let birth = target.value
   .replace(/[^0-9]/g, '')
   .replace(/^(\d{4})(\d{2})(\d{2})$/, `$1-$2-$3`);

   target.value = birth;


   if(birth.length === 10){
birth_pattern(target);
   }

}

function birth_pattern(target){
      let birth_pattern = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/
    
	  if(!birth_pattern.test(target.value)){
    	alert('생년월일 8자리 다시 확인해주세요'); 
        target.value=''; 
        target.focus(); 
        return 0; 
   }
}


let startDate = document.querySelector('input[name="start_period"]');
let endDate = document.querySelector('input[name="end_period"]');



startDate.addEventListener('input',() => {
	periodHypen(startDate,isPeriod,'재학기간_시작');
})



endDate.addEventListener('input',() => {
	periodHypen(endDate,isPeriod,'재학기간_끝');
})



function periodHypen(target,validationFn,message){
	let day = target.value
   .replace(/[^0-9]/g, '')
   .replace(/^(\d{4})(\d{2})$/, `$1-$2`);

   target.value = day;

   

   if(day.length === 7){
	const isVaild = validationFn(target);
	if(!isVaild){
		alert(message + '을 다시 입력해주세요');
		target.value = '';
		target.focus();
	}
   }


}

function isPeriod(target){
	let rexExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])$/
    
	return rexExp.test(target.value);
}



	</script>

</body>
</html>