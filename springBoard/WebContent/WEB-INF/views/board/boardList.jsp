<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>

<style>

.leftTd{
	width:100px;
}
.middleTd{
	width:50px;
}
.RightTd{
	width:450px;
}

</style>


</head>
<script type="text/javascript">

	$j(document).ready(function(){
	});

</script>
<body>
	<table align="center" border="10px" style="">
		<thead>
			<tr>
				<td ><a herf="">login</a>
				<a>join</a></td>
				<td >total : ${totalCnt}</td>
			</tr>

		</thead>

		<tr>
			<td>
				<table id="boardTable" border="3">
					<tr>
						<td class="leftTd">Type</td>
						<td class="middleTd">No</td>
						<td class="RightTd">Title</td>
					</tr>
					<c:forEach items="${boardList}" var="list">
						<tr>
							<td align="center"><c:choose>

									<c:when test="${list.boardType==1}">일반
							</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose></td>
							<td>${list.boardNum}</td>
							<td><a
								href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/board/boardWrite.do">글쓰기</a></td>
		</tr>
		<tr>
		<td>   <label><input type="checkbox" name="allBoardType" value="all"> 전체 </label></td>
		<td>   <label><input type="checkbox" name="geneBoardType" value="general"> 일반 </label></td>
		<td>   <label><input type="checkbox" name="qnaBoardType" value="qna"> Q&A </label></td>
		<td>   <label><input type="checkbox" name="anonyBoardType" value="anonymous"> 익명 </label></td>
		<td>   <label><input type="checkbox" name="freeBoardType" value="free"> 자유 </label></td>
		<td><button>조회</button></td>
		</tr>

		<tr>
		<td>	여기 페이징 처리~</td>
		</tr>


	</table>
</body>
</html>