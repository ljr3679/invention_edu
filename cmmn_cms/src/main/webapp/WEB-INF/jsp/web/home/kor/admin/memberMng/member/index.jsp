<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_edit(idx) {
// 		$('#idx').val(idx);
// 		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
// 		$('#cmmnForm').submit();
	}
	
	/* function fn_delete() {
		if($('input[name=paramKeyList1]:checked').length == 0) {
			alert('삭제할 항목 하나 이상을 선택하여 주십시오.');
			return;
		}
		
		if(confirm('삭제 하시겠습니까?')) {
			$('#act').val('delete');
			$('#cmmnForm').attr('action', "${vo.selfPath}edit.act");
			$('#cmmnForm').submit();
		}
	} */
	/* function fn_download() {
		if(fn_validation_check($('#excelDownForm'))) {
			fn_layer_close();
			$('#excelDownForm').unbind();
			$('#excelDownForm').attr('action', "${vo.selfPath}excelDownload.do");
			$('#excelDownForm').submit();
		}
	} */
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="idx" name="idx"/>

	<div class="sub_sch_box">
		<div class="row">
			<label for="searchValue3">키워드</label>
			<div class="slt_box" style="width: 150px;">
				<select id="searchValue3" name="searchValue3" class="join_select1">
					<option value="0">전체</option>  
					<option value="1"<c:if test="${vo.searchValue3 eq '1'}">selected="selected"</c:if>>아이디</option>
					<option value="2"<c:if test="${vo.searchValue3 eq '2'}">selected="selected"</c:if>>이름</option>
					<option value="3"<c:if test="${vo.searchValue3 eq '3'}">selected="selected"</c:if>>KIPA</option>
				</select>
			</div>
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="성명을 입력하세요."/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div> 
	
	<div class="clearfix">
		<div class="fr_cnt">
			<p>Total <c:out value="${paginationInfo.totalRecordCount}"/></p>
		</div>
		<div class="fr">
		</div>
	</div>
	
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:auto;">
			<col style="width:20%;">
			<col style="width:20%;"> 
			<col style="width:20%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">KIPA</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.id}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.name}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${cFn:decrypt(list.email)}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.ssoNo}"/></a></td>
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
	<!-- pagination -->
	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex" />
	</div>
	<!-- // pagination -->
</form:form>
</body>