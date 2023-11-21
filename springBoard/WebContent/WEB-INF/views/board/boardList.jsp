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

									<c:when test="${list.boardType==1}">�Ϲ�
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
			<td align="right"><a href="/board/boardWrite.do">�۾���</a></td>
		</tr>
		<tr>
		<td>   <label><input type="checkbox" name="allBoardType" value="all"> ��ü </label></td>
		<td>   <label><input type="checkbox" name="geneBoardType" value="general"> �Ϲ� </label></td>
		<td>   <label><input type="checkbox" name="qnaBoardType" value="qna"> Q&A </label></td>
		<td>   <label><input type="checkbox" name="anonyBoardType" value="anonymous"> �͸� </label></td>
		<td>   <label><input type="checkbox" name="freeBoardType" value="free"> ���� </label></td>
		<td><button>��ȸ</button></td>
		</tr>

		<tr>
		<td>	���� ����¡ ó��~</td>
		</tr>


	</table>
</body>
</html>