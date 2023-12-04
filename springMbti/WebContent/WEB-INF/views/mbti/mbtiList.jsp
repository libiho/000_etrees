<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link
	href="${pageContext.request.contextPath}/resources/css/mbtiList.css"
	rel="stylesheet" />

</head>
<body>

	<form action="">

		<div class="test-questions comp">

			<!-- ### 답하기 전 질문 / 답하고 난 질문에는 inactive 추가하기 -->
			<fieldset class="inputoptions ">


				<div class="content">

					<div class="quiz_text">
						<%-- 			
			<c:forEach items="${mbtiList }" var="list">
				<span>${list.mbtiQuiz }</span>
				<span>${list.mbtiTwoType }</span>
			</c:forEach>
			 --%>
						<span class="text_center">질문이 5개씩 뿌려지고 다음 누르면 다음질문 5개씩 </span>

					</div>

					<div id="group_options">



						<div class="radios">
							<div class="agree text_left">동의</div>
							<!-- ### 한 원형  -->
							<span class="sp-radio size--70 color--green radio__tick">
								<label> <!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 -->
									<input type="radio" value="-3" name="question1"> <span></span>

							</label>
							</span>
							<!-- ### 한 원형  -->

							<span class="sp-radio size--55 color--green radio__tick">
								<label> <!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 -->
									<input type="radio" value="-3" name="question1"> <span></span>


							</label>
							</span> <span class="sp-radio size--45 color--green radio__tick">
								<label> <!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 -->
									<input type="radio" value="-3" name="question1"> <span></span>

							</label>
							</span> <span class="sp-radio size--35 color--neutral radio__tick">
								<labe for=""> <!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 -->
								<input type="radio" value="-3" id="" name="question1"> <span></span> </labe>
							</span>

							<!-- 보라색  -->
							<span class="sp-radio size--45 color--purple radio__tick">
								<label> <!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 -->
									<input type="radio" value="-3" name="question1"> <span></span>

							</label>
							</span> <span class="sp-radio size--55 color--purple radio__tick">
								<label> <!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 -->
									<input type="radio" value="-3" name="question1"> <span></span>

							</label>
							</span> <span class="sp-radio size--70 color--purple radio__tick">
								<label> <!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 -->
									<input type="radio" value="-3" name="question1"> <span></span>

							</label>
							</span>

							<div class="agree text_right">비동의</div>
						</div>





					</div>
					<!-- id 그룹옵션 div -->
				</div>
				<!-- 첫 .content div-->
				<!-- fieldset의 반복! -->
			</fieldset>
			<!-- fieldset 끝 @@@ -->

				<fieldset class="inputoptions ">


				<div class="content">

					<div class="quiz_text">
						<%-- 			
			<c:forEach items="${mbtiList }" var="list">
				<span>${list.mbtiQuiz }</span>
				<span>${list.mbtiTwoType }</span>
			</c:forEach>
			 --%>
						<span class="text_center">질문이 5개씩 뿌려지고 다음 누르면 다음질문 5개씩 </span>

					</div>

					<div id="group_options">



						<div class="radios">
							<div class="agree text_left">동의</div>
							<!-- ### 한 원형  -->
							<span class="sp-radio size--70 color--green radio__tick">
								<label> 
									<input type="radio" value="-3"> <span></span>

							</label>
							</span>
							<!-- ### 한 원형  -->

							<span class="sp-radio size--55 color--green radio__tick">
								<label> 
									<input type="radio" value="-2"> <span></span>


							</label>
							</span> <span class="sp-radio size--45 color--green radio__tick">
								<label> 
									<input type="radio" value="-1"> <span></span>

							</label>
							</span> <span class="sp-radio size--35 color--neutral radio__tick">
								<labe for=""> 
								<input type="radio" value="0" id=""> <span></span> </labe>
							</span>

							<!-- 보라색  -->
							<span class="sp-radio size--45 color--purple radio__tick">
								<label> 
									<input type="radio" value="1"> <span></span>

							</label>
							</span> <span class="sp-radio size--55 color--purple radio__tick">
								<label> 
									<input type="radio" value="2"> <span></span>

							</label>
							</span> <span class="sp-radio size--70 color--purple radio__tick">
								<label> 
									<input type="radio" value="3"> <span></span>

							</label>
							</span>

							<div class="agree text_right">비동의</div>
						</div>





					</div>
					<!-- id 그룹옵션 div -->
				</div>
				<!-- 첫 .content div-->
				<!-- fieldset의 반복! -->
			</fieldset>
			<!-- fieldset 끝 @@@ -->

			<div class="action-row">
				<button type="button" class="sp-button button-color next-buton">
					<span class="button__text">다음</span>
					<!-- ### 화살표 중심 맞추기 -->
					<span class="sp-icon"> <svg aria-labelledby="i_ymrgu5ygrr"
							viewBox="0 0 48 48" role="img" xmlns="http://www.w3.org/2000/svg">
						<title id="i_ymrgu5ygrr">Go</title> <path data-v-72d36796=""
								d="M23.296875,3.421875 L22.63125,4.0875 C22.190625,4.528125 22.190625,5.240625 22.63125,5.68125 L39.365625,22.40625 L4.125,22.40625 C3.50625,22.40625 3,22.9125 3,23.53125 L3,24.46875 C3,25.0875 3.50625,25.59375 4.125,25.59375 L39.365625,25.59375 L22.63125,42.328125 C22.190625,42.76875 22.190625,43.48125 22.63125,43.921875 L23.296875,44.5875 C23.7375,45.028125 24.45,45.028125 24.890625,44.5875 L44.68125,24.796875 C45.121875,24.35625 45.121875,23.64375 44.68125,23.203125 L24.890625,3.421875 C24.440625,2.98125 23.7375,2.98125 23.296875,3.421875 Z"></path></svg>
					</span>
				</button>
			</div>
		</div>
		<!-- form 바로 앞 div -->
	</form>

	<script>
		$j(function() {

			$j('.next-buton').click(function() {

				$j.ajax({

					type : 'GET',
					url : " /*여기 집어넣어야해!! ###  */ ",
					success : function(data) {
						console.log(data);

						/* ### 다음 누르면 ajax로 화면 그대로 세팅   */

					},
					error : function(error) {
						alert('mbti 조회 실패');
					}

				})

			})

		})




// JavaScript 코드
const spRadios = document.querySelectorAll('.sp-radio');

spRadios.forEach(function(spRadio) {
    spRadio.addEventListener('click', function() {
        // 클릭한 .sp-radio 요소 내의 input 값을 가져옵니다.
        const input = spRadio.querySelector('input');
        const value = input.value;
        
        // 해당 값으로 원하는 작업을 수행합니다.
        console.log('선택된 값:', value);

		
        
        // 이후 작업을 추가하려면 이곳에 코드를 작성하세요.
    });
});




	</script>


</body>
</html>