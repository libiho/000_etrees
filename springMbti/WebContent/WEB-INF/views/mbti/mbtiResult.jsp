<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>

<style>

    .center{
        
	max-width: 1200px;
	padding: 15px;
	align-items: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin: 0 auto;
    }
</style>

</head>
<body>
    
    <div class="center">

<h2>당신의 결과는 ${result}</h2>

<img src="../../../resources/image/${result}.png" alt="">

</div>

</body>
</html>