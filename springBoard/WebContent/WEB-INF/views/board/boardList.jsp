<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>

<style>
.leftTd {
	width: 100px;
	text-align: center;
}

.middleTd {
	width: 50px;
	text-align: center;
}

.RightTd {
	width: 450px;
}
</style>


</head>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>

<body>
	<table align="center">

		<tr>
			<c:choose>

				<c:when test="${ empty loginUser }">
					<td><a href="/member/memberLogin.do">login</a> <a
						href="/member/memberInsert.do">join</a></td>

				</c:when>
				<c:otherwise>
					<td>${userName}</td>
				</c:otherwise>


			</c:choose>


			<td align="right" id="totalCountArea">total : ${totalCnt}</td>
		</tr>


		<tr>
			<td colspan="2">
				<table id="boardTable" border="1">
					<thead>
						<tr>
							<td class="leftTd">Type</td>
							<td class="middleTd">No</td>
							<td class="RightTd" align="center">Title</td>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${boardList}" var="list">
							<tr>
								<c:forEach items="${boardType}" var="bType">
									<c:if test="${list.boardType eq bType.codeId}">

										<td align="center">${bType.codeName }</td>
									</c:if>
								</c:forEach>
								<td align="center">${list.boardNum}</td>
								<td><a
									href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
								</td>

							</tr>
						</c:forEach>
						</div>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="2"><a href="/board/boardWrite.do">글쓰기</a>
				<c:if test="${not empty loginUser }">
					<a href="/member/memberLogout.do">로그아웃</a>
				</c:if></td>
		</tr>
		<tr>
			<input type="hidden" name="nowPage" value="${pageNo}">
			<td>
				<form method="get" id="boardSearch">
					<label> <input type="checkbox" name="boardType"
						onchange="checkboxGroup(this)" value="selectAll"> 전체
					</label>

					<c:forEach items="${boardType}" var="type">
						<label> <input type="checkbox" name="boardType"
							value="${type.codeId }" onchange="checkboxGroup(this)">
							${type.codeName }
						</label>

					</c:forEach>


					<button type="button" id="boardSearchBtn">조회</button>
				</form>
			</td>
		</tr>
		<tr>


			<td>

				<div align="center" id="pageLinksArea">

					<br>

					<c:if test="${pi.currentPage > 5 }">
						<a class="page-link" href="">이전</a>
					</c:if>




					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<a class="page-link" href="/board/boardList.do?pageNo=${ p }">${ p }</a>
					</c:forEach>



					<c:if test="${pi.maxPage > pi.currentPage }">
						<a class="page-link" href="">다음</a>
					</c:if>


				</div>

			</td>

		</tr>

	</table>


	<script type="text/javascript">
	

	</script>

</body>
</html>