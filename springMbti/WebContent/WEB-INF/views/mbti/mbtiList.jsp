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
		<fieldset>

			<div class="quiz_text">
				<span class="text_center">질문이 5개씩 뿌려지고 다음 누르면 다음질문 5개씩 </span>

			</div>
			<div class="content">

				<div id="group_options">
					<div class="agree text_left">동의</div>


					<div class="radios">
						<span class="sp-radio size--70 color--green radio__tick"> <label>
								<!-- ### -3,-2,1,0,1,2,3 으로 값 정하기 그리고 세션으로 마지막에 값 처리 --> <input
								type="radio" value="-3"> <span></span> <span> <!-- ###여기에 체크표 체크되면 나타나기 사이즈 조절 필수! -->
									<!-- ### 체크표 <svg aria-labelledby="i_oy8s8jv6k2" viewBox="0 0 48 48" role="img" xmlns="http://www.w3.org/2000/svg"><title id="i_oy8s8jv6k2">Completed</title> <path d="m41.766 8.625-26.25 26.25-9.282-9.281a1.126 1.126 0 0 0-1.593 0l-1.06 1.06c-.44.44-.44 1.152 0 1.593L14.72 39.375c.44.44 1.153.44 1.594 0l28.106-28.106c.44-.44.44-1.153 0-1.594l-1.06-1.05a1.126 1.126 0 0 0-1.593 0z" fill-rule="evenodd"></path></svg> -->
							</span>


						</label>
						</span>


					</div>


					<div class="agree text_right">비동의</div>


				</div>
				<!-- id 그룹옵션 div -->

			</div>
			<!-- 첫 .content div-->

			<!-- fieldset의 반복! -->
		</fieldset>
		<div class="action-row">
			<button type="button" class="sp-button button-color">
				<span class="button__text">다음</span>
				<!-- ### 화살표 중심 맞추기 -->
				<span class="sp-icon"> <svg aria-labelledby="i_ymrgu5ygrr"
						viewBox="0 0 48 48" role="img" xmlns="http://www.w3.org/2000/svg">
						<title id="i_ymrgu5ygrr">Go</title> <path data-v-72d36796=""
							d="M23.296875,3.421875 L22.63125,4.0875 C22.190625,4.528125 22.190625,5.240625 22.63125,5.68125 L39.365625,22.40625 L4.125,22.40625 C3.50625,22.40625 3,22.9125 3,23.53125 L3,24.46875 C3,25.0875 3.50625,25.59375 4.125,25.59375 L39.365625,25.59375 L22.63125,42.328125 C22.190625,42.76875 22.190625,43.48125 22.63125,43.921875 L23.296875,44.5875 C23.7375,45.028125 24.45,45.028125 24.890625,44.5875 L44.68125,24.796875 C45.121875,24.35625 45.121875,23.64375 44.68125,23.203125 L24.890625,3.421875 C24.440625,2.98125 23.7375,2.98125 23.296875,3.421875 Z"></path></svg>
				</span>
			</button>
		</div>
	</form>



</body>
</html>