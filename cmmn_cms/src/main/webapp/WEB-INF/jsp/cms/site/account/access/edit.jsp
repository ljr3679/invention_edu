<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript" defer="defer">
<!--
	function fn_edit() {
		if(fn_validation_check($('#cmmnForm'))) {
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg+' 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}
	}
	
	function fn_cancel() {
		$('#act').val('');
		$('#idx').val('');
		$('#cmmnForm').attr('action', '${vo.selfPath}ipAccessMng.do');
		$('#cmmnForm').submit();
	}
//-->
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex" />
<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
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
			<th scope="row">아이피<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<input type="text" name="paramKey1" id="paramKey1" class="long_input" value="${resultData.ip}" vali-text="아이피를 입력해주세요."/>
			</td>
		</tr>
		<tr>
			<th scope="row">아이피 사용자<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<select name="paramKey2" id="paramKey2" class="join_select1" style="width:300px;" vali-text="아이피 사용자를 선택해주세요.">
					<c:forEach items="${accountList}" varStatus="status" var="list">
						<option value="${list.no}"<c:if test="${resultData.account eq list.no}">selected="selected"</c:if>>${list.name} [${list.id}]</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</tbody>
</table>
<!-- // board_write -->

<div class="btn_wrap">
	<a onClick="fn_edit();" style="cursor: pointer;" class="btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
	<a onClick="fn_cancel();" style="cursor: pointer;" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->