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
	$j(document).ready(function() {

		$j("#boardSearch").on("click", function() {

			var type = $j('input[name=boardType]').val();

			$j.ajax({
				url : "/board/boardListSearch.do",
				dataType : "json",
				type : "GET",
				data : type,
				contentType : "application/json",
				success : function(data, textStatus, jqXHR) {
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("�� ������ �������� �𸣰ڴµ� ���ϴٿ�");
				}
			});
		});

	});
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


			<td align="right">total : ${totalCnt}</td>
		</tr>


		<tr>
			<td colspan="2">
				<table id="boardTable" border="1">
					<tr>
						<td class="leftTd">Type</td>
						<td class="middleTd">No</td>
						<td class="RightTd" align="center">Title</td>
					</tr>
					<c:forEach items="${boardList}" var="list">
						<tr>

							<!-- ### type�� �̸� �ٸ��� ���� -->
							<!-- ### code���̺��ϰ� �����ؼ� boardList.jsp �ݺ��� �ڵ� ���̱�  boardSearch -->

							<c:choose>

								<c:when test="${list.boardType=='a01'}">

									<td align="center">�Ϲ�</td>
									<td align="center">${list.boardNum}</td>
									<td><a
										href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
									</td>

								</c:when>

								<c:when test="${list.boardType=='a02'}">

									<td align="center">Q&A</td>
									<td align="center">${list.boardNum}</td>
									<td><a
										href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
									</td>

								</c:when>

								<c:when test="${list.boardType=='a03'}">

									<td align="center">�͸�</td>
									<td align="center">${list.boardNum}</td>
									<td><a
										href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
									</td>

								</c:when>

								<c:otherwise>

									<td align="center">�͸�</td>
									<td align="center">${list.boardNum}</td>
									<td><a
										href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
									</td>

								</c:otherwise>

							</c:choose>
						</tr>
					</c:forEach>
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
				<form method="get">
					<label> <input type="checkbox" name="boardType"
						onchange="checkboxGroup(this)"> ��ü
					</label> <label><input type="checkbox" name="boardType" value="a01"
						onchange="checkboxGroup(this)"> �Ϲ� </label> <label><input
						type="checkbox" name="boardType" value="a02"
						onchange="checkboxGroup(this)"> Q&A </label> <label><input
						type="checkbox" name="boardType" value="a03"
						onchange="checkboxGroup(this)"> �͸� </label> <label><input
						type="checkbox" name="boardType" value="a04"
						onchange="checkboxGroup(this)"> ���� </label>
					<button type="submit" id="boardSearch">��ȸ</button>
				</form>
			</td>
		</tr>
		<tr>


			<!-- ### ����¡ ó�� -->


			<td>

				<div align="center">
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



</body>
</html>