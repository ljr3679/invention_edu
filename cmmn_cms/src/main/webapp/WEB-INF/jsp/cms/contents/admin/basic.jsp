<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script type="text/javascript" defer="defer">
		function fn_edit() {
			if(fn_validation_check($('#cmmnForm'))) {
				if(confirm('수정 하시겠습니까?')) {
					//oEditors.getById["paramKey1"].exec("UPDATE_CONTENTS_FIELD", []);
					CKEDITOR.replace("paramKey1");
					$('#cmmnForm').attr('action', '${vo.selfPath}contents_edit.act');
					$('#cmmnForm').submit();
				}	
			}
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="act"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchKeyword"/>
<input type="hidden" name="title" value="${resultData.title}"/>
<input type="hidden" id="board_code" name="board_code" value="${resultData.boardCode}"/>

	<table class="board_write basic">
		<caption>권한 등록 정보</caption>
		<colgroup>
			<col style="width: 20%;">
			<col style="width: 40%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">등록자</th>
				<td>
					<p><c:out value="${resultData.registerName} [${resultData.registerId}]"/></p>
				</td>
				<th scope="row">등록일</th>
				<td>
					<p><c:out value="${resultData.regDate}"/></p>
				</td>
			</tr>
			<tr>
				<th scope="row">수정자</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modifierName} [${resultData.modifierId}]"/></c:otherwise>
					</c:choose>
					</p>
				</td>
				<th scope="row">수정일</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modDate}"/></c:otherwise>
					</c:choose>
					</p>
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="3">
					<textarea class="unCheck" id="paramKey1" name="paramKey1" editor="Y" style="width: 100%; height: 450px;"><c:out value="${resultData.contents}" escapeXml="false"/></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="btn_wrap">
		<a onclick="fn_edit();" style="cursor: pointer;" class="right btn">수정</a>
	</div>
	
</form:form>
</body>