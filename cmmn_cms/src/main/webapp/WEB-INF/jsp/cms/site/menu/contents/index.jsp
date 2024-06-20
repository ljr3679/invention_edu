<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_edit(act, idx) {
		$('#board_code').val(idx);
		$('#act').val(act);
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
		$('#cmmnForm').submit();
	}
	
	function fn_delete() {
		if($('input[name=paramKeyList1]:checked').length == 0) {
			alert('삭제할 항목 하나 이상을 선택하여 주십시오.');
			return;
		}
		
		fn_cmmn_form_ajax("${vo.selfPath}check.ajax", true, new FormData($('#cmmnForm')[0]), 'json', function(data) {
			if(data.result == 'T') {
				if(confirm('삭제 하시겠습니까?')) {
					$('#act').val('delete');
					$('#cmmnForm').attr('action', "${vo.selfPath}edit.act");
					$('#cmmnForm').submit();
				}	
			} else {
				alert(data.menuTitle+' 메뉴에서 사용하고 있습니다.\n변경 후 삭제해주세요.');
			}
		}, true);
		
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<input type="hidden" id="board_code" name="board_code"/>
<input type="hidden" id="act" name="act"/>
	<!-- sub_sch_box -->
	<div class="sub_sch_box">
		<div class="row">
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="컨텐츠명을 입력하세요."/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	<!-- // sub_sch_box -->
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr">
			<a onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
			<a onClick="fn_delete();" style="cursor:pointer" class="btn delete">삭제</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:10%;">
			<col style="width:auto;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">컨텐츠 명</th>
				<th scope="col">등록자 ID</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<td><a onClick="fn_edit('modify', '${list.boardCode}');" style="cursor:pointer"><c:out value="${list.title}"/></a></td>
				<td><c:out value="${list.registerId}"/></td>
				<td><c:out value="${list.registerName}"/></td>
				<td><c:out value="${list.regDate}"/></td>
				<td><input type="checkbox" class="checkbox_child" name="paramKeyList1" value="${list.boardCode}"></td>
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
	<!-- list -->
	
	<!-- pagination -->
	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex" />
	</div>
	<!-- // pagination -->
</form:form>
</body>