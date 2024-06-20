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
			<label style="width: 10%">접속 일시</label>
			<div class="slt_box" style="width: 40%;">
				<input type="text" id="searchDate1" name="searchDate1" class="datepicker" onChange="datepicker_start('searchDate1', 'searchDate2');" style="width: 200px;" value="${vo.searchDate1}"/>
				~
				<input type="text" id="searchDate2" name="searchDate2" class="datepicker" onChange="datepicker_end('searchDate1', 'searchDate2');" style="width: 200px;" value="${vo.searchDate2}"/>
			</div>
			<label style="width: 10%"></label>
			<div class="slt_box" style="width: 40%;">
			</div>			
		</div>
		<div class="row">
			<label style="width: 10%">키워드</label>
			<div class="slt_box" style="width: 10%;">
				<select name="searchValue1" class="join_select1">
					<option value="0">전체</option>
					<option value="1" <c:if test="${vo.searchValue1 eq '1'}">selected="selected"</c:if>>ID</option>
					<option value="2" <c:if test="${vo.searchValue1 eq '2'}">selected="selected"</c:if>>이름</option>
					<option value="3" <c:if test="${vo.searchValue1 eq '3'}">selected="selected"</c:if>>IP</option>
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
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:25%;">
			<col style="width:25%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">ID</th>
				<th scope="col">이름</th>
				<th scope="col">IP</th>
				<th scope="col">접속일시</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<td><c:out value="${list.id}"/></td>
				<td><c:out value="${list.name}"/></td>
				<td><c:out value="${list.ip}"/></td>
				<td><c:out value="${list.loginDate}"/></td>
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