<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_edit(act,idx) {
			$('#idx2').val(idx);
			$('#act2').val(act);
			$('#cmmnForm').attr('action', "${selfPath}servey_edit.do");
			$('#cmmnForm').submit();
		}
		
		function fn_cancel() {
			$('#cmmnForm').attr('action', '${selfPath}index.do');
			$('#cmmnForm').submit();
		}
		function fn_survey_total() {
			$('#act2').val('total');
			$('#cmmnForm').attr('action', '${vo.selfPath}editTotal.do');
			$('#cmmnForm').submit();
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="idx2"/>
<form:hidden path="act"/>
<form:hidden path="act2"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchKeyword"/>

	<div class="sch_bar_box clearfix">
		<p class="total_txt"><i class="xi-file-o"></i> 총 게시물 <span class="num"><c:out value="${paginationInfo2.totalRecordCount}"/></span> 개</p>									
		
		<div class="fr">
			<a href="javascript:void(0);" onClick="fn_survey_total();" class="fr_btn">통계보기</a>
			<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
		</div>
	</div>
<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:10%;">
			<col style="width:auto;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">설문조사</th>
				<th scope="col">설문제목</th>
				<th scope="col">회원ID</th>
				<th scope="col">성명</th>
				<th scope="col">제출일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList2}" var="list" varStatus="status">
			<tr>
				<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer" class="fr_btn">조회</a></td>
				<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer" class="fr_btn">${list.title}</a></td>
				<td>
					<c:choose>
						<c:when test="${not empty list.id}"><c:out value="${list.id}"/></c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${not empty list.name}"><c:out value="${list.name}"/></c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
				<td><c:out value="${list.regDate}"/></td>
			</tr>	
		</c:forEach>
		<c:if test="${empty resultList2}">
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
		<ui:pagination paginationInfo="${paginationInfo2}" type="image" jsFunction="fn_cmmn_page2" />
		<form:hidden path="pageIndex2" />
	</div>
	<!-- // pagination -->
</form:form>

</body>