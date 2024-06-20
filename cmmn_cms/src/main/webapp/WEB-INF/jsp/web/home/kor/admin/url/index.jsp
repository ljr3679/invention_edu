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
				
				<label for="searchValue1">확인상태</label>
				<div class="slt_box" style="width: 150px;">
					<select id="searchValue1" name="searchValue1" class="join_select1">
						<option value="0">전체</option> 
						<option value="1"<c:if test="${vo.searchValue1 eq '1'}">selected="selected"</c:if>>제목</option>
						<option value="2"<c:if test="${vo.searchValue1 eq '2'}">selected="selected"</c:if>>단축주소</option>
						<option value="3"<c:if test="${vo.searchValue1 eq '3'}">selected="selected"</c:if>>연결주소</option>
					</select>
				</div>
				<div class="input_box">
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
			<a href="javascript:void(0);" onclick="fn_delete();" style="cursor: pointer;" class="btn delete">삭제</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col width="10%">
			<col width="25%">
			<col width="45%">
			<col width="10%">
			<col width="5%">
			<col width="5%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순번</th>
				<th scope="col">제목</th>
				<th scope="col">연결주소</th>
				<th scope="col">단축주소</th>
				<th scope="col">조회수</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td><a onClick="fn_edit('modify', '${list.urlMngno}');" style="cursor:pointer"><c:out value="${list.title}"/></a></td>
					<td>
						<a href="${list.urlOrg}" target="_blank" style="cursor:pointer"><c:out value="${list.urlOrg}"/></a>
					</td>
					<td>
						<a href="http://iped.kr/${list.urlNm}" target="_blank" style="cursor:pointer"><c:out value="${list.urlNm}" /></a>
					</td>
					<td><c:out value="${list.cnt}"/></td>
					<td><input type="checkbox" class="checkbox_child" name="paramKeyList1" value="${list.urlMngno}"></td>
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