<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView</title>
</head>
<body>
	<table align="center">
		<tr>
			<td>
				<table border="1">
					<tr>
						<td width="120" align="center">Title</td>
						<td width="400">${board.boardTitle}</td>
					</tr>
					<tr>
						<td height="300" align="center">Comment</td>
						<td>${board.boardComment}</td>
					</tr>
					<tr>
						<td align="center">Writer</td>
						<td>${board.creator}</td>
					</tr>



				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/board/boardList.do">List</a></td>
		</tr>

		<tr>
			<c:if test="${userId eq board.creator }">
				<td align="right"><button onclick="fromSubmit(1);">수정</button></td>

				<td align="right"><button onclick="fromSubmit(2);">삭제</button></td>
			</c:if>


		</tr>

	</table>

	<div>

		<form id="choiceForm" action="" method="post">

			<input type="hidden" name="boardType" value="${board.boardType}">
			<input type="hidden" name="boardNum" value="${board.boardNum}">

		</form>

	</div>




	<script>
		/* 		$j('#submit').on("click",function(){
		 alert('완성');
		 });  */

		function fromSubmit(num) {
			if (num == 1) {
				$j("#choiceForm").attr("action", "/board/boardUpdate.do")
						.submit();
			} else {
				/* 	$j("#choiceForm").attr("action", "/board/boardDelete.do").submit(); */

				var $frm = $j('#choiceForm :input');
				var param = $frm.serialize();
				console.log(param);

				$j.ajax({
					url : "/board/boardDelete.do",
					dataType : "json",
					type : "POST",
					data : param,
					success : function(data, textStatus, jqXHR) {
						
						console.log(data);
						
						alert("삭제완료");

						alert("메세지:" + data.success);

						location.href = "/board/boardList.do";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("실패");
						console.log(param);
					}
				});

			}
		}
	</script>


</body>
</html>