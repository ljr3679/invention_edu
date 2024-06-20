<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_edit(act, idx, secret) {
		<c:choose>
			<c:when test="${boardData.viewAuth eq 'A'}">
				alert('관리자만 접근가능합니다.');
				return;
			</c:when>
			<c:when test="${boardData.viewAuth eq 'U' and empty usrSession}">
				alert('로그인 후 이용해주세요.');
				return;
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${boardData.secretAt eq 'Y'}">
						if(secret == 'Y') {
							var inputData = prompt('비밀번호를 입력하세요.');
	
							if(inputData) {
								var data = {'idx':idx, 'inputData':inputData};
								fn_cmmn_ajax('/cms/board/secret.ajax', true, data, 'text', function(result) {
									if(result == 'Y') {
										$('#act').val(act);
										$('#idx').val(idx);
										$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
										$('#cmmnForm').submit();
									} else {
										alert('비밀번호가 틀렸습니다.\n다시 입력해주세요.');
										return;
									}
								}, true);
							} else {
								alert('비밀번호를 입력해주세요.');
								return;
							}
						} else {
							$('#act').val(act);
							$('#idx').val(idx);
							$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
							$('#cmmnForm').submit();
						}
					</c:when>
					<c:otherwise>
						$('#act').val(act);
						$('#idx').val(idx);
						$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
						$('#cmmnForm').submit();
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	}

	function fn_regist() {
		$('#act').val('regist');
		$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
		$('#cmmnForm').submit();
	}
	
	function fn_search() {
		$('#act').remove();
		$('#pageIndex').val('1');
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}
	
	function fn_cmmn_list_page(pageNo) {
		$('#act').remove();
		$('#pageIndex').val(pageNo);
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}
	
	function fn_cms_category(obj) {
		$(obj).parent().parent().parent().find('button').removeClass('chk');
		$(obj).addClass('chk');
		$(obj).parent().parent().parent().prev().val($(obj).attr('data'));
	}
	
	$('#searchKeyword').on('keypress', function() {
		if (window.event.keyCode == 13) {
			fn_search();
		}
	});
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="get">
<input type="hidden" name="menuPos" value="${menuPos}"/>
<input type="hidden" id="act" name="act"/>
<input type="hidden" id="idx" name="idx"/>

<c:if test="${boardData.searchAt eq 'Y'}">
<div class="cont_wrap sub_sch_box${not empty categorySearch or not empty dateSearch ?' details_sch' :''}">
	<div class="cont_each">
		<div class="box">
			<div class="search_wrap">
			<c:if test="${not empty textSearch}">
				<div class="base flex">
					<label for="searchValue1">키워드</label>
					<select id="searchValue1" name="searchValue1">
						<option value="0">전체</option>
						<c:forEach items="${textSearch}" var="list" varStatus="status">
							<option value="${list.field}" <c:if test="${list.field eq vo.searchValue1}">selected="selected"</c:if>><c:out value="${list.title}"/></option>
						</c:forEach>
					</select>
					<form:input path="searchKeyword" placeholder="검색어를 입력하세요." class="search_word"/>
					<button type="button" class="btn_search" onClick="fn_search();">검색 <i class="xi-search"></i></button>
				</div>
			</c:if>
			</div>
		</div>
		
