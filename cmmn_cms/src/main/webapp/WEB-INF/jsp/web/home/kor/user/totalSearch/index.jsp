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
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<div class="cont_wrap">
                   <div class="cont_each">
		<div class="search_wrap">
			<div class="base flex">
				<input type="text" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}" placeholder="검색어를 입력하세요." class="search_word">
				<button type="button" onclick="fn_cmmn_search();" class="btn_search">검색 <i class="xi-search"></i></button>
			</div>
		</div>
		<div class="table_top_nav">
			<div class="left_area page_num"><i class="xi-file-text-o"></i> 총 <span class="point_blue">
				<c:choose>
					<c:when test="${not empty paginationInfo.totalRecordCount}"><c:out value="${paginationInfo.totalRecordCount}"/>개</c:when>
					<c:otherwise>0개</c:otherwise>
				</c:choose>
				</span>
			</div> 
		</div>
		<div class="board_wrap">
			<!-- 데이터없을시 -->
			<c:if test="${empty resultList}">
				<div class="no_data">
					<span class="teg">'<c:out value="${vo.searchKeyword}"/>'</span>에 대한 검색결과가 없습니다.
				</div>
			</c:if> 
			<!-- 데이터 있을시 --> 
			<div class="list_type_board">
				<ul class="item_list">
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<li class="item">
							<c:choose>
								<c:when test="${list.menuNo eq '111'}">
									<a href="/${vo.siteCode}/${vo.langCode}/inventor/meister/announce/edit.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu'.concat(list.menuNo))}&act=detail&idx=${list.no}&pageIndex=1" target="_blank" class="wrapper">
										<div class="path_container">
											<ul class="item_list">
												<c:if test="${not empty list.parentTitle1}">
													<li class="item"><c:out value="${list.parentTitle1}" escapeXml="false"/></li>
												</c:if>
												<c:if test="${not empty list.parentTitle}">
													<li class="item"><c:out value="${list.parentTitle}" escapeXml="false"/> </li>	
												</c:if>
												<c:if test="${not empty list.menuTitle}">
													<li class="item"><c:out value="${list.menuTitle}" escapeXml="false"/> ( <c:out value="${list.regDate}"  escapeXml="false"/> )</li>
												</c:if>
											</ul>
										</div>
										<div class="title_container">
											<c:out value="${list.title}"  escapeXml="false"/> 
										</div>
									</a>
								</c:when>
								<c:when test="${list.menuNo eq '71'}">
									<a href="${list.content}" target="_blank" class="wrapper">
										<div class="path_container">
											<ul class="item_list">
												<c:if test="${not empty list.parentTitle1}">
													<li class="item"><c:out value="${list.parentTitle1}" escapeXml="false"/></li>
												</c:if>
												<c:if test="${not empty list.parentTitle}">
													<li class="item"><c:out value="${list.parentTitle}" escapeXml="false"/> </li>	
												</c:if>
												<c:if test="${not empty list.menuTitle}">
													<li class="item"><c:out value="${list.menuTitle}" escapeXml="false"/> ( <c:out value="${list.regDate}"  escapeXml="false"/> )</li>
												</c:if>
											</ul>
										</div>
										<div class="title_container">
											<c:out value="${list.title}"  escapeXml="false"/> 
										</div>
									</a>
								</c:when>								
								<c:otherwise>
									<a href="/${vo.siteCode}/${vo.langCode}${list.menuUri}?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu'.concat(list.menuNo))}&act=detail&idx=${list.no}&pageIndex=1" target="_blank" class="wrapper">
										<div class="path_container">
											<ul class="item_list">
												<c:if test="${not empty list.parentTitle1}">
													<li class="item"><c:out value="${list.parentTitle1}" escapeXml="false"/></li>
												</c:if>
												<c:if test="${not empty list.parentTitle}">
													<li class="item"><c:out value="${list.parentTitle}" escapeXml="false"/> </li>	
												</c:if>
												<c:if test="${not empty list.menuTitle}">
													<li class="item"><c:out value="${list.menuTitle}" escapeXml="false"/> ( <c:out value="${list.regDate}"  escapeXml="false"/> )</li>
												</c:if>
											</ul>
										</div>
										<div class="title_container">
											<c:out value="${list.title}"  escapeXml="false"/> 
										</div>
									</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<c:if test="${not empty vo.searchKeyword}">
			<div class="table_pagging">
				<ul> 
					<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_cmmn_page" />
				</ul>
				<form:hidden path="pageIndex" />
			</div>
		</c:if>
	</div>
</div>
</form:form>
</body>