<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_cancel() {
		$('#act').val('');
		$('#cmmnForm').attr('action', '${vo.selfPath}index.do');
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="pageIndex" />
<form:hidden path="searchValue1" />
<form:hidden path="searchValue3" />
<form:hidden path="searchValue4" />
<form:hidden path="searchKeyword" />

<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:15%;">
		<col style="width:auto;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">아이디</th>
			<td><c:out value="${resultData.id}"/></td>
		</tr>
		<tr>
			<th scope="row">이름</th>
			<td><c:out value="${resultData.name}"/></td>
		</tr>
		<tr>
			<th scope="row">휴대폰번호</th>
			<td><c:out value="${cFn:decrypt(resultData.phone)}"/></td>
		</tr>
		<tr>
			<th scope="row">이메일</th>
			<td><c:out value="${cFn:decrypt(resultData.email)}"/></td>
		</tr>
		<tr>
			<th scope="row">KIPA</th>
			<td><c:out value="${resultData.kipa}"/></td>
		</tr>
		<tr>
			<th scope="row">가입일</th>
			<td><c:out value="${resultData.regDate}"/></td>
		</tr>
		<tr>
			<th scope="row">최초 로그인 일자</th>
			<td>
				<c:choose>
					<c:when test="${not empty resultData.acsDate}"><c:out value="${resultData.acsDate}"/></c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
	</tbody>
</table>
<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->
