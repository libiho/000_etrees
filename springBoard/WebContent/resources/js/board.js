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
	
	
	
	
	
	
	
	
	
	
	
	/* 페이징처리 링크 클릭했을때 */
		$j(document)
				.on(
						'click',
						'#basicPageLink a',
						function(event) {
							event.preventDefault();
							
							var nowPage = $j('input[name=nowPage]').val();
							
							console.log(nowPage);

							var pageNo = $j(this).text(); // 클릭된 페이지 번호 가져오기
							
							if (pageNo === '다음') {
							    pageNo = 6; // 다음 페이지를 클릭하면 페이지 번호를 6으로 설정
							}
							
							
							if (pageNo >= 5 && pageNo % 5 != 0) {
							    // 현재 페이지 그룹의 다음 페이지로 이동
							    pageNo = ((pageNo / 5) *5) +1;
							} else if (pageNo <= 5) {
							    // 첫 페이지에서 '다음' 클릭 시 처리 (1 -> 6)
							    pageNo = 6;
							} else if (pageNo % 5 == 0) {
							    // 5의 배수인 페이지에서 '다음' 클릭 시 처리 (5, 10, 15...)
							    pageNo += 1;
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
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console.log("에러: " + errorThrown);
										}
									});
						});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	