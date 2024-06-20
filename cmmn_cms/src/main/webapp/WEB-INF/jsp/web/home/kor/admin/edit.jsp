<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
		});
		
		if(fn_validation_check($('#cmmnForm'))) {
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg+' 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}
	}
	
	function fn_remove() {
		if(confirm('삭제 하시겠습니까?')) {
			$('#act').val('remove');
			$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
			$('#cmmnForm').submit();
		}
	}
	
	function fn_cancel() {
		$('#act').val('');
		$('#idx').val('');
		$('#cmmnForm').attr('action', '${vo.selfPath}%indexPage%.do');
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex" />
<form:hidden path="searchValue1" />
<form:hidden path="searchValue2" />
<form:hidden path="searchKeyword" />

<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:40%;">
		<col style="width:20%;">
		<col style="width:20%;">
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
			<th scope="row"><img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"> 사용여부</th>
			<td colspan="3">
				<div class="on_iblock" style="margin-right: 20px;">
					<input type="radio" id="radio_1" name="paramKey1" value="Y" <c:if test="${empty resultData or resultData.useAt eq 'Y'}">checked="checked"</c:if>/><label for="radio_1">사용</label>
				</div>
				<div class="on_iblock">
					<input type="radio" id="radio_2" name="paramKey1" value="N" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if>/><label for="radio_2">미사용</label>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row"><img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"> 제목</th>
			<td><input type="text" id="paramKey2" name="paramKey2" value="${resultData.title}" style="width: 100%;" vali-text="제목을 입력해주세요."/></td>
		</tr>
		<tr>
			<th scope="row">내용</th>
			<td>
				<textarea id="paramKey3" name="paramKey3" editor="Y" class="unCheck" style="width: 100%; height: 250px;"><c:out value="${resultData.contents}" escapeXml="false"/></textarea>
			</td>
		</tr>
	</tbody>
</table>
<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->