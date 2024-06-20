<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_edit(idx) {
 		$('#idx').val(idx);
 		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
 		$('#cmmnForm').submit();
	}
	
	function fn_download() {
		if(fn_validation_check($('#excelDownForm'))) {
			fn_layer_close();
			$('#cmmnForm').unbind();
			$("#downReason").val($("#downReasonpop").val());
			$('#cmmnForm').attr('action', "${vo.selfPath}excelDownload.do");
			$('#cmmnForm').submit();
		}
	}	
	
	/* function fn_delete() {
		if($('input[name=paramKeyList1]:checked').length == 0) {
			alert('삭제할 항목 하나 이상을 선택하여 주십시오.');
			return;
		}
		
		if(confirm('삭제 하시겠습니까?')) {
			$('#act').val('delete');
			$('#cmmnForm').attr('action', "${vo.selfPath}edit.act");
			$('#cmmnForm').submit();
		}
	} */
	/* function fn_download() {
		if(fn_validation_check($('#excelDownForm'))) {
			fn_layer_close();
			$('#excelDownForm').unbind();
			$('#excelDownForm').attr('action', "${vo.selfPath}excelDownload.do");
			$('#excelDownForm').submit();
		}
	} */
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="idx" name="idx"/>
<input type="hidden" id="downReason" name="downReason"/>

	<div class="sub_sch_box">
		<div class="row">
			<label for="searchValue1">키워드</label>
			<div class="slt_box" style="width: 150px;">
				<select id="searchValue1" name="searchValue1" class="join_select1">
					<option value="0">전체</option>  
					<option value="1"<c:if test="${vo.searchValue3 eq '1'}">selected="selected"</c:if>>아이디</option>
					<option value="2"<c:if test="${vo.searchValue3 eq '2'}">selected="selected"</c:if>>이름</option>
				</select>
			</div>
			<div class="input_box">
				<form:input path="searchKeyword" placeholder="성명을 입력하세요."/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div> 

	<!-- button -->
	<div class="clearfix">
		<div class="fr">
			<a onClick="fn_layer_open();" style="cursor:pointer" class="fr_btn">엑셀다운로드</a>
		</div>
	</div>
	<!-- // button -->
	<!-- 
	<div class="clearfix">
		<div class="fr_cnt">
			<p>Total <c:out value="${paginationInfo.totalRecordCount}"/></p>
		</div>
		<div class="fr">
		</div>
	</div>
	 -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:10%;">
			<!-- <col style="width:13%;"> -->
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:10%;"> 
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<!-- <th scope="col">관리코드</th>  -->
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">소속</th>
				<th scope="col">직위</th>
				<th scope="col">연락처</th>
				<th scope="col">이메일</th>
				<th scope="col">정보동의여부</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
			<tr>
				<td><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}"/></td>
				<!-- <td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${fn:substring(list.memberName,0,1)}"/>***********</td>  -->
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.memberId}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.memberName}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.department}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.departmentPosition}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.phone}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.email}"/></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:choose><c:when test="${list.crimsYn eq 'Y'}">동의</c:when><c:otherwise>비동의</c:otherwise></c:choose></a></td>
				<td><a onClick="fn_edit('${list.no}');" style="cursor:pointer"><c:out value="${list.createDate}"/></a></td>
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