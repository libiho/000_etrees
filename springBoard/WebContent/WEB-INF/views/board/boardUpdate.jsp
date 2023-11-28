<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common/common.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $num = $j('input[name=boardNum]').val();
			var $type = $j('input[name=boardType]').val();
			var $frm = $j('.boardUpdate :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/board/boardUpdateAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("수정완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	});
	

</script>

<body>

<form class="boardUpdate">

	<input type="hidden" name="boardType" value="${board.boardType}">
			<input type="hidden" name="boardNum" value="${board.boardNum}">

<table align="center">
	<tr>
			<td align="right">
		
			</td>
		</tr>
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
		
					<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					${board.creator}
					</td>
				</tr>
			</table>
		</td>
	</tr>

	
	
	</form>
	
			<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
		 <input id="submit" type="button" value="등록 "></td>
	</tr>
		
		
</table>	
</body>
</html>