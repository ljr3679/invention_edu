<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script type="text/javascript" defer="defer">
		function fn_edit() {
			if(fn_validation_check($('#cmmnForm'))) {
				var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
				if(confirm(msg+' 하시겠습니까?')) {
					//oEditors.getById["paramKey1"].exec("UPDATE_CONTENTS_FIELD", []);
					$('#paramKey1').val(CKEDITOR.instances.paramKey1.getData());
					$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
					$('#cmmnForm').submit();
				}	
			}
		}
		
		function fn_cancel() {
			$('#act').val('');
			$('#idx').val('');
			$('#cmmnForm').attr('action', '${vo.selfPath}contentsMng.do');
			$('#cmmnForm').submit();
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="act"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchKeyword"/>
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
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}"><c:out value="${admSession.name} [${admSession.id}]"/></c:when>
						<c:otherwise><c:out value="${resultData.registerName} [${resultData.registerId}]"/></c:otherwise>
					</c:choose>
					</p>
				</td>
				<th scope="row">등록일</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
							<c:out value="${sysYear}"/>
						</c:when>
						<c:otherwise><c:out value="${resultData.regDate}"/></c:otherwise>
					</c:choose>
					</p>
				</td>
			</tr>
			<tr>
				<th scope="row">수정자</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">-</c:when>
						<c:when test="${vo.act eq 'modify' and empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modifierName} [${resultData.modifierId}]"/></c:otherwise>
					</c:choose>
					</p>
				</td>
				<th scope="row">수정일</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">-</c:when>
						<c:when test="${vo.act eq 'modify' and empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modDate}"/></c:otherwise>
					</c:choose>
					</p>
				</td>
			</tr>
			<tr>
				<th scope="row">컨텐츠명<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
				<td colspan="3">
					<input type="text" name="title" class="vali" style="width: 100%;" value="${resultData.title}" vali-text="컨텐츠명을 입력해주세요."/>
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="3">
					<textarea id="paramKey1" name="paramKey1" editor="Y" style="width: 100%; height: 450px;"><c:out value="${resultData.contents}" escapeXml="false"/></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="btn_wrap">
		<a onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">취소</a>
		<a onclick="fn_edit();" style="cursor: pointer;" class="right btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
	</div>
	
</form:form>
</body>