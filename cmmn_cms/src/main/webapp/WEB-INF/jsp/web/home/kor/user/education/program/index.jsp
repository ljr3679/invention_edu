<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
	function fn_edit(idx){
		$('#idx').val(idx);
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
		$('#cmmnForm').submit();
	}	
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<div class="cont_wrap">
	<div class="cont_each">
		<div class="left_tit">
			진흥회 추천 프로그램
			<span class="left_subtit">진흥회가 추천하는 프로그램을<br> 안내해 드립니다.</span>
			<div class="past_play_btn_box slide1_1 type1">
				<div class="control_panel">
					<button type="button" class="slick-prev slick-arrow prev">Previous</button>
					<span class="slick_bar"></span>
					<button type="button" class="slick-next slick-arrow next">Next</button>
				</div>
	        </div>
		</div>
		<div class="right_cont">
			<div class="slide_wrap">
				<ul class="past_silde_list" id="past_silde_list1_1">
					<c:forEach items="${promList}" var="list" varStatus="status">
						<li>
							<a href="javascript:void(0);" onclick="fn_edit('${list.no}');" class="slide_pdf_link">
								<div class="img_box">
									<img src="/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do" alt="">
								</div>
								<div class="img_tit2"><c:out value="${list.title}"  escapeXml="false"/></div>
								<div class="img_txt_wrap">
									<ul class="img_txt_list">
										<li>
											<div class="left_title">교육대상</div>
											<div class="right_text"><c:out value="${list.targetName}"/></div>
										</li>
										<li>
											<div class="left_title">관련교과</div>
											<div class="right_text"><c:out value="${list.subjectName}"/></div>
										</li>
									</ul>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="cont_each top_none">
		<!-- 감추기 -->
		<div class="search_wrap">
			<div class="base">
				<div class="flex">
					<label for="categori">검색</label>
					<div class="chk_list2">
						<ul class="list">
							<li>
								<span class="chk_area">
									<input type="checkbox" value="A" class="chk_inp" name="searchValueList1" <c:if test="${ fn:contains(vo.searchValueList1, 'A')}">checked="checked"</c:if>>
									<label for="chk1"><span class="text">전체</span></label>
								</span>
							</li>
							<li>
								<span class="chk_area">
									<input type="checkbox" value="B" class="chk_inp" name="searchValueList1" <c:if test="${ fn:contains(vo.searchValueList1, 'B')}">checked="checked"</c:if>>
									<label for="chk2"><span class="text">제목</span></label>
								</span>
							</li>
							<li>
								<span class="chk_area">
									<input type="checkbox" value="C" class="chk_inp" name="searchValueList1" <c:if test="${ fn:contains(vo.searchValueList1, 'C')}">checked="checked"</c:if>>
									<label for="chk3"><span class="text">목차</span></label>
								</span>
							</li>
							<li>
								<span class="chk_area">
									<input type="checkbox" value="D" class="chk_inp" name="searchValueList1" <c:if test="${ fn:contains(vo.searchValueList1, 'D')}">checked="checked"</c:if>>
									<label for="chk4"><span class="text">세부역량</span></label>
								</span>
							</li>
							<li>
								<span class="chk_area">
									<input type="checkbox" value="E" class="chk_inp" name="searchValueList1" <c:if test="${ fn:contains(vo.searchValueList1, 'E')}">checked="checked"</c:if>>
									<label for="chk5"><span class="text">프로그램 소개</span></label>
								</span>
							</li>
							<li>
								<span class="chk_area">
									<input type="checkbox" value="F" class="chk_inp" name="searchValueList1" <c:if test="${ fn:contains(vo.searchValueList1, 'F')}">checked="checked"</c:if>>
									<label for="chk6"><span class="text">키워드</span></label>
								</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="flex">
					<label for="keywords"></label>
					
					<input type="text" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}" placeholder="검색어를 입력하세요." class="search_word" style="margin-right: 110px;">

				</div>
			</div>
			<div class="detail" style="display: none;">
				<div class="flex">
					<label for="categori">교육대상</label>
					<div class="chk_list2">
						<ul class="list">
							<c:forEach items="${targetList}" var="list" varStatus="status">
								<li>
									<span class="chk_area">
										<input type="checkbox" class="chk_inp" value="${list.no}" name="searchValueList2" <c:if test="${ fn:contains(vo.searchValueList2, list.no)}">checked="checked"</c:if>>
										<label for="chk7"><span class="text">${list.dataName}</span></label>
									</span>
								</li>	
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="flex">
					<label for="categori">관련교과</label>
					<div class="chk_list2">
						<ul class="list">
							<c:forEach items="${subjectList}" var="list" varStatus="status">
								<li>
									<span class="chk_area">
										<input type="checkbox" class="chk_inp" value="${list.no}" name="searchValueList3" <c:if test="${ fn:contains(vo.searchValueList3, list.no)}">checked="checked"</c:if>>
										<label for="chk11"><span class="text">${list.dataName}</span></label>
									</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

			<div class="btn_area sty1"><button type="button" onclick="fn_cmmn_search();" class="btn_search">검색 <i class="xi-search"></i></button></div>
			<div class="btn_bottom">
				<button type="button" class="btn_open">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 179.61 36.13" width="200px" height="45px">
						<polygon points="159.61 36.13 20 36.13 0 0 179.61 0 159.61 36.13" style="fill:#317baa" />
						<text transform="translate(57.61 23.74)" style="font-size:14px;fill:#fff;font-family:'CoreDream', 'sans-serif';font-weight:500">상세보기</text>
						<polygon class="pointcursor" points="129.12 17.42 124.19 22.35 119.27 17.42 129.12 17.42" style="fill:#fff" />
					</svg>
				</button>
				<button type="button" class="btn_close">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 179.61 36.13" width="220px" height="50px">
						<polygon points="159.61 36.13 20 36.13 0 0 179.61 0 159.61 36.13" style="fill:#317baa" />
						<text transform="translate(57.61 23.74)" style="font-size:14px;fill:#fff;font-family:'CoreDream', 'sans-serif';font-weight:500">닫기</text>
						<polygon class="pointcursor" points="129.12 17.42 124.19 22.35 119.27 17.42 129.12 17.42" style="fill:#fff" />
					</svg>
				</button>
			</div>
		</div>
	</div>
	<div class="cont_each top_none">
		<div class="table_top_nav">
			<div class="left_area page_num"><i class="xi-file-text-o"></i> 총 <span class="point_blue">
			<c:choose>
				<c:when test="${not empty paginationInfo.totalRecordCount}">
					<c:out value="${paginationInfo.totalRecordCount}"/></span>개 (<span class="point_blue"><c:out value="${paginationInfo.currentPageNo}"/></span> / <c:out value="${paginationInfo.lastPageNo }"/> 페이지)</div>
				</c:when>
				<c:otherwise>0개</c:otherwise>
			</c:choose>
			<c:if test="${not empty usrSession.no}">
				<div class="right_area">
					<div class="chk_list2 sty1">
						<ul class="list">
							<li>
								<span class="chk_area">
									<input type="checkbox" class="chk_inp" id="searchValue1" name="searchValue1" value="A" onChange="fn_cmmn_search();" <c:if test="${vo.searchValue1 eq 'A'}">checked="checked"</c:if>>
									<label for="chk15"><span class="text">스크랩한 목록 보기</span></label>
								</span>
							</li>
						</ul>
					</div>
				</div>
			</c:if>
		</div>
		<div class="cont_wrap">
			<ul class="cont_slide_list">
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<li>
						<a href="javascript:void(0);" onclick="fn_edit('${list.no}');" class="slide_pdf_link">
							<div class="img_wrap">
								<div class="img_box">
									<img src="/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do" alt="">
								</div>
							</div>
							<div class="bt_box">
								<div class="img_tit2"><c:out value="${list.title}"  escapeXml="false"/></div>
								<div class="img_txt_wrap">
									<ul class="img_txt_list">
										<li>
											<div class="left_title">교육대상</div>
											<div class="right_text"><c:out value="${list.targetName}"/></div>
										</li>
										<li>
											<div class="left_title">관련교과</div>
											<div class="right_text"><c:out value="${list.subjectName}"/></div>
										</li>
									</ul>
								</div>
							</div>
						</a>
						<div class="star_wrap">
							<span class="star_btn" tabindex="0"></span>
						</div>
					</li>
				</c:forEach>
			</ul>
			<div class="table_pagging">
				<ul> 
					<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_cmmn_page" />
				</ul>
				<form:hidden path="pageIndex" />
			</div>
		</div>

	</div>
	
</div>

</form:form>
</body>