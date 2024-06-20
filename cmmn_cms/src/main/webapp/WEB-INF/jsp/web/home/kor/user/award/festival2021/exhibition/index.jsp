<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
	function fn_edit(idx){
		$('#idx').val(idx);
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
		$('#cmmnForm').submit();
	}
	function onYear(){
		fn_cmmn_search();
	}
	function fn_change_subTab(type) {
		$("#searchValue3").val(type);
		$('#cmmnForm').attr('action', '${selfPath}index.do');
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
	<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
	<form:hidden path="searchValue3"/>
	<form:hidden path="idx"/> 		  							<!-- 고유값 -->
	<form:hidden path="tabPos"/>
	<form:hidden path="tabPos2"/>
	<form:hidden path="searchValue10"/>
		<div class="com_list_cont">
			<!-- 대통령전시관-년도선택 시작-->
			<div class="top_box">
				<select id="searchValue1" name="searchValue1" class="slt_data fr" onChange="onYear();">
					<c:forEach items="${yearList}" var="value" varStatus="status" >
						<option value="${value}"<c:if test="${value eq vo.searchValue1}">selected="selected"</c:if>><c:out value="${value}년"/></option>
					</c:forEach>
				</select>
			</div> <!-- //대통령전시관-년도선택 때 끝 -->
		</div>
		<c:choose>
			<c:when test="${vo.tabPos2 eq '1'}">
				<div class="list_wrap">
					<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/exhibition/indexTabA.jsp" %>	
				</div>
			</c:when>
			<c:when test="${vo.tabPos2 eq '2'}">
				<div class="list_wrap">
					<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/exhibition/indexTabB.jsp" %>	
				</div>
			</c:when>
			<c:when test="${vo.tabPos2 eq '3'}">
				<div class="list_wrap">
					<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/exhibition/indexTabC.jsp" %>
				</div>
			</c:when>
			<c:when test="${vo.tabPos2 eq '4'}">
				<div class="list_wrap">
					<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/exhibition/indexTabD.jsp" %>
				</div>
			</c:when>
		</c:choose>
	</form:form>
</body>