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
			<label for="searchValue2">교육대상</label>
			<div class="slt_box" >
				<select id="searchValue2" name="searchValue2" class="join_select1" style="width:150px;">
					<option value="">전체</option> 
					<c:forEach items="${targetList}" var="list" varStatus="status"> 
						<option value="${list.no}"<c:if test="${vo.searchValue2 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
			<label for="searchValue3">관련교과</label>
			<div class="slt_box" >
				<select id="searchValue3" name="searchValue3" class="join_select1" style="width:150px;">
					<option value="">전체</option> 
					<c:forEach items="${subjectList}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue3 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
			<label for="searchValue1">사용여부</label>
			<div class="slt_box">
				<select id="searchValue1" name="searchValue1" class="join_select1" style="width:150px;">
					<option value="">전체</option>
					<option value="Y"<c:if test="${vo.searchValue1 eq 'Y'}">selected="seleted"</c:if>>사용</option>
					<option value="N"<c:if test="${vo.searchValue1 eq 'N'}">selected="seleted"</c:if>>미사용</option>
				</select>
			</div>
		</div>
		<div class="row">
			<label for="searchValue4">키워드</label>
			<div class="slt_box" style="width:150px;">
				<select id="searchValue4" name="searchValue4" class="join_select1" style="width:150px;">
					<option value="0">전체</option>  
					<option value="1"<c:if test="${vo.searchValue4 eq '1'}">selected="selected"</c:if>>제목</option>
					<option value="2"<c:if test="${vo.searchValue4 eq '2'}">selected="selected"</c:if>>세부역량</option>
					<option value="3"<c:if test="${vo.searchValue4 eq '3'}">selected="selected"</c:if>>프로그램 소개
</option>
				</select>
			</div>
			<label for="searchKeyword">검섹어</label>
			<div class="input_box">
				<input id="searchKeyword" name="searchKeyword" placeholder="검섹어를 입력하세요." type="text" value="${vo.searchKeyword}" style="width:100%;"/>
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
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:auto;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:5%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">교육대상</th>
				<th scope="col">관련교과</th>
				<th scope="col">제목</th>
				<th scope="col">프로그램 리뷰 </th> 
				<th scope="col">사용여부</th>
				<th scope="col">등록일</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>
						<c:choose>
							<c:when test="${list.promAt eq 1}">
								<p class="fr_btn">추천</p>
							</c:when>
							<c:otherwise>
								${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}
							</c:otherwise>
						</c:choose> 
					</td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.targetName}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.subjectName}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.title}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.commentCnt}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">
						<c:choose>
							<c:when test="${list.useAt eq 'Y' }">
								사용
							</c:when>
							<c:otherwise>
								미사용
							</c:otherwise>
						</c:choose>
					</a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.regDate}"/></a></td>
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