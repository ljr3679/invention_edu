<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_move(idx) {
		$('#idx').val(idx);
		$('#act2').remove();
		$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
		$('#cmmnForm').submit();
	}
	
	function fn_remove() {
		if(confirm('삭제 하시겠습니까?')) {
			fn_all_file_delete();
			$('#act').val('delete');
			$('#act2').remove();
			$('#cmmnForm').attr('action', '${vo.selfPath}board_edit.act');
			$('#cmmnForm').submit();
		}
	}
	
	function fn_cancel() {
		$('#idx').remove();
		$('#act').remove();
		$('#act2').remove();
		$('#cmmnForm').attr('action', '${vo.selfPath}board.do');
		$('#cmmnForm').submit();
	}
	
	function fn_edit() {
		$('#act').val('modify');
		$('#act2').val('detail');
		$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="get">
<input type="hidden" name="menuPos" value="${menuPos}"/>
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="act2"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchDate1"/>
<form:hidden path="searchDate2"/>
<form:hidden path="searchDate3"/>
<form:hidden path="searchDate4"/>
<form:hidden path="searchDate5"/>
<form:hidden path="searchDate6"/>
<form:hidden path="searchDate7"/>
<form:hidden path="searchDate8"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchValue3"/>
<form:hidden path="searchValue4"/>
<form:hidden path="searchValue5"/>
<form:hidden path="searchValue6"/>
<form:hidden path="searchValue7"/>
<form:hidden path="searchValue8"/>
<form:hidden path="searchValue9"/>
<form:hidden path="searchValue10"/>
<form:hidden path="searchKeyword"/>
	<div class="board_view">
		<!-- 제목 컨텐츠 영역 -->
		<div class="board_view_top">
<%-- 			<c:if test="${not empty vo.prev}"> --%>
<%-- 				<button type="button" onClick="fn_move('${vo.prev}');" class="board_prev btn_arr">이전</button> --%>
<%-- 			</c:if> --%>
			<c:if test="${resultData.isNew eq 'Y'}">
			<div class="mark_list">
				<ul class="list">
					<li>
						<span class="mark">주요</span>
					</li>
				</ul>
			</div>
			</c:if>
			<strong class="tit"><c:out value="${resultData.title}" escapeXml="false"/></strong>
			<div class="info">
				<span class="each"><span class="ft_color">작성자 :</span> <c:out value="${resultData.writer}" escapeXml="false"/></span>
				<span class="each"><span class="ft_color">작성일 :</span> <c:out value="${resultData.regDate}" escapeXml="false"/></span>
				<span class="each"><span class="ft_color">조회 :</span> <c:out value="${resultData.cnt}" escapeXml="false"/></span>
			</div>
<%-- 			<c:if test="${not empty vo.next}"> --%>
<%-- 				<button type="button" onClick="fn_move('${vo.next}');" class="board_next btn_arr">다음</button> --%>
<%-- 			</c:if> --%>
		</div>
		<!-- //제목 컨텐츠 영역 -->

		<!-- 구분값 표시가 필요할 경우만 표시 -->
		<table class="board_write sty2">
			<caption>지원분야, 지원기관, 지원형태, 지원대상, 지원내용, 신청접수, 제출서류, 커리큘럼 등의 내용을 담은 표</caption>
			<colgroup>
				<col style="width: 12%;">
				<col style="width: 38%;">
				<col style="width: 12%;">
				<col style="width: 38%;">
			</colgroup>
			<tbody>
			<c:forEach items="${topFields}" var="list" varStatus="status">
			<c:if test="${cnt % 2 eq 0}"><tr></c:if>
				<th scope="row">
					<span class="text">
						<c:out value="${list.title}" escapeXml="false"/>
					</span>
				</th>
				<td>
					<c:choose>
						<c:when test="${list.field.indexOf('textField') != -1 or list.field.indexOf('dateField') != -1}">
							<c:out value="${resultData.get(list.field)}" escapeXml="false"/>
						</c:when>
						<c:when test="${list.field.indexOf('dateArrayField') != -1}">	
							<c:set var="itemStart" value="dateArrayField${fn:substring(list.field, 14, fn:length(list.field))}Start"/>
							<c:set var="itemEnd" value="dateArrayField${fn:substring(list.field, 14, fn:length(list.field))}End"/>
							<c:out value="${resultData.get(itemStart)} ~ ${resultData.get(itemEnd)}" escapeXml="false"/>
						</c:when>
						<c:when test="${list.field.indexOf('categoryField') != -1}">
							<c:set var="cateIdx" value="${fn:substring(list.field, 13, fn:length(list.field))}"/>
							
							<c:set var="categoryData" value="category${cateIdx}Name"/>
							<c:set var="categoryChildData" value="category${cateIdx}ChildName"/>
							
							<c:out value="${not empty resultData.get(categoryData) ?resultData.get(categoryData) :'-'}" escapeXml="false"/>
							<c:if test="${not empty resultData.get(categoryChildData)}"><c:out value=" > ${resultData.get(categoryChildData)}" escapeXml="false"/></c:if>
						</c:when>
					</c:choose>
				</td>
			<c:if test="${cnt % 2 eq 1 or status.last}"><c:if test="${cnt % 2 eq 0 and status.last}"><td></td><td></td></c:if></tr></c:if>
			<c:set var="cnt" value="${cnt+1}"/>
			</c:forEach>
			</tbody>
		</table>
		<!-- // 구분값 표시가 필요할 경우만 표시 -->

		<div class="board_view_con">
			<div class="editor_view">
				<div class="editor_prize">
					<ul class="list">
					<c:forEach items="${bottomFields}" var="list" varStatus="status">
					<li>
						<div class="title"><c:out value="${list.title}"/></div>
						<c:choose>
							<c:when test="${fn:contains(resultData.get(list.field), 'youtube.com/embed')}">
								<div class="video_box">
									<div class="inner">
										<c:out value="${cFn:escapeXml(resultData.get(list.field))}" escapeXml="false"/>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="text"><c:out value="${cFn:escapeXml(resultData.get(list.field))}" escapeXml="false"/></div>
							</c:otherwise>
						</c:choose>
					</li>
					</c:forEach>
					<c:if test="${not empty resultData.answer}">
					<li>
						<div class="title">답변</div>
						<div class="text"><c:out value="${cFn:escapeXml(resultData.answer)}" escapeXml="false"/></div>
					</li>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
		
		<style type="text/css">
			.editor_prize {}
			.editor_prize .list {margin: 0; padding: 0;}
			.editor_prize .list li {margin: 0 0 46px; list-style-type: none;}
			.editor_prize .list li:last-child {margin: 0;}
			.editor_prize .list li .title {position:relative; margin: 0 0 14px; padding: 0 0 0 15px; font-weight: 500; font-size: 24px; line-height: 40px; color: #3081b4;}
			.editor_prize .list li .title:before {content: ''; position:absolute; top: 9px; left: 0; width: 4px; height: 23px; background-color: #3081b4;}
			.editor_prize .list li .text {font-weight: 400; font-size: 17px; line-height: 30px; color: #424242;}
			.editor_prize .list li .video_box {display: table; width: 100%; table-layout: fixed;}
			.editor_prize .list li .video_box .inner {display: table-cell; width: 100%; height: 650px;}
			.editor_prize .list li .video_box .inner iframe {position: relative !important; width: 100%; height: 100%;}
	
	
			@media screen and (max-width:1280px){
				.editor_prize .list li {margin: 0 0 30px;}
				.editor_prize .list li .title {margin: 0 0 10px; padding: 0 0 0 15px; font-size: 20px; line-height: 30px; color: #3081b4;}
				.editor_prize .list li .title:before {top: 6px; width: 2px; height: 18px;}
				.editor_prize .list li .text {font-size: 15px; line-height: 27px;}
				.editor_prize .list li .video_box .inner {height: 400px;}
			}
	
	
			@media screen and (max-width:1080px){
	
				.editor_prize .list li {margin: 0 0 20px;}
				.editor_prize .list li .title {margin: 0 0 7px; padding: 0 0 0 10px; font-size: 18px; line-height: 27px;}
				.editor_prize .list li .title:before {top: 8px; width: 2px; height: 12px;}
				.editor_prize .list li .text {font-size: 13px; line-height: 24px;}
				.editor_prize .list li .video_box .inner {height: 350px;}
			}
	
	
			@media screen and (max-width:767px){
	
				.editor_prize .list li .title {font-size: 16px; line-height: 24px;}
				.editor_prize .list li .title:before {top: 6px;}
				.editor_prize .list li .text {font-size: 12px; line-height: 21px;}
				.editor_prize .list li .video_box .inner {height: 250px;}
	
			}
	
			@media screen and (max-width:480px){
				.editor_prize .list li .video_box .inner {height: 200px;}
	
			}
		</style>
		
		<c:if test="${not empty fileList}">
		<!-- 첨부파일 컨텐츠 영역 -->
		<div class="board_view_file">
			<p class="tit">첨부파일</p>
			<div class="file_box">
			<c:forEach items="${fileList}" var="file" varStatus="status2">
				<p class="file_each"><a onClick="cmmn_file_down('${file.attachName}','${file.attachReName}')" style="cursor: pointer; background: url(/images/cmmn/file/filetype/${file.extension}.gif) 0 2px no-repeat;, url(/images/cmmn/file/filetype/unknown.gif) 0 2px no-repeat;"><c:out value="${file.attachName}"/></a></p>
				<span style="display: none;">
					<input type="hidden" name="fileDataRmList" value="${file.no}">
					<input type="hidden" name="fileDataNameRmList" value="${file.attachReName}">
				</span>
			</c:forEach>
			</div>
		</div>
		<!-- //첨부파일 컨텐츠 영역 -->
		</c:if>
	</div>

	<div class="btn_area">
		<c:if test="${not empty resultData.registerIdx and not empty usrSession.no and resultData.registerIdx eq usrSession.no}">
			<a href="javascript:void(0);" onClick="fn_edit();" class="btn btn_color">수정</a>
			<a href="javascript:void(0);" onClick="fn_remove();" class="btn_colo2">삭제</a>
		</c:if>
		<a href="javascript:void(0);" onClick="fn_cancel();" class="btn">목록</a>
	</div>

</form:form>
</body>