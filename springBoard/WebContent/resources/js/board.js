

/* 페이징처리 링크 클릭했을때 */
$j(document)
	.on(
		'click',
		'#pageLinksArea a',
		function(event) {
			event.preventDefault();

			var pageNo = $j(this).text(); // 클릭된 페이지 번호 가져오기

			if (pageNo != '다음') {
				$j('input[name="nowPage"]').val(pageNo);
			}

			var nowPage = parseInt($j('input[name="nowPage"]')
				.val(), 10);

			if (isNaN(nowPage)) {
				nowPage = 1; // nowPage 값이 없는 경우, 첫 번째 페이지로 설정
			}

			if (pageNo === '다음') {

				if (nowPage % 5 == 0) {
					pageNo = nowPage + 1;
				} else if (nowPage <= 5) {
					pageNo = 6;
				} else {
					/* 이식 잘못된거같다 ((nowPage/5)+1) * 5 + 1 이 맞는거 같음 ### */
					pageNo = (nowPage / 5) * 5 + 1;
				}

			}


			if (pageNo === '이전') {

				if (nowPage % 5 == 0) {
					pageNo = nowPage - 1;
				} else {
					pageNo = (nowPage / 5) * 5;
				}

			}




			var type = $j('input[name=boardType]:checked')
				.val();

			$j
				.ajax({
					url: "/board/boardListSearch.do",
					dataType: "json",
					type: "GET",
					data: {
						boardType: type,
						pageNo: pageNo
						// 클릭된 페이지 번호 전달
					},
					contentType: "application/json; charset=UTF-8",
					success: function(data, textStatus,
						jqXHR) {

						updatdTable(data);

						updatePage(pi, totalCnt, pageNo);


						// 설정한 값에 따라 숫자 출력 
						$j("#totalCountArea").html(
							"<td align='right'>total : "
							+ totalCnt
							+ "</td>");

					},
					error: function(jqXHR, textStatus,
						errorThrown) {
						console.log("에러: " + errorThrown);
					}
				});
		});






/* 체크박스 함수 */



function checkboxGroup(checkbox) {
	var checkboxes = document.getElementsByName('boardType');

	// 전체 선택 체크박스가 선택된 경우
	if (checkbox.value === 'selectAll') {
		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = checkbox.checked;
		}
	} else {
		var allChecked = true;

		// 전체 선택 체크박스 해제
		checkboxes[0].checked = false;

		// 다른 체크박스 하나라도 해제된 경우
		for (var i = 1; i < checkboxes.length; i++) {
			if (!checkboxes[i].checked) {
				allChecked = false;
				break;
			}
		}

		// 다른 모든 체크박스가 선택된 경우
		if (allChecked) {
			checkboxes[0].checked = true;
		}
	}
}





$j(document).ready(function() {


	$j('#boardSearchBtn').on("click", function() {

		var checkArr = [];
		var boardType = "";

		$j('input[name="boardType"]:checked').each(function() {
			var chk = $j(this).val();

			checkArr.push(chk);

			if (checkArr[0] === 'selectAll') {
				boardType = 'selectAll';
			} else {


				boardType = checkArr.map(function(value) {
					return "'" + value + "'";
				}).join(',');

				boardType = boardType.substring(1, boardType.length - 1);
			}




			console.log(boardType);

			// 여기 ajax
			$j.ajax({

				type: 'GET',
				url: "/board/boardListSearch.do",
				data: {
					boardType: boardType
				},
				success: function(data) {
					updatdTable(data);


				},
				error: function(error) {
					alert('잘못됐다~~~');
				}

			});


			// 여기 ajax




		});


	});





});




/* 공통 함수 */




function updatdTable(data) {
	var boardList = data.boardList;
	var boardType = data.boardType;
	var totalCnt = data.totalCnt;
	var pageNo = data.pageNo;
	var pi = data.pi;

	let value = "";
	let codeName = "";

	let add = "";

	console.log('------------------------------');
	console.log(pageNo);
	
	console.log('------------------------------');

	let tableBody = $j('#boardTable tbody')

	for (let i in boardList) {

		for (let a in boardType) {
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

console.log(pi);

	updatePage(pi, totalCnt, pageNo);


	// 설정한 값에 따라 숫자 출력 
	$j("#totalCountArea").html(
		"<td align='right'>total : "
		+ totalCnt
		+ "</td>");


}
/* 공통함수끝 */



/* 페이징 처리 ajax */
function updatePage(pi,totalCut, pageNo) {
	
	



	pageLinks = "";

	var start = pi.startPage;
	var nextLink = "";


	let pageArea = $j('#pageLinksArea');


	var prevLink = (pi.currentPage > 5) ? "<a class='page-link' href=''>이전</a>"
		: "";

	for (var i = start; i <= pi.endPage; i++) {
		pageLinks += " <a class='page-link' href='/board/boardList.do?pageNo="
			+ i + "'>" + i + "</a>";
		 nextLink = (i % 5 == 0) ?
			" <a class='page-link' href=''>다음</a>" : "";

	}


	var updatedPageLinks = "<div align='center'>" + prevLink
		+ pageLinks + nextLink + "</div>";



	pageArea.html(updatedPageLinks);

}




