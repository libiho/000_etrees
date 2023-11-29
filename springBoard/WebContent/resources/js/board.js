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
		
		
		
		
		
		
		/* 체크박스 조회버튼 클릭시 */
		$j(document)
			.ready(
					function() {

						$j("#boardSearchBtn")
								.on(
										"click",
										function(event) {

											event.preventDefault(); // 폼 전송 기본 동작 막기 -> 안하면 두번 controller 탐 

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
														contentType : "application/json; charset=UTF-8",
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

															// 설정한 값에 따라 숫자 출력 
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
																	.log("왜 에러가 나는지는 모르겠는데 납니다요");
														},
														complete : function() {
															// 요청 완료 후 버튼 다시 활성화
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	