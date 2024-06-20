<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
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

	<div class="sub_sch_box">
		<div class="row">
			<label style="width: 10%"> 사용여부 </label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue1" class="join_select1">
					<option value="">전체</option>
					<option value="N" <c:if test="${vo.searchValue1 eq 'N'}">selected="selected"</c:if>>미사용</option>
					<option value="Y" <c:if test="${vo.searchValue1 eq 'Y'}">selected="selected"</c:if>>사용</option>
				</select>
			</div>
			<label style="width: 10%"> 키워드 </label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue2" class="join_select1">
					<option value="0">전체</option>
					<option value="1" <c:if test="${vo.searchValue2 eq 1}">selected="selected"</c:if>>아이디</option>
					<option value="2" <c:if test="${vo.searchValue2 eq 2}">selected="selected"</c:if>>성명</option>
					<option value="3" <c:if test="${vo.searchValue2 eq 3}">selected="selected"</c:if>>권한명</option>
				</select>
			</div>
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="제목을 입력하세요."/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<div class="clearfix">
		<div class="fr">
			<a onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
			<a onClick="fn_delete();" style="cursor:pointer" class="btn delete">삭제</a>
		</div>
	</div>
	
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:20%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">아이디</th>
				<th scope="col">성명</th>
				<th scope="col">권한명</th>
				<th scope="col">사용여부</th>
				<th scope="col">등록일</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.id}"/></a></td>
				<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.name}"/></a></td>
				<td><c:out value="${list.menuAuthorityName}"/></td>
				<td><c:out value="${list.useAt eq 'Y' ?'사용' :'미사용'}"/></td>
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
	
	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex" />
	</div>
</form:form>
</body>