<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/recruit-memberInsert.js"></script>


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

		<table align="center" border="1px">
			<tr>
				<th>이름<span class="required"></span></th>
				<td><input type="text" value="${recruitVo.name}"></td>
				<th>생년월일<span class="required"></span></th>
				<td><input type="hidden" name="birth">
					<input type="text" name="birthHyphen" oninput="birthHyphen(this)" maxlength="8"></td>
			</tr>
			<tr>
				<th>성별<span class="required"></span></th>
				<td><select name="gender">
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select></td>
				<th>연락처<span class="required"></span></th>
					<td><input type="text"  name="phoneHyphen" oninput="autoHyphen(this)" maxlength="13">
				<input type="hidden" name="phone" value="${recruitVo.phone}"></td>
			</tr>
			<tr>

				<th>email<span class="required"></span></th>
				<td><input type="email"></td>
				<th>주소<span class="required"></span></th>
				<td><input type="text"></td>
			</tr>
			<tr>

				<th>희망근무지<span class="required"></span></th>
				<td><select name="location" id="">
						<option value="seoul">서울</option>
						<option value="busan">부산</option>
						<option value="daegu">대구</option>
						<option value="gwangiu">광주</option>
						<option value="incheon">인천</option>
				</select></td>
				<th>근무형태<span class="required"></span></th>
				<td><select name="workType" id="">
						<option value="">정규직</option>
						<option value="">계약직</option>
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
				<td><input type="text" name="start_period"> ~ <input type="text" name="end_period"></td>
				<td><select name="division" id="">
						<option value="graduate" value="">졸업</option>
						<option value="attend">재학</option>
						<option value="dropout">중퇴</option>
				</select></td>
				<td><input type="text" name="school_name"></td>
				<td><input type="text" name="major"></td>
				<td><input type="text" name="grade"></td>
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
<!-- ### 재 로그인시 수정가능, 로그인시 수정 불가능 -->
		<div class="placeC">
			<button>저장</button>
			<button>제출</button>
		</div>



	</fieldset>

	<script>






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






	</script>

</body>
</html>