<%-- 		<c:if test="${not empty categorySearch or not empty dateSearch}"> --%>
<%-- 		<c:set var="detail_box" value="false"/> --%>
<!-- 		<div class="box" style="display: none;"> -->
<!-- 			<div class="com_data_box"> -->
<%-- 				<c:forEach items="${categorySearch}" var="list" varStatus="status"> --%>
<%-- 				<c:set var="cateIdx" value="${fn:substring(list.field, 13, fn:length(list.field))}"/> --%>
<%-- 				<c:set var="getCateName" value="category${cateIdx}Name"/> --%>
<%-- 				<c:set var="getCateChildren" value="${list.field}Children"/> --%>
<%-- 				<c:set var="searchValue" value="searchValue${(cateIdx * 2)+1}"/> --%>
<%-- 				<c:set var="searchValueChild" value="searchValue${(cateIdx * 2)+2}"/> --%>
<%-- 				<c:set var="cateList" value="${cateIdx eq 1 ?categoryList1 :cateIdx eq 2 ?categoryList2 :cateIdx eq 3 ?categoryList3 :categoryList4}"/> --%>
				
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${list.option eq 'R'}"> --%>
<!-- 							<div class="com_data chk_list_area"> -->
<!-- 								<div class="tit_box"> -->
<%-- 									<div class="tit"><c:out value="${list.title}"/></div> --%>
<!-- 								</div> -->
<!-- 								<div class="chk_list"> -->
<%-- 									<c:set var="detail_box" value="${not empty vo[searchValue] ?true :false}"/> --%>
<%-- 									<input type="hidden" id="${searchValue}" name="${searchValue}" value="${vo[searchValue]}"/> --%>
<!-- 									<ul class="list"> -->
<!-- 										<li> -->
<!-- 											<div class="btn_box"> -->
<%-- 												<button type="button" class="btn<c:if test="${empty vo[searchValue]}"> chk</c:if>" onClick="fn_cms_category(this);" data="">전체</button> --%>
<!-- 											</div> -->
<!-- 										</li> -->
<%-- 										<c:forEach items="${cateList}" var="cate" varStatus="varStatus2"> --%>
<!-- 										<li> -->
<!-- 											<div class="btn_box"> -->
<%-- 												<button type="button" class="btn<c:if test="${cate.no eq vo[searchValue]}"> chk</c:if>" onClick="fn_cms_category(this);" data="${cate.no}"><c:out value="${cate.dataName}"/></button> --%>
<!-- 											</div> -->
<!-- 										</li> -->
<%-- 										</c:forEach> --%>
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${list.option eq 'S'}"> --%>
<!-- 							<div class="com_data slt_area"> -->
<!-- 								<div class="tit_box"> -->
<%-- 									<div class="tit"><c:out value="${list.title}"/></div> --%>
<!-- 								</div> -->
<!-- 								<div class="slt_box"> -->
<%-- 									<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/> --%>
<%-- 									<select id="${searchValue}" name="${searchValue}"> --%>
<!-- 										<option value="">전체</option> -->
<%-- 										<c:forEach items="${cateList}" var="cate" varStatus="varStatus2"> --%>
<%-- 											<option value="${cate.no}" <c:if test="${cate.no eq vo[searchValue]}">selected="selected"</c:if>><c:out value="${cate.dataName}"/></option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:when> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>
				
<%-- 				<c:forEach items="${dateSearch}" var="date" varStatus="status"> --%>
<%-- 				<c:set var="dateType" value="${fn:indexOf(date.field, 'dateField') ne -1 ?'01' :'02'}"/> --%>
<!-- 				<div class="com_data period_area"> -->
<!-- 					<div class="tit_box"> -->
<%-- 						<div class="tit"><c:out value="${date.title}"/></div> --%>
<!-- 					</div> -->
<!-- 					<div class="period_box"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${dateType eq '01'}"> --%>
<%-- 								<c:set var="dateIdx" value="${fn:substring(date.field, 9, fn:length(date.field))}"/> --%>
<%-- 								<c:set var="searchDate" value="searchDate${dateIdx}"/> --%>
<%-- 								<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/> --%>
<%-- 								<input type="text" id="${searchDate}" name="${searchDate}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 일자 (yyyy-mm-dd)" value="${vo[searchDate]}" style="cursor: pointer;"> --%>
<%-- 							</c:when> --%>
<%-- 							<c:when test="${dateType eq '02'}"> --%>
<%-- 								<c:set var="dateIdx" value="${fn:substring(date.field, 14, fn:length(date.field))}"/> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${dateIdx eq 1}"> --%>
<%-- 										<c:set var="searchDateStart" value="searchDate5"/> --%>
<%-- 										<c:set var="searchDateEnd" value="searchDate6"/> --%>
<%-- 									</c:when> --%>
<%-- 									<c:when test="${dateIdx eq 2}"> --%>
<%-- 										<c:set var="searchDateStart" value="searchDate7"/> --%>
<%-- 										<c:set var="searchDateEnd" value="searchDate8"/> --%>
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
<%-- 								<c:set var="detail_box" value="${detail_box or not empty vo[searchDateStart] or not empty vo[searchDateEnd] ?true :false}"/> --%>
<%-- 								<input type="text" id="${searchDateStart}" name="${searchDateStart}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 시작 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateStart]}" style="cursor: pointer;" > --%>
<!-- 								<span class="etc">~</span> -->
<%-- 								<input type="text" id="${searchDateEnd}" name="${searchDateEnd}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 종료 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateEnd]}" style="cursor: pointer;"> --%>
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
<!-- 			<script type="text/javascript"> -->
<%-- 			<c:if test="${detail_box}">setTimeout(function() {$('#detail_box').trigger('click');}, 200);</c:if> --%>
<!-- 			</script> -->
<!-- 		</div> -->
<%-- 		</c:if> --%>
	</div>
	
