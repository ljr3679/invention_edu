<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_download() {
			if(fn_validation_check($('#excelDownForm'))) {
				fn_layer_close();
				$('#cmmnForm').unbind();
				$("#downReason").val($("#downReasonpop").val());
				$('#cmmnForm').attr('action', "${vo.selfPath}excelDownload.do");
				$('#cmmnForm').submit();
			}
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="downReason" name="downReason"/>
	<!-- sub_sch_box -->
	<div class="sub_sch_box">
		<div class="row">
			<label style="width: 10%">작업 일시</label>
			<div class="slt_box" style="width: 40%;">
				<input type="text" id="searchDate1" name="searchDate1" class="datepicker" onChange="datepicker_start('searchDate1', 'searchDate2');" style="width: 200px;" value="${vo.searchDate1}" />
				~
				<input type="text" id="searchDate2" name="searchDate2" class="datepicker" onChange="datepicker_end('searchDate1', 'searchDate2');" style="width: 200px;" value="${vo.searchDate2}"/>
			</div>
			<label style="width: 10%">접속 일시</label>
			<div class="slt_box" style="width: 40%;">
				<input type="text" id="searchDate3" name="searchDate3" class="datepicker" onChange="datepicker_start('searchDate3', 'searchDate4');" style="width: 200px;" value="${vo.searchDate3}"/>
				~
				<input type="text" id="searchDate4" name="searchDate4" class="datepicker" onChange="datepicker_end('searchDate3', 'searchDate4');" style="width: 200px;" value="${vo.searchDate4}"/>
			</div>
		</div>
		<div class="row">
			<label style="width: 10%">작업</label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue2">
					<option value="">전체</option>
					<option value="I" <c:if test="${vo.searchValue2 eq 'I'}">selected="selected"</c:if>>등록</option>
					<option value="U" <c:if test="${vo.searchValue2 eq 'U'}">selected="selected"</c:if>>수정</option>
					<option value="D" <c:if test="${vo.searchValue2 eq 'D'}">selected="selected"</c:if>>삭제</option>
					<option value="E" <c:if test="${vo.searchValue2 eq 'E'}">selected="selected"</c:if>>다운로드</option>
				</select>
			</div>
			<label style="width: 10%">키워드</label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue1">
					<option value="0">전체</option>
					<option value="1" <c:if test="${vo.searchValue1 eq '1'}">selected="selected"</c:if>>메뉴</option>
					<option value="2" <c:if test="${vo.searchValue1 eq '2'}">selected="selected"</c:if>>작업 명</option>
					<option value="3" <c:if test="${vo.searchValue1 eq '3'}">selected="selected"</c:if>>작업자(ID)</option>
					<option value="4" <c:if test="${vo.searchValue1 eq '4'}">selected="selected"</c:if>>작업자(이름)</option>
					<option value="5" <c:if test="${vo.searchValue1 eq '5'}">selected="selected"</c:if>>IP</option>
				</select>
			</div>
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="키워드 입력하세요."/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	<!-- // sub_sch_box -->
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr">
			<a onClick="fn_layer_open();" style="cursor:pointer" class="fr_btn">엑셀다운로드</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:auto;">
			<col style="width:12%;">
			<col style="width:8%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:15%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">작업 메뉴</th>
				<th scope="col">사유</th>
				<th scope="col">작업</th>
				<th scope="col">작업자(ID)</th>
				<th scope="col">작업자(이름)</th>
				<th scope="col">작업일시</th>
				<th scope="col">접속IP/일시</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<td style="text-align: left;">
					<div style="font-size: 13px;"><c:out value="${list.menu}"/></div>
					<div><c:out value="${list.title}"/></div>	
				</td>
				<td><c:out value="${list.downReason}"/></td>
				<td>
					<c:choose>
						<c:when test="${list.workCode eq 'I'}">등록</c:when>
						<c:when test="${list.workCode eq 'U'}">수정</c:when>
						<c:when test="${list.workCode eq 'D'}">삭제</c:when>
						<c:when test="${list.workCode eq 'E'}">다운로드</c:when>
					</c:choose>
				</td>
				<td><c:out value="${list.workId}"/></td>
				<td><c:out value="${list.workName}"/></td>
				<td><c:out value="${list.performDate}"/></td>
				<td>
					<div><c:out value="${list.ip}"/></div>
					<div><c:out value="${list.loginDate}"/></div>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${empty resultList}">
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
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex" />
	</div>
	<!-- // pagination -->
	
</form:form>

<form:form commandName="commonVO" name="excelDownForm" id="excelDownForm" method="post">
	<!-- Start : layer-popup content -->
	<div id="layer" class="layer-wrap">
	    <div class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <!--content //-->
	                <h1 class="pop-layer-title">- 다운로드 사유 -</h1>
	                <textarea class="vali" id="downReasonpop" name="downReasonpop" style="width: 500px; height: 200px;" vali-text="다운로드 사유를 입력해주세요."></textarea>
	                <div class="btn-r">
	                    <a href="#" onClick="fn_download();" class="btn-layerClose">제출</a>
	                    <a href="#" onClick="fn_layer_close();" class="btn-layerClose">닫기</a>
	                </div>
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End : layer-popup content -->
</form:form>
</body>