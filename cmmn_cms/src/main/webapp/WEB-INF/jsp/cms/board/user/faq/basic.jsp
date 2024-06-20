<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
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
<div class="sub_sch_box${not empty categorySearch or not empty dateSearch ?' details_sch' :''}">
	<div class="sch_box">
		<div class="box">
			<div class="row">
			<c:if test="${not empty textSearch}">
				<label for="searchValue1">키워드</label>
				<div class="slt_box">
					<select id="searchValue1" name="searchValue1">
						<option value="0">전체</option>
						<c:forEach items="${textSearch}" var="list" varStatus="status">
							<option value="${list.field}" <c:if test="${list.field eq vo.searchValue1}">selected="selected"</c:if>><c:out value="${list.title}"/></option>
						</c:forEach>
					</select>
				</div>
				<div class="input_box">
					<form:input path="searchKeyword" placeholder="검색어를 입력하세요."/>
				</div>
			</c:if>
			</div>
			<button type="button" onClick="fn_search();" class="st_sch_btn"><span class="ico">검색</span></button>
		</div>
		
		<c:if test="${not empty categorySearch or not empty dateSearch}">
		<c:set var="detail_box" value="false"/>
		<div class="box" style="display: none;">
			<div class="com_data_box">
				<c:forEach items="${categorySearch}" var="list" varStatus="status">
				<c:set var="cateIdx" value="${fn:substring(list.field, 13, fn:length(list.field))}"/>
				<c:set var="getCateName" value="category${cateIdx}Name"/>
				<c:set var="getCateChildren" value="${list.field}Children"/>
				<c:set var="searchValue" value="searchValue${(cateIdx * 2)+1}"/>
				<c:set var="searchValueChild" value="searchValue${(cateIdx * 2)+2}"/>
				<c:set var="cateList" value="${cateIdx eq 1 ?categoryList1 :cateIdx eq 2 ?categoryList2 :cateIdx eq 3 ?categoryList3 :categoryList4}"/>
				
					<c:choose>
						<c:when test="${list.option eq 'R'}">
							<div class="com_data chk_list_area">
								<div class="tit_box">
									<div class="tit"><c:out value="${list.title}"/></div>
								</div>
								<div class="chk_list">
									<c:set var="detail_box" value="${not empty vo[searchValue] ?true :false}"/>
									<input type="hidden" id="${searchValue}" name="${searchValue}" value="${vo[searchValue]}"/>
									<ul class="list">
										<li>
											<div class="btn_box">
												<button type="button" class="btn<c:if test="${empty vo[searchValue]}"> chk</c:if>" onClick="fn_cms_category(this);" data="">전체</button>
											</div>
										</li>
										<c:forEach items="${cateList}" var="cate" varStatus="varStatus2">
										<li>
											<div class="btn_box">
												<button type="button" class="btn<c:if test="${cate.no eq vo[searchValue]}"> chk</c:if>" onClick="fn_cms_category(this);" data="${cate.no}"><c:out value="${cate.dataName}"/></button>
											</div>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:when>
						<c:when test="${list.option eq 'S'}">
							<div class="com_data slt_area">
								<div class="tit_box">
									<div class="tit"><c:out value="${list.title}"/></div>
								</div>
								<div class="slt_box">
									<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/>
									<select id="${searchValue}" name="${searchValue}">
										<option value="">전체</option>
										<c:forEach items="${cateList}" var="cate" varStatus="varStatus2">
											<option value="${cate.no}" <c:if test="${cate.no eq vo[searchValue]}">selected="selected"</c:if>><c:out value="${cate.dataName}"/></option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
				
				<c:forEach items="${dateSearch}" var="date" varStatus="status">
				<c:set var="dateType" value="${fn:indexOf(date.field, 'dateField') ne -1 ?'01' :'02'}"/>
				<div class="com_data period_area">
					<div class="tit_box">
						<div class="tit"><c:out value="${date.title}"/></div>
					</div>
					<div class="period_box">
						<c:choose>
							<c:when test="${dateType eq '01'}">
								<c:set var="dateIdx" value="${fn:substring(date.field, 9, fn:length(date.field))}"/>
								<c:set var="searchDate" value="searchDate${dateIdx}"/>
								<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/>
								<input type="text" id="${searchDate}" name="${searchDate}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 일자 (yyyy-mm-dd)" value="${vo[searchDate]}" style="cursor: pointer;">
							</c:when>
							<c:when test="${dateType eq '02'}">
								<c:set var="dateIdx" value="${fn:substring(date.field, 14, fn:length(date.field))}"/>
								<c:choose>
									<c:when test="${dateIdx eq 1}">
										<c:set var="searchDateStart" value="searchDate5"/>
										<c:set var="searchDateEnd" value="searchDate6"/>
									</c:when>
									<c:when test="${dateIdx eq 2}">
										<c:set var="searchDateStart" value="searchDate7"/>
										<c:set var="searchDateEnd" value="searchDate8"/>
									</c:when>
								</c:choose>
								<c:set var="detail_box" value="${detail_box or not empty vo[searchDateStart] or not empty vo[searchDateEnd] ?true :false}"/>
								<input type="text" id="${searchDateStart}" name="${searchDateStart}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 시작 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateStart]}" style="cursor: pointer;" >
								<span class="etc">~</span>
								<input type="text" id="${searchDateEnd}" name="${searchDateEnd}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 종료 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateEnd]}" style="cursor: pointer;">
							</c:when>
						</c:choose>
					</div>
				</div>
				</c:forEach>
			</div>
			<script type="text/javascript">
				<c:if test="${detail_box}">setTimeout(function() {$('#detail_box').trigger('click');}, 200);</c:if>
			</script>
		</div>
		</c:if>
	</div>
	
	<c:if test="${not empty categorySearch or not empty dateSearch}">
	<div class="det_btn">
		<button type="button" id="detail_box" class="btn"><span class="text">상세검색</span></button>
	</div>
	</c:if>
</div>
</c:if>

<div class="faq_cont">
	<div class="synthesis">총 게시물 <span class="num"><c:out value="${boardData.pagingAt eq 'Y' ?paginationInfo.totalRecordCount :fn:length(resultList)}"/></span>개</div>
	<div class="faq_list">
		<ul class="list">
			<c:forEach items="${resultList}" var="list" varStatus="status">
			<li class="" style="">
				<div class="q_area cont"><c:out value="${list.title}" escapeXml="false"/></div>
				<div class="a_area cont">
					<c:if test="${not empty list.textareaField1 or not empty list.textareaField2 or not empty list.textareaField3 or not empty list.textareaField4 or not empty list.textareaField5}">
						<c:choose>
							<c:when test="${not empty list.textareaField1}"><c:set var="textData" value="${list.textareaField1}"/></c:when>
							<c:when test="${not empty list.textareaField2}"><c:set var="textData" value="${list.textareaField2}"/></c:when>
							<c:when test="${not empty list.textareaField3}"><c:set var="textData" value="${list.textareaField3}"/></c:when>
							<c:when test="${not empty list.textareaField4}"><c:set var="textData" value="${list.textareaField4}"/></c:when>
							<c:when test="${not empty list.textareaField5}"><c:set var="textData" value="${list.textareaField5}"/></c:when>
						</c:choose>
						
						<c:out value="${cFn:escapeXml(textData)}" escapeXml="false"/>
					</c:if>
					<c:if test="${not empty list.attachName}">
						<a href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}');" class="flie"><span class="text"><c:out value="${list.attachName}"/></span></a>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>

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