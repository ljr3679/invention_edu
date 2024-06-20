<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_edit(act,idx){
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
				$('#act').val('deleteAll');
				$('#cmmnForm').attr('action', "${vo.selfPath}edit.act");
				$('#cmmnForm').submit();
			}
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<form:hidden path="idx"/> 		  							<!-- 고유값 -->
	<form:hidden path="act"/> 		  							<!-- 상태값 -->
	<div class="sub_sch_box">
		<div class="row">
			<label for="searchValue1">수상년도</label>
			<div class="slt_box" style="width:150px;">
				<select id="searchValue1" name="searchValue1" class="join_select1" >
					<option value="">전체</option>
					<c:forEach items="${yearList}" var="value" varStatus="status">
						<option value="${value}"<c:if test="${vo.searchValue1 eq value}">selected="selected"</c:if>>${value}</option>
					</c:forEach>
				</select>
			</div>
			<label for="searchValue2">분류/상격</label>
			<div class="slt_box" style="width:150px;">
				<select id="searchValue2" name="searchValue2" class="join_select1" >
					<option value="">전체</option> 
					<c:forEach items="${parent}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue2 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
			<label for="searchValue3">학교구분</label>
			<div class="slt_box" style="width:150px;">
				<select id="searchValue3" name="searchValue3" class="join_select1" >
					<option value="">전체</option> 
					<c:forEach items="${school}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue3 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
			<label for="searchValue4">기술구분</label>
			<div class="slt_box" style="width:150px;">
				<select id="searchValue4" name="searchValue4" class="join_select1" >
					<option value="">전체</option> 
					<c:forEach items="${tech}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue4 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row">
			<label for="searchValue5">키워드</label>
			<div class="slt_box" style="width:150px;">
				<select id="searchValue5" name="searchValue5" class="join_select1" >
					<option value="0">전체</option>
					<option value="1"<c:if test="${vo.searchValue5 eq '1'}">selected="selected"</c:if>>학교명</option>
					<option value="2"<c:if test="${vo.searchValue5 eq '2'}">selected="selected"</c:if>>지도교사</option>
					<option value="3"<c:if test="${vo.searchValue5 eq '3'}">selected="selected"</c:if>>수상자</option>  
					<option value="4"<c:if test="${vo.searchValue5 eq '4'}">selected="selected"</c:if>>제목</option>
				</select>
			</div>
			<div class="input_box" > 
				<input id="searchKeyword" name="searchKeyword" placeholder="검섹어를 입력하세요." style="width:100%;" type="text" value="${vo.searchKeyword}"/>
			</div>
			<a href="javascript:void(0);" onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr_cnt"><p>Total <c:out value="${paginationInfo.totalRecordCount}"/></p></div>
		<div class="fr">
			<a href="javascript:void(0);" onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
			<a href="javascript:void(0);" onclick="fn_delete();" style="cursor: pointer;" class="fr_btn">삭제</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:10%;"> 
			<col style="width:20%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:auto;">
			<col style="width:5%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">수상년도</th>
				<th scope="col">분류/상격</th>
				<th scope="col">학교구분</th>
				<th scope="col">학교명</th>
				<th scope="col">수상자</th>
				<th scope="col">제목</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.year}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.parentName}/${list.typeName}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.schoolTypeName}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.schoolName}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.winner}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.title}"/></a></td>
					<td><input type="checkbox" class="checkbox_child" name="paramKeyList1" value="${list.no}"></td>
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
 	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex" />
	</div> 
	<!-- // pagination -->

</form:form>
</body>