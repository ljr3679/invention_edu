<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_edit(act,idx){
			$('#idx').val(idx);
			$('#act').val(act);
			$('#cmmnForm').attr('action', "${vo.selfPath}courseEdit.do");
			$('#cmmnForm').submit();
		}	

	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<form:hidden path="idx"/> 		  							<!-- 고유값 -->
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
					<option value="2"<c:if test="${vo.searchValue2 eq '2'}">selected="selected"</c:if>>학교명</option>
					<option value="3"<c:if test="${vo.searchValue2 eq '3'}">selected="selected"</c:if>>리더명</option>
				</select>
			</div>
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="키워드을 입력하세요."/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div> 	
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr_cnt"><p>Total <c:out value="${paginationInfo.totalRecordCount}"/></p></div>
		<div class="fr">
			<a href="javascript:void(0);" onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:7%;">
			<col style="width:5%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:5%;">
			<col style="width:7%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:8%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">연도</th>
				<th scope="col">코드</th>
				<th scope="col">학교명</th>
				<th scope="col">시도교육청</th>
				<th scope="col">교육기관</th>
				<th scope="col">프로그램</th>
				<th scope="col">학생수</th>
				<th scope="col">학제</th>
				<th scope="col">수업명</th>
				<th scope="col">운영보고서</th>
				<th scope="col">담당교사</th>
				<th scope="col">연락처</th>				
				<th scope="col">강사진</th>
				<th scope="col">특강시간</th>
				<th scope="col">준비물</th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td><c:out value="${list.year}"/></td>
					<td><c:out value="${list.classCd}"/></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.schoolNm}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.sidoEdu}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.eduAgency}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.progrmCd}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.studentCnt}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.schoolGrade}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.classTitle}"/></a></td>
					<td><c:out value="${list.reportsUrl}"/></td>
					<td><c:out value="${list.chargeReader}"/></td>
					<td><c:out value="${list.phone}"/></td>
					<td><c:out value="${list.chargeTeam}"/></td>
					<td><c:out value="${list.eduStartTime}"/>~<c:out value="${list.eduEndTime}"/></td>
					<td><c:out value="${list.materials}"/></td>
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