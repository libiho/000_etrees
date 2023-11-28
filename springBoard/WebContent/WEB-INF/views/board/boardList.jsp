<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
<script type="text/javascript">
	$j(document)
			.ready(
					function() {

						$j("#boardSearchBtn")
								.on(
										"click",
										function(event) {

											event.preventDefault(); // �� ���� �⺻ ���� ���� -> ���ϸ� �ι� controller Ž 

											var type = $j(
													'input[name=boardType]:checked')
													.val();

											var urlAjax = "/board/boardListSearch.do";

											$j("#boardSearch").prop("disabled",
													true);

										

											$j
													.ajax({
														url : urlAjax,
														dataType : "json",
														type : "GET",
														data : {
															boardType : type
														},
														contentType : "application/json; charset=EUC-KR",
														success : function(
																data,
																textStatus,
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
																		+ "</a></td>"
																		+ "</tr>";
															}

															tableBody
																	.html(value);

															// ������ ���� ���� ���� ��� 
															$j(
																	"#totalCountArea")
																	.html(
																			"<td align='right'>total : "
																					+ totalCnt
																					+ "</td>");

															updatePage(
																	totalCnt,
																	pageNo);

														},
														error : function(jqXHR,
																textStatus,
																errorThrown) {
															console
																	.log("�� ������ �������� �𸣰ڴµ� ���ϴٿ�");
														},
														complete : function() {
															// ��û �Ϸ� �� ��ư �ٽ� Ȱ��ȭ
															$j("#boardSearch")
																	.prop(
																			"disabled",
																			false);
														}
													});
										});

					});

	function updatePage(totalCnt, pageNo) {

		var pageLinks = "";

		var num = totalCnt / 5 + (totalCnt % 5 > 0 ? 1 : 0);

		for (var i = 1; i <= num; i++) {

			pageLinks += "<a href='/board/boardListSearch.do?pageNo=" + pageNo
					+ "'>" + [ i ] + "</a> ";
		}

		$j("#pageLinksArea")
				.html("<div align='center'>" + pageLinks + "</div>");
	}
</script>
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
			<td align="right" colspan="2"><a href="/board/boardWrite.do">�۾���</a>
				<c:if test="${not empty loginUser }">
					<a href="/member/memberLogout.do">�α׾ƿ�</a>
				</c:if></td>
		</tr>
		<tr>
			<td>
				<form method="get" id="boardSearch">
					<label> <input type="checkbox" name="boardType"
						onchange="checkboxGroup(this)"> ��ü
					</label>

					<c:forEach items="${boardType}" var="type">

						<label> <input type="checkbox" name="boardType"
							value="${type.codeId }" onchange="checkboxGroup(this)">
							${type.codeName }
						</label>



					</c:forEach>



					<button type="submit" id="boardSearchBtn">��ȸ</button>
				</form>
			</td>
		</tr>
		<tr>




			<td>


				<div align="center" id="pageLinksArea">
					<c:forEach begin="1"
						end="${totalCnt / 5 + (totalCnt % 5 > 0 ? 1 : 0)}" var="i">
						<a href="/board/boardList.do?pageNo=${i}">${i}</a>
					</c:forEach>
				</div>



			</td>





		</tr>

	</table>



	<script type="text/javascript">
		function checkboxGroup(currentCheckbox) {
			const checkboxes = document.getElementsByName("boardType");
			let checkedCount = 0;

			for (let i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					checkedCount++;
					if (checkboxes[i] !== currentCheckbox) {
						checkboxes[i].checked = false;
					}
				}
			}

			if (checkedCount === 0) {
				currentCheckbox.checked = true;
			}
		}
	</script>

	<script type="text/javascript">
		$j(document)
				.on(
						'click',
						'#pageLinksArea a',
						function(event) {
							event.preventDefault();

							var pageNo = $j(this).text(); // Ŭ���� ������ ��ȣ ��������
							var type = $j('input[name=boardType]:checked')
									.val();

							console.log(pageNo);
							console.log(type);

							$j
									.ajax({
										url : "/board/boardListSearch.do",
										dataType : "json",
										type : "GET",
										data : {
											boardType : type,
											pageNo : pageNo
										// Ŭ���� ������ ��ȣ ����
										},
										contentType : "application/json; charset=EUC-KR",
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
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console.log("����: " + errorThrown);
										}
									});
						});
	</script>


</body>
</html>