<%-- 	<c:if test="${not empty categorySearch or not empty dateSearch}"> --%>
<!-- 	<div class="det_btn"> -->
<!-- 		<button type="button" id="detail_box" class="btn"><span class="text">상세검색</span></button> -->
<!-- 	</div> -->
<%-- 	</c:if> --%>
</div>
</c:if>

    <div class="table_top_nav">
		<div class="left_area page_num"><i class="xi-file-text-o"></i> 총 <span class="point_blue"><c:out value="${boardData.pagingAt eq 'Y' ?paginationInfo.totalRecordCount :fn:length(resultList)}"/></span>개 </div>
	</div>
    <div class="poster_list">
		<ul class="list">
			<c:forEach items="${resultList}" var="list" varStatus="status">
			<li>
				<a href="javascript:void(0);" onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" class="box">
					<div class="img_box">
						<div class="inner_box" style="background: url(/images/site/${fn:substring(list.thumbnailReName, 0, fn:indexOf(list.thumbnailReName, list.thumbnailExtension)-1)}/${list.thumbnailExtension}/loader.do)">
							<img src="/images/home/kor/user/bg/bg_post.png" alt="해당 게시물 이미지가 없습니다." 
							<c:if test="${menuPos eq cFn:arrIndexOf(menuIdxList, 'menu124')}"> class="pds420"</c:if>
							<c:if test="${menuPos eq cFn:arrIndexOf(menuIdxList, 'menu89')}"> class="pds430"</c:if>
							<c:if test="${menuPos eq cFn:arrIndexOf(menuIdxList, 'menu90')}"> class="pds210"</c:if>
							<c:if test="${menuPos eq cFn:arrIndexOf(menuIdxList, 'menu92')}"> class="pds225"</c:if>
							 >
						</div>
					</div>
					<div class="txt_box">
						<div class="tit_area">
							<div class="tit"><c:out value="${list.title}" escapeXml="false"/></div>
						</div>
						<div class="txt_area">
							<div class="txt"><span class="ft_c">등록자</span><c:out value="${list.writer}"/></div>
						</div>
						<div class="data_list">
							<ul class="list">
								<li><i class="xi-time-o"></i> 등록일 : <c:out value="${list.regDate}"/></li>
								<li><i class="xi-eye-o"></i> 조회 : <c:out value="${list.cnt}"/></li>
							</ul>
						</div>
					</div>
				</a>
			</li>
			</c:forEach>
		</ul>
	</div>
<!-- </div> -->

<c:if test="${boardData.registAuth eq 'E' or (boardData.registAuth eq 'U' and not empty usrSession)}">
<div class="btn_area">
	<a onClick="fn_regist();" class="btn_color" style="cursor: pointer;">글쓰기</a>
</div>
</c:if>

	<!-- pagination -->
	<c:if test="${boardData.pagingAt eq 'Y'}">
	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_list_page" />
		<form:hidden path="pageIndex" />
	</div>
	</c:if>
	<!-- // pagination -->
	
</form:form>
</body>