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

<div>

<h1>"드디어 제 성격을 이해받을 수 있어서 정말 기뻐요"</h1>
<span>성격 테스트를 통해 자신의 성향과 행동에 대한 정확한 분석 결과를 확인해보세요</span>

<a href="/mbti/mbtiList.do" class="button-purple sp-button">

    <span>검사실시</span>
</a>
</div>

</body>
</html>