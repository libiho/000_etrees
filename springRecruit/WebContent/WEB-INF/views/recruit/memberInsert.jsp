<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
				<th>이름</th>
				<td><input type="text"></td>
				<th>생년월일</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><select name="gender">
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select></td>
				<th>연락처</th>
				<td><input type="text"></td>
			</tr>
			<tr>

				<th>email</th>
				<td><input type="email"></td>
				<th>주소</th>
				<td><input type="text"></td>
			</tr>
			<tr>

				<th>희망근무지</th>
				<td><select name="location" id="">
						<option value="seoul">서울</option>
						<option value="busan">부산</option>
						<option value="daegu">대구</option>
						<option value="gwangiu">광주</option>
						<option value="incheon">인천</option>
				</select></td>
				<th>근무형태</th>
				<td><select name="workType" id="">
						<option value="">정규직</option>
						<option value="">계약직</option>
				</select></td>
			</tr>
		</table>



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


		<h3>학력</h3>
<!-- ### 체크박스 선택 후 삭제버튼 클릭시 삭제 -->
		<div class="placeW">
			<button>추가</button>
			<button>삭제</button>
		</div>

		<table align="center" border="1px" class="table-Width">
			<tr>
				<td class="checkSize"></td>
				<th>재학기간</th>
				<th class="selectSize">구분</th>
				<th class="sameWidth">학교명(소재지)</th>
				<th class="sameWidth">전공</th>
				<th class="sameWidth">학점</th>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td><input type="text"> ~ <input type="text"></td>
				<td><select name="university" id="">
						<option value="graduate">졸업</option>
						<option value="attend">재학</option>
						<option value="dropout">중퇴</option>
				</select></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
			</tr>
		</table>

		<h3>경력</h3>

		<div class="placeW">
			<button>추가</button>
			<button>삭제</button>
		</div>

		<table align="center" border="1px" class="table-Width">
			<tr>
				<td class="checkSize"></td>
				<th>근무기간</th>
				<th class="sameWidth">회사명</th>
				<th class="sameWidth">부서/직급/직책</th>
				<th class="sameWidth">지역</th>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td><input type="text"> ~ <input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
			</tr>

		</table>

		<h3>자격증</h3>

		<div class="placeW">
			<button>추가</button>
			<button>삭제</button>
		</div>

		<table align="center" border="1px" class="table-Width">
			<tr>
				<td class="checkSize"></td>
				<th>자격증명</th>
				<th>취득일</th>
				<th>발행처</th>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
				<td><input type="text"></td>
			</tr>

		</table>


<!-- 모든 항목 입력 후 저장 및 제출 가능 -->
<!-- ### 재 로그인시 수정가능, 로그인시 수정 불가능 -->
		<div class="placeC">
			<button>저장</button>
			<button>제출</button>
		</div>



	</fieldset>


</body>
</html>