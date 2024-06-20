<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>
	function fn_apply(){
		if(confirm('신청 하시겠습니까?')) {
			$('#cmmnForm').attr('action', '${vo.selfPath}step1_apply.do');
		    $('#cmmnForm').submit();	
		}
	}
	
	function fn_cancel(){
	    $('#act').remove();
	    $('#idx').remove();
	    $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
	    $('#cmmnForm').submit();
	}
	
	function fn_move(idx) {
		$('#idx').val(idx);
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchKeyword"/>

	<div class="cont_wrap">
		<div class="cont_each">
			<div class="board_wrap">
				<!-- board_top -->
				<div class="board_top">
					<h5 class="subject"><c:out value="${resultData.title}" escapeXml="false"/></h5>
					<div class="board_base_info">
						<dl>
							<dt>작성자</dt>
							<dd><c:out value="${resultData.registerName}"/></dd>
						</dl>
						<dl>
							<dt>작성일</dt>
							<dd><c:out value="${resultData.regDate}"/></dd>
						</dl>
					</div>
				</div>
				
				<div class="board_info">
					<div class="board_system_info">
						<dl>
							<dt>모집상태</dt>
							<dd>
								<c:choose>
									<c:when test="${resultData.mojibAt eq 'A'}"><span class="teg_area">모집예정</span></c:when>
									<c:when test="${resultData.mojibAt eq 'B'}"><span class="teg_notice">모집중</span></c:when>
									<c:when test="${resultData.mojibAt eq 'C'}"><span class="teg_new">모집종료</span></c:when>
								</c:choose>
							</dd>
						</dl>
						<dl>
							<dt>모집기간</dt>
							<dd><c:out value="${resultData.startDate}"/> ~ <c:out value="${resultData.endDate}"/></dd>
						</dl>
						
					</div>
				</div>
	
				<div class="board_contents_wrap">
					<c:out value="${resultData.content}" escapeXml="flase"/>
				</div>
				<div class="board_system_info">
					<dl>
						<dt>첨부파일</dt>
						<dd>
							<c:forEach items="${fileList1}" var="list" varStatus="status">
								<a href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')"><i class="file xi-paperclip"></i>${list.attachName}</a> 
							</c:forEach>
						</dd>
					</dl>
					<c:if test="${not empty vo.prev}">
					<dl>
						<dt>이전글 <i class="xi-angle-up-min"></i></dt>
						<dd><a href="javascript:void(0);" onClick="fn_move('${vo.prev}');">${vo.prevTitle}</a></dd>
					</dl>
					</c:if>
					<c:if test="${not empty vo.next}">
					<dl>
						<dt>다음글 <i class="xi-angle-down-min"></i></dt>
						<dd><a href="javascript:void(0);" onClick="fn_move('${vo.next}');">${vo.nextTitle}</a></dd>
					</dl>
					</c:if>
				</div>
				<!-- board_btn_area -->
				<div class="board_btn_area">
					<c:if test="${resultData.mojibAt eq 'B'}">
						<button type="button" class="btn_blue" onclick="fn_apply();">신청하기</button>
					</c:if>
					<button type="button" class="btn_base" onclick="fn_cancel();">목록</button>
				</div>
			</div>
		</div>
	</div>

</form:form>
</body>
