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
<script
	src="${pageContextpageContext.request.contextPath}/resources/js/board.js"></script>

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
						onchange="checkboxGroup(this)"> 전체
					</label>

					<c:forEach items="${boardType}" var="type">

						<label> <input type="checkbox" name="boardType"
							value="${type.codeId }" onchange="checkboxGroup(this)">
							${type.codeName }
						</label>

					</c:forEach>


					<button type="submit" id="boardSearchBtn">조회</button>
				</form>
			</td>
		</tr>
		<tr>


			<td>

				<div align="center" id="pageLinksArea">

					<br>
					<c:choose>

						<c:when test="${pi.currentPage eq 1 }">
							<a class="page-link" href="">이전</a>
						</c:when>

						<c:otherwise>
							<a class="page-link"
								href="/board/boardList.do?pageNo=${pi.currentPage - 1 }">이전</a>
						</c:otherwise>

					</c:choose>


					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<a class="page-link" href="/board/boardList.do?pageNo=${ p }">${ p }</a>
					</c:forEach>
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<a class="page-link" href="">다음</a>
						</c:when>
						<c:otherwise>
							<a class="page-link"
								href="/board/boardList.do?pageNo=${pi.currentPage + 1 }">다음</a>
						</c:otherwise>

					</c:choose>
				</div>

			</td>

		</tr>

	</table>


	<script type="text/javascript">

/* 페이징처리 링크 클릭했을때 */
$j(document)
		.on(
				'click',
				'#pageLinksArea a',
				function(event) {
					event.preventDefault();
					
					
					

					var pageNo = $j(this).text(); // 클릭된 페이지 번호 가져오기
					
					if(pageNo != '다음'){
					 $j('input[name="nowPage"]').val(pageNo);
					}
					
					var nowPage = parseInt($j('input[name="nowPage"]').val(), 10);
					
					console.log(nowPage);
					
					if (pageNo === '다음') {
						
						
					     if (nowPage % 5 == 0) {
						    // 5의 배수인 페이지에서 '다음' 클릭 시 처리 (5, 10, 15...)
						    pageNo = nowPage +1;
						}else if(nowPage <= 5){
							  pageNo = 6;
						}else{
							pageNo = (nowPage/5)*5 + 1;
						} 
					   
					}
					
					
					
					
					console.log(pageNo);
					
					var type = $j('input[name=boardType]:checked')
							.val();
					
					$j
							.ajax({
								url : "/board/boardListSearch.do",
								dataType : "json",
								type : "GET",
								data : {
									boardType : type,
									pageNo : pageNo
								// 클릭된 페이지 번호 전달
								},
								contentType : "application/json; charset=UTF-8",
								success : function(data, textStatus,
										jqXHR) {

									var boardList = data.boardList;
									var boardType = data.boardType;
									var totalCnt = data.totalCnt;
									var pageNo = data.pageNo;

									let value = "";
									let codeName = "";

									let tableBody = $j('#boardTable tbody')

									for ( let i in boardList) {

										for ( let a in boardType) {
											if (boardList[i].boardType === boardType[a].codeId) {
												codeName = boardType[a].codeName;
												btype = boardList[i].boardType
												break;
											}
										}

										value += "<tr>"
												+ "<td align='center'>"
												+ codeName
												+ "</td>"
												+ "<td>"
												+ boardList[i].boardNum
												+ "</td>"
												+ "<td> <a href='/board/"
												+ boardList[i].boardType
												+ "/"
												+ boardList[i].boardNum
												+ "/boardView.do?pageNo="
												+ pageNo
												+ "'>"
												+ boardList[i].boardTitle
												+ "</a></td>" + "</tr>";
									}

									tableBody.html(value);
									
									
									updatePage(
											totalCnt,
											pageNo);
									
								},
								error : function(jqXHR, textStatus,
										errorThrown) {
									console.log("에러: " + errorThrown);
								}
							});
				});

</script>

</body>
</html>