<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_edit(act,idx){
			$('#idx').val(idx);
			$('#act').val(act);
			$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
			$('#cmmnForm').submit();
		}	
		
		function fn_delete() {
			if($('input[name=paramKeyList1]:checked').length == 0) {
				alert('삭제할 항목 하나 이상을 선택하여 주십시오.');
				return;
			}
			
			if(confirm('삭제 하시겠습니까?')) {
				$('#act').val('deleteAll');
				$('#cmmnForm').attr('action', "${vo.selfPath}edit.act");
				$('#cmmnForm').submit();
			}
		}
		function fn_orderby(order) {
			$('#searchValue5').val(order);
			fn_cmmn_search();
		}
		function fn_download() {
			if(fn_validation_check($('#excelDownForm'))) {
				fn_layer_close();
				$('#excelDownForm').unbind();
				$('#excelDownForm').attr('action', "${vo.selfPath}excelDownload.do");
				$('#excelDownForm').submit();
			}
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<form:hidden path="idx"/> 		  							<!-- 고유값 -->
	<form:hidden path="act"/> 		  							<!-- 상태값 -->
	<input type="hidden" id="searchValue5" name="searchValue5" value="${vo.searchValue5}"/>
	<div class="sub_sch_box">
		<div class="row">
			<label for="searchValue1">년도</label>
			<div class="slt_box" style="width: 150px;">
				<select id="searchValue1" name="searchValue1" class="join_select1">
					<option value="">전체</option> 
					<c:forEach items="${year}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue1 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
			<label for="searchValue2">지역</label>
			<div class="slt_box" style="width: 150px;">
				<select id="searchValue2" name="searchValue2" class="join_select1">
					<option value="">전체</option> 
					<c:forEach items="${region}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue2 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
			<label for="searchValue4">구분</label>
			<div class="slt_box" style="width: 150px;">
				<select id="searchValue4" name="searchValue4" class="join_select1">
					<option value="">전체</option> 
					<c:forEach items="${type}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue4 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row">
			<label for="searchValue3">키워드</label>
			<div class="slt_box" style="width: 150px;">
				<select id="searchValue3" name="searchValue3" class="join_select1">
					<option value="0">전체</option>  
					<option value="1"<c:if test="${vo.searchValue3 eq '1'}">selected="selected"</c:if>>접수번호</option>
					<option value="2"<c:if test="${vo.searchValue3 eq '2'}">selected="selected"</c:if>>발명명칭</option>
				</select>
			</div>
			<div class="input_box">
				<input id="searchKeyword" name="searchKeyword" placeholder="검섹어를 입력하세요." style="width:100%;" type="text" value="${vo.searchKeyword}"/>
			</div>
			<a href="javascript:void(0);" onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr_cnt"><p>Total <c:out value="${paginationInfo.totalRecordCount}"/></p></div>
		<div class="fr">
			<a href="/home/kor/judge/main/index.do?menuPos=1" target="_blank" style="cursor:pointer" class="fr_btn">공중심사 사이트</a>
			<a href="javascript:void(0);" onClick="fn_layer_open();" style="cursor:pointer" class="fr_btn">좋아요 순 엑셀 다운로드</a>
			<a href="javascript:void(0);" onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
			<a href="javascript:void(0);" onclick="fn_delete();" style="cursor: pointer;" class="fr_btn">삭제</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:10%;"> 
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:auto;">
			<col style="width:5%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><a href="javascript:void(0);" onClick="fn_orderby('A');" style="cursor:pointer" class="fr_btn">No</a></th>
				<th scope="col">년도</th>
				<th scope="col"><a href="javascript:void(0);" onClick="fn_orderby('B');" style="cursor:pointer" class="fr_btn">좋아요 순</a></th>
				<th scope="col"><a href="javascript:void(0);" onClick="fn_orderby('C');" style="cursor:pointer" class="fr_btn">접수번호</a></th>
				<th scope="col">구분</th>
				<th scope="col">지역</th>
				<th scope="col">발명명칭</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.yearName}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.likeCnt}"/></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.regNo}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.typeName}" /></a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.regionName}" /></a></td>
					<td>
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.title}"/></a>
					</td>
					<td><input type="checkbox" class="checkbox_child" name="paramKeyList1" value="${list.no}"></td>
			</c:forEach>
			<c:if test="${empty resultList}">
				<tr>
					<td id="empty_row">등록된 게시물이 없습니다.</td>
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
	<input type="hidden" id="searchValue1" name="searchValue1" value="${vo.searchValue1}"/>
	<input type="hidden" id="searchValue2" name="searchValue2" value="${vo.searchValue2}"/>
	<input type="hidden" id="searchValue3" name="searchValue3" value="${vo.searchValue3}"/>
	<input type="hidden" id="searchValue4" name="searchValue4" value="${vo.searchValue4}"/>
	<input type="hidden" id="searchValue5" name="searchValue5" value="${vo.searchValue5}"/>
	<input type="hidden" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}"/>
	
	<!-- Start : layer-popup content -->
	<div id="layer" class="layer-wrap">
	    <div class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <!--content //-->
	                <h1 class="pop-layer-title">- 다운로드 사유 -</h1>
	                <textarea class="vali" id="downReason" name="downReason" style="width: 500px; height: 200px;" vali-text="다운로드 사유를 입력해주세요."></textarea>
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