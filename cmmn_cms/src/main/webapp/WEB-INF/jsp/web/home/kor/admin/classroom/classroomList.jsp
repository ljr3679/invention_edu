<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_edit(courseId){
			$('#idx').val(courseId);
			$('#cmmnForm').attr('action', "${vo.selfPath}classroomInfo.do");
			$('#cmmnForm').submit();
		}	
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="idx" name="idx">
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:10%;">
		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">이름</th>
				<th scope="col">제목</th>
				<th scope="col">수업상태</th>
				<th scope="col">URL</th>
				<th scope="col">섹션</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${cobj.courses}" var="list" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><c:out value="${list.name}"/></td>
					<td><c:out value="${list.descriptionHeading}"/></td>
					<td><c:out value="${list.courseState}"/></td>
					<td><c:out value="${list.alternateLink}"/></td>
					<td><c:out value="${list.section}"/></td>
					<td><c:out value="${list.creationTime}"/></td>
			</c:forEach>
			<c:if test="${empty cobj.courses}">
				<tr>
					<td id="empty_row">등록된 수업이 없습니다.</td>
					<script>$('#empty_row').attr('colspan',$('#empty_row').parent().parent().parent().find('th').length);</script>
				</tr>
			</c:if>
		</tbody>
	</table>
	<!-- list -->

</form:form>
</body>