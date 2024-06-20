<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script type="text/javascript">
		function fn_edit(act, idx) {
			$('#idx').val(idx);
			$('#act').val(act);
			$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
			$('#cmmnForm').submit();
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="idx" name="idx"/>
<input type="hidden" id="act" name="act"/>
	
	<div class="sub_sch_box">
		<div class="row">
			<label style="width: 10%">사용여부</label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue2" class="join_select1">
					<option value="">전체</option>
					<option value="Y" <c:if test="${vo.searchValue2 eq 'Y'}">selected="selected"</c:if>>사용</option>
					<option value="N" <c:if test="${vo.searchValue2 eq 'N'}">selected="selected"</c:if>>미사용</option>
				</select>
			</div>
			<label style="width: 10%"> 키워드 </label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue1" class="join_select1">
					<option value="0" <c:if test="${vo.searchValue1 eq 0}">selected="selected"</c:if>>전체</option>
					<option value="1" <c:if test="${vo.searchValue1 eq 1}">selected="selected"</c:if>>제목</option>
					<option value="2" <c:if test="${vo.searchValue1 eq 2}">selected="selected"</c:if>>내용</option>
				</select>
			</div>
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="제목을 입력하세요."/>
			</div>
			<a href="javascript:void(0);" onClick="fn_cmmn_search();" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<div class="clearfix">
		<div class="fr">
			<a href="javascript:void(0);" onClick="fn_edit('regist');" class="fr_btn">등록</a>
		</div>
	</div>
	
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:35%;">
			<col style="width:35%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">사용여부</th>
				<th scope="col">제목</th>
				<th scope="col">등록정보</th>
				<th scope="col">수정정보</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<td>
					<a href="javascript:void(0);" onClick="fn_edit('modify', '${list.no}');">
						<c:choose>
							<c:when test="${list.useAt eq 'Y'}">사용</c:when>
							<c:when test="${list.useAt eq 'N'}">미사용</c:when>
						</c:choose>
					</a>
				</td>
				<td><a href="javascript:void(0);" onClick="fn_edit('modify', '${list.no}');"><c:out value="${list.title}"/></a></td>
				<td><a href="javascript:void(0);" onClick="fn_edit('modify', '${list.no}');"><c:out value="${list.registerName} (${list.registerId}) - ${list.regDate}"/></a></td>
				<td><a href="javascript:void(0);" onClick="fn_edit('modify', '${list.no}');"><c:out value="${list.modifierName} (${list.modifierId}) - ${list.modDate}"/></a></td>
			</tr>
		</c:forEach>
		<c:if test="${empty resultList}">
			<tr>
				<td id="empty_row">검색된 결과가 없습니다.</td>
				<script>$('#empty_row').attr('colspan',$('#empty_row').parent().parent().parent().find('th').length);</script>
			</tr>
		</c:if>
		</tbody>
	</table>
	
	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex" />
	</div>
</form:form>
</body>