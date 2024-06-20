<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_edit(act,idx){
			$('#idx').val(idx);
			$('#act').val(act);
			$('#cmmnForm').attr('action', "${vo.selfPath}scheduleEdit.do");
			$('#cmmnForm').submit();
		}	
		
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<form:hidden path="idx"/> 		  							<!-- 고유값 -->
	<form:hidden path="idx2"/>
	<form:hidden path="act"/> 		  							<!-- 상태값 -->
	
	<div class="sub_sch_box">
		<div class="row">
			<label for="searchValue1" style="width: 10%">수업연도</label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue1" class="join_select1">
					<option value="">전체</option>
					<c:forEach items="${yearList}" var="value" varStatus="status">
						<option value="${value}"<c:if test="${vo.searchValue1 eq value}">selected="selected"</c:if>>${value}</option>
					</c:forEach>					
				</select>
			</div>		
			<label for="searchValue2">키워드</label>
			<div class="slt_box" style="width: 150px;">
				<select id="searchValue2" name="searchValue2" class="join_select1">
					<option value="0">전체</option>  
					<option value="1"<c:if test="${vo.searchValue2 eq '1'}">selected="selected"</c:if>>수업명</option>
					<option value="3"<c:if test="${vo.searchValue2 eq '3'}">selected="selected"</c:if>>리더명</option>
				</select>
			</div>
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="키워드을 입력하세요."/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div> 	
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:7%;">
			<col style="width:10%;">
			<col style="width:12%;">
			
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">연도</th>
				<th scope="col">수업명</th>
				<th scope="col">담당교사</th>
				<th scope="col">수업1</th>
				<th scope="col">수업2</th>
				<th scope="col">수업3</th>
				<th scope="col">수업4</th>
				<th scope="col">수업5</th>
				<th scope="col">수업6</th>
				<th scope="col">수업7</th>
				<th scope="col">수업8</th>
				<th scope="col">수업9</th>
				<th scope="col">수업10</th>
				<th scope="col"></th>
				
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td><c:out value="${list.year}"/></td>
					<td><c:out value="${list.classTitle}"/></td>
					<td><c:out value="${list.chargeReader}"/></td>
					<td class='<c:out value="${list.eduKind1}"/>'><a onClick="fn_edit('modify', '${list.no1}');"><c:out value="${list.gclass1}"/></a></td>
					<td class='<c:out value="${list.eduKind2}"/>'><a onClick="fn_edit('modify', '${list.no2}');"><c:out value="${list.gclass2}"/></a></td>
					<td class='<c:out value="${list.eduKind3}"/>'><a onClick="fn_edit('modify', '${list.no3}');"><c:out value="${list.gclass3}"/></a></td>
					<td class='<c:out value="${list.eduKind4}"/>'><a onClick="fn_edit('modify', '${list.no4}');"><c:out value="${list.gclass4}"/></a></td>
					<td class='<c:out value="${list.eduKind5}"/>'><a onClick="fn_edit('modify', '${list.no5}');"><c:out value="${list.gclass5}"/></a></td>
					<td class='<c:out value="${list.eduKind6}"/>'><a onClick="fn_edit('modify', '${list.no6}');"><c:out value="${list.gclass6}"/></a></td>
					<td class='<c:out value="${list.eduKind7}"/>'><a onClick="fn_edit('modify', '${list.no7}');"><c:out value="${list.gclass7}"/></a></td>
					<td class='<c:out value="${list.eduKind8}"/>'><a onClick="fn_edit('modify', '${list.no8}');"><c:out value="${list.gclass8}"/></a></td>
					<td class='<c:out value="${list.eduKind9}"/>'><a onClick="fn_edit('modify', '${list.no9}');"><c:out value="${list.gclass9}"/></a></td>
					<td class='<c:out value="${list.eduKind10}"/>'><a onClick="fn_edit('modify', '${list.no10}');"><c:out value="${list.gclass10}"/></a></td>
					<c:choose>					
						<c:when test="${list.eduKind10 eq ''}"> 			
							<td><a href="javascript:void(0);" onClick="fn_edit('regist','${list.no}');" style="cursor:pointer" class="fr_btn">등록</a></td>
						</c:when>
						<c:otherwise>
							<td><a href="javascript:void(0);" onClick="alert('더이상 추가할 수 없습니다.');" style="cursor:pointer" class="fr_btn">등록</a></td>
						</c:otherwise>
					</c:choose>						
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