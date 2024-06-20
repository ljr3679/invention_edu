<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
function fn_ip_status_change() {
	var paramKey1 = $('input:radio[name=searchValue1]:checked').val(); 
	var data = {'paramKey1':paramKey1};
	fn_cmmn_ajax("${vo.selfPath}ip_status.ajax", true, data, 'text', function(result) {
		if(result=='Y') {
    		alert("아이피차단 "+(paramKey1 == 'Y' ?'설정' :'해지')+" 되었습니다.")
    	}
	});
}

function fn_edit(act, idx) {
	$('#idx').val(idx);
	$('#act').val(act);
	$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
	$('#cmmnForm').submit();
}

function fn_delete() {
	if($('input[name=paramKeyList1]:checked').length == 0) {
		alert('삭제할 항목 하나 이상을 선택하여 주십시오.');
		return;
	}
	
	if(confirm('삭제 하시겠습니까?')) {
		$('#act').val('delete');
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.act");
		$('#cmmnForm').submit();
	}
}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="idx" name="idx"/>
<input type="hidden" id="act" name="act"/>

	<!-- sub_sch_box -->
	<div class="sub_sch_box">
		<!-- sch_box_row -->
		<div class="sch_box_row">
			<label for="ip_status1" style="width:140px;">아이피차단 설정</label>
			<div class="input_box">
				<input type="radio" value="Y" id="ip_status1" name="searchValue1" <c:if test="${result eq 'Y'}">checked="checked"</c:if> style="width: auto; height: auto; vertical-align: middle; cursor: pointer;"/>
			</div>
			<label for="ip_status2" style="width:140px;">아이피차단 해지</label> 
			<div class="input_box">
				<input type="radio" value="N" id="ip_status2" name="searchValue1" <c:if test="${empty result or result eq 'N'}">checked="checked"</c:if> style="width: auto; height: auto; vertical-align: middle; cursor: pointer;"/>
			</div>
			<div class="input_box" style="padding-left: 20px;">
				<a onclick="fn_ip_status_change();" class="fr_btn" style="margin: 0;">등록</a>
			</div>
		</div>
	</div>
	
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
			<col style="width:25%;">
			<col style="width:15%;">
			<col style="width:10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">아이피</th>
				<th scope="col">사용자</th>
				<th scope="col">등록일</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.ip}"/></a></td>
				<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.name} [${list.id}]"/></a></td>
				<td><c:out value="${list.regDate}"/></td>
				<td><input type="checkbox" class="checkbox_child" name="paramKeyList1" value="${list.no}"></td>
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
	<!-- // board_list -->

	<!-- pagination -->
	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex" />
	</div>
	<!-- // pagination -->
</form:form>		
</body>