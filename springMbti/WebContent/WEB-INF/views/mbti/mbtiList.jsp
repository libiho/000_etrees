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
	href="${pageContextpageContext.request.contextPath}/resources/css/mbtiList.css"
	rel="stylesheet" />


<script src="${pageContext.request.contextPath}/resources/js/mbti.js"></script>

<script>
	$j(document).ready(function() {

		$j('input[name="startNum"]').val(0);
		$j('input[name="showNum"]').val(4);
		$j('input[name="endNum"]').attr('value', 4);

		var showNum = $j('input[name="showNum"]').val();

		$j('.quizNum').each(function(index) {

			if (index >= showNum) {
				$j(this).closest('fieldset').addClass('noShow');
			}

		})

	});
</script>


</head>
<body>

	<!-- <form action="/mbti/mbtiResult.do" id="mbtiResult"> -->
		
		
		<div class="test-questions comp">
			
			<input type="hidden" name="startNum" value=""> <input
				type="hidden" name="endNum" value=""> <input type="hidden"
				name="showNum" value="">
				
				<c:forEach var="iteration" begin="1" end="1">
					<c:forEach items="${mbtiList }" var="list">
						
						
						<fieldset class="inputoptions ${list.mbtiTwoType} "
						id="node${list.mbtiNum}">
						<input type="hidden" class="quizNum" value="${list.mbtiNum}">
						
						
						
						<div class="content">

							<div class="quiz_text">
								
								
								
								
								<span class="text_center">${list.mbtiQuiz } </span>
								
							</div>
							
							<div id="group_options">
								
								
								
								<div class="radios">
									<div class="agree text_left">동의</div>
									<!-- ### 한 원형  -->
									<span class="sp-radio size--70 color--green radio__tick"
										> <label> <input
											type="radio" value="1" name="question${list.mbtiNum}" id="${list.mbtiTwoType}">
											<span></span>
											
										</label>
									</span>
									<!-- ### 한 원형  -->
									
									<span class="sp-radio size--55 color--green radio__tick"
									> <label> <input
										type="radio" value="2" name="question${list.mbtiNum}" id="${list.mbtiTwoType}">
										<span></span>
										
										
									</label>
									</span> <span class="sp-radio size--45 color--green radio__tick"
									> <label> <input
											type="radio" value="3" name="question${list.mbtiNum}" id="${list.mbtiTwoType}">
											<span></span>
											
										</label>
									</span> <span class="sp-radio size--35 color--neutral radio__tick"
									> <labe for=""> <input
										type="radio" value="4" name="question${list.mbtiNum}" id="${list.mbtiTwoType}">
										<span></span> </labe>
									</span>

									<!-- 보라색  -->
									<span class="sp-radio size--45 color--purple radio__tick"
										> <label> <input
											type="radio" value="5" name="question${list.mbtiNum}" id="${list.mbtiTwoType}">
											<span></span>
											
										</label>
									</span> <span class="sp-radio size--55 color--purple radio__tick"
									> <label> <input
											type="radio" value="6" name="question${list.mbtiNum}" id="${list.mbtiTwoType}">
											<span></span>
											
										</label>
									</span> <span class="sp-radio size--70 color--purple radio__tick"
									> <label> <input
										type="radio" value="7" name="question${list.mbtiNum}" id="${list.mbtiTwoType}">
										<span></span>
										
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
					

				</c:forEach>

			</c:forEach>
			
			
			
			
		</div>
		<!-- form 바로 앞 div -->
		<form action="/mbti/mbtiResult.do" id="mbtiResult">

			<input type="hidden" name="mResult" value="">
			
		</form>
	
	
	
	<div class="action-row">
		<button type="button" class="sp-button button-color next-button ">
			<span class="button__text">다음</span>
			<!-- ### 화살표 중심 맞추기 -->
			<!-- <span class="sp-icon"> <svg aria-labelledby="i_ymrgu5ygrr"
					viewBox="0 0 48 48" role="img" xmlns="http://www.w3.org/2000/svg">
						<title id="i_ymrgu5ygrr">Go</title> <path data-v-72d36796=""
						d="M23.296875,3.421875 L22.63125,4.0875 C22.190625,4.528125 22.190625,5.240625 22.63125,5.68125 L39.365625,22.40625 L4.125,22.40625 C3.50625,22.40625 3,22.9125 3,23.53125 L3,24.46875 C3,25.0875 3.50625,25.59375 4.125,25.59375 L39.365625,25.59375 L22.63125,42.328125 C22.190625,42.76875 22.190625,43.48125 22.63125,43.921875 L23.296875,44.5875 C23.7375,45.028125 24.45,45.028125 24.890625,44.5875 L44.68125,24.796875 C45.121875,24.35625 45.121875,23.64375 44.68125,23.203125 L24.890625,3.421875 C24.440625,2.98125 23.7375,2.98125 23.296875,3.421875 Z"></path></svg>
			</span> -->
		</button>

		<button type="button" class="sp-button button-color submit-btn noShow">
			<span class="button__text">전송</span>
			<!-- ### 화살표 중심 맞추기 -->
			<span class="sp-icon"> <svg aria-labelledby="i_ymrgu5ygrr"
					viewBox="0 0 48 48" role="img" xmlns="http://www.w3.org/2000/svg">
						<title id="i_ymrgu5ygrr">Go</title> <path data-v-72d36796=""
						d="M23.296875,3.421875 L22.63125,4.0875 C22.190625,4.528125 22.190625,5.240625 22.63125,5.68125 L39.365625,22.40625 L4.125,22.40625 C3.50625,22.40625 3,22.9125 3,23.53125 L3,24.46875 C3,25.0875 3.50625,25.59375 4.125,25.59375 L39.365625,25.59375 L22.63125,42.328125 C22.190625,42.76875 22.190625,43.48125 22.63125,43.921875 L23.296875,44.5875 C23.7375,45.028125 24.45,45.028125 24.890625,44.5875 L44.68125,24.796875 C45.121875,24.35625 45.121875,23.64375 44.68125,23.203125 L24.890625,3.421875 C24.440625,2.98125 23.7375,2.98125 23.296875,3.421875 Z"></path></svg>
			</span>
		</button>

	</div>


	<script>
		


const spRadios = document.querySelectorAll('.sp-radio');

spRadios.forEach(function (spRadio) {

    spRadio.addEventListener('click', function () {

        colorChecked();

        const classList = spRadio.classList;

        const input = spRadio.querySelector('input');
        // console.log(input.getAttribute('id'));

        $j(this).closest('fieldset').addClass('inactive');

        input.checked = true;

        backColor(classList, spRadio);



    });
});
		

		

		// '다음' 버튼
		const nextButton = document.querySelector('.next-button');
		// 전송 버튼
		const submitButton = document.querySelector('.submit-btn');



		submitButton.addEventListener('click', resultMbti);
		nextButton.addEventListener('click', radioChecked);


		// '다음' 버튼 클릭 이벤트
		// nextButton.addEventListener('click', function() {
		// 	const fieldsets = document
		// 			.querySelectorAll('fieldset');

		// 	let allSelected = true;

		// 	  fieldsets.forEach(function(fieldset) {
		// 	    if (!fieldset.classList.contains('noShow') && !fieldset.classList.contains('inactive')) {
		// 	      allSelected = false;
		// 	      return;
		// 	    }
		// 	  });

			
		// 	if (allSelected) {
		// 				nextQuestion();
		// 	} else {
		// 		alert('모든 질문에 답하세요!');
		// 	}
		// });

		
	
	</script>

</body>
</html>