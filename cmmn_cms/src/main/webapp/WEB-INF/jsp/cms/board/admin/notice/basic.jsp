<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_edit(act, idx) {
		$('#act').val(act);
		$('#idx').val(idx);
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
	
	$('#searchKeyword').on('keypress', function() {
		if (window.event.keyCode == 13) {
			fn_search();
		}
	});
</script>
</head>
<body>
<script>
function fn_cate_select(id1, id2, select) {
	var data = {'value': $('#'+id1).val(), 'select':select};
	fn_cmmn_ajax('/cmsManager/cms/board/cate.ajax', true, data, 'text', function(result) {
		if(result) {
			$('#'+id2).css('display', '');
			$('#'+id2).html(result);
			$('#'+id2).select2();
		} else {
			$('#'+id2).html('');
			if($('#'+id2).css('display') != 'none') {
				$('#'+id2).select2('destroy');
				$('#'+id2).css('display', 'none');
			}
		}
	}, true);
}
</script>

<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="act" name="act"/>
<input type="hidden" id="idx" name="idx"/>

	<!-- sub_sch_box -->
	<c:if test="${boardData.searchAt eq 'Y'}">
	<div class="sub_sch_box">
		<c:if test="${not empty categorySearch}">
		<div class="row">
			<%-- <c:forEach items="${categorySearch}" var="list" varStatus="varStatus">
				<c:set var="cateIdx" value="${fn:substring(list.field, 13, fn:length(list.field))}"/>
				<c:set var="getCateName" value="category${cateIdx}Name"/>
				<c:set var="getCateChildren" value="${list.field}Children"/>
				<c:set var="searchValue" value="searchValue${(cateIdx * 2)+1}"/>
				<c:set var="searchValueChild" value="searchValue${(cateIdx * 2)+2}"/>
				<c:set var="cateList" value="${cateIdx eq 1 ?categoryList1 :cateIdx eq 2 ?categoryList2 :cateIdx eq 3 ?categoryList3 :categoryList4}"/>
				
				<label for="${searchValue}"><c:out value="${list.title}"/></label>
				<div class="slt_box" style="width: 10%;">
				<select id="${searchValue}" name="${searchValue}" class="join_select1" onChange="fn_cate_select('${searchValue}', '${searchValueChild}');">
					<option value="">전체</option>
					<c:forEach items="${cateList}" var="cate" varStatus="varStatus2">
						<option value="${cate.no}" <c:if test="${cate.no eq vo[searchValue]}">selected="selected"</c:if>><c:out value="${cate.dataName}"/></option>
					</c:forEach>
				</select>
				</div>
				<c:if test="${boardData[getCateChildren] gt 0}">
				<div class="slt_box" style="width: 10%;">
				<select id="${searchValueChild}" name="${searchValueChild}" style="display: none; min-width: 150px;">
				</select>
				</div>
				<script>fn_cate_select('${searchValue}', '${searchValueChild}', '${vo[searchValueChild]}');</script>
				</c:if>
				
			</c:forEach> --%>
		</div>
		</c:if>
		
		<div class="row">
			<c:if test="${not empty searchUseAt}">
				<label for="searchValue2">사용 여부</label>
				<div class="slt_box" style="width: 10%;">
					<select id="searchValue2" name="searchValue2" class="join_select1">
						<option value="">전체</option>
						<option value="Y" <c:if test="${vo.searchValue2 eq 'Y'}">selected="selected"</c:if>>사용</option>
						<option value="N" <c:if test="${vo.searchValue2 eq 'N'}">selected="selected"</c:if>>미사용</option>
					</select>
				</div>
			</c:if>
			<c:if test="${not empty textSearch}">
				<label for="">키워드</label>
				<div class="slt_box" style="width: 10%;">
					<select id="searchValue1" name="searchValue1" class="join_select1">
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
			<a onClick="fn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	</c:if>
	<!-- // sub_sch_box -->
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr">
			<a onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<c:forEach items="${boardData.listViewPercents}" var="list" varStatus="status">
				<col style="width: ${list}%;">
			</c:forEach>
		</colgroup>
		<thead>
			<tr>
				<c:forEach items="${boardData.listViewTitles}" var="list" varStatus="status">
					<th scope="col"><c:out value="${list eq 'no' ?'No' :list}"/></th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
		<tr <c:if test="${list.isTop eq 'Y'}">class="top"</c:if>>
			<c:forEach items="${boardData.listViewFields}" var="field" varStatus="status2">
			<td>
				<c:choose>
					<c:when test="${field eq 'no'}">
						<c:choose>
							<c:when test="${list.isTop eq 'Y'}">
								<em id="fc_${status.count}" class="fc_red">주요</em>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${boardData.pagingAt eq 'Y'}">
										<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></a>
									</c:when>
									<c:otherwise>
										<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${status.count}"/></a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${field eq 'register'}">
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.writer}"/></a>
					</c:when>
					<c:when test="${field eq 'title'}">
						<c:if test="${boardData.secretAt eq 'Y' and not empty list.secret}">[비밀글]</c:if>
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.title}"/></a>
					</c:when>
					<c:when test="${field eq 'attachFile'}">
						<c:choose>
							<c:when test="${not empty list.attachName}">
								<a onclick="cmmn_file_down('${list.attachName}','${list.attachReName}');" style="cursor: pointer;"><img src="/images/cmmn/file/filetype/${list.extension}.gif" onerror="this.src='/images/cmmn/file/filetype/unknown.gif'" alt="첨부파일"></a>
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${field eq 'useAt'}">
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.useAt eq 'Y'?'사용' :'미사용'}"/></a>
					</c:when>
					<c:when test="${fn:indexOf(field, 'categoryField') ne -1}">
						<c:set var="cateIdx" value="${fn:substring(field, 13, fn:length(field))}"/>
						<c:set var="getCate" value="category${cateIdx}Name"/>
						<c:set var="getCateChild" value="category${cateIdx}ChildName"/>
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">
							<c:out value="${list.get(getCate)}" escapeXml="false"/>
							<c:if test="${not empty list.get(getCateChild)}">
							 > <c:out value="${list.get(getCateChild)}" escapeXml="false"/>
							</c:if>
						</a>
					</c:when>
					<c:when test="${fn:indexOf(field, 'dateArrayField') ne -1}">
                            <c:set var="startDate" value="${field}Start"/>
                            <c:set var="endDate" value="${field}End"/>
                            <a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">
                                    <c:out value="${list.get(startDate)} ~ ${list.get(endDate)}" escapeXml="false"/>
                            </a>
                    </c:when>
                    <c:when test="${field eq 'answerAt'}">
                    	<c:choose>
                    		<c:when test="${boardData.answerAt eq 'Y' and not empty list.answer and list.answer ne '<p>&nbsp;</p>'}">
                    			[답변완료]
                    		</c:when>
                    		<c:otherwise>
                    			[답변 미완료]
                    		</c:otherwise>
                    	</c:choose>
                    </c:when>
					<c:otherwise>
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.get(field)}" escapeXml="false"/></a>
					</c:otherwise>
				</c:choose>
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
		<c:if test="${empty resultList}">
			<tr>
				<td id="empty_row">등록된 게시물이 없습니다.</td>
				<script>$('#empty_row').attr('colspan',$('#empty_row').parent().parent().parent().find('th').length);</script>
			</tr>
		</c:if>
		</tbody>
	</table>
	<!-- list -->
	
	
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