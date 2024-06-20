<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<script type="text/javascript">
	function fn_edit2(act2,idx2){
		$('#idx2').val(idx2);
		$('#act2').val(act2);
		$('#cmmnForm').attr('action', "${vo.selfPath}edit2.do");
		$('#cmmnForm').submit();
	}
	
	function fn_cancel(){
        $('#act').remove();
        $('#idx').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
        $('#cmmnForm').submit();
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
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="idx2"/>
<form:hidden path="act2"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="tabPos"/>
<form:hidden path="searchValue1" /> <!-- 메뉴명 -->
<form:hidden path="searchValue2" />
<form:hidden path="searchValue3" />
<form:hidden path="searchKeyword" /> <!-- 메뉴명 -->
<div class="sub_sch_box">
		<div class="row">
			<label for="searchValue4">접수상태</label>
			<div class="slt_box">
				<select id="searchValue4" name="searchValue4" class="join_select1" style="width:150px;">
					<option value="">전체</option>
					<option value="A"<c:if test="${vo.searchValue4 eq 'A'}">selected="seleted"</c:if>>접수완료</option>
					<option value="B"<c:if test="${vo.searchValue4 eq 'B'}">selected="seleted"</c:if>>접수취소</option>
				</select>
			</div>
			<label for="searchValue5">아이디어 구분</label>
			<div class="slt_box" >
				<select id="searchValue5" name="searchValue5" class="join_select1" style="width:150px;">
					<option value="">전체</option>
					<option value="A"<c:if test="${vo.searchValue5 eq 'A'}">selected="seleted"</c:if>>자유과제</option>
					<option value="B"<c:if test="${vo.searchValue5 eq 'B'}">selected="seleted"</c:if>>전문교과과제</option>
					<option value="C"<c:if test="${vo.searchValue5 eq 'C'}">selected="seleted"</c:if>>협력기업과제</option>
					<option value="D"<c:if test="${vo.searchValue5 eq 'D'}">selected="seleted"</c:if>>테마과제</option> 
				</select>
			</div>
			<label for="searchValue6">학교유형</label>
			<div class="slt_box" >
				<select id="searchValue6" name="searchValue6" class="join_select1" style="width:150px;">
					<option value="">전체</option>
					<option value="A"<c:if test="${vo.searchValue6 eq 'A'}">selected="seleted"</c:if>>특성화고</option>
					<option value="B"<c:if test="${vo.searchValue6 eq 'B'}">selected="seleted"</c:if>>마이스터고</option>
				</select>
			</div>
			<label for="searchValue7">키워드</label>
			<div class="slt_box">
				<select id="searchValue7" name="searchValue7" class="join_select1" style="width:150px;">
					<option value="0">전체</option>  
					<option value="1"<c:if test="${vo.searchValue7 eq '1'}">selected="selected"</c:if>>접수번호</option>
					<option value="2"<c:if test="${vo.searchValue7 eq '2'}">selected="selected"</c:if>>아이디어 명칭</option>
					<option value="3"<c:if test="${vo.searchValue7 eq '3'}">selected="selected"</c:if>>팀명</option>
					<option value="4"<c:if test="${vo.searchValue7 eq '4'}">selected="selected"</c:if>>대표학생(성명)</option>
					<option value="5"<c:if test="${vo.searchValue7 eq '5'}">selected="selected"</c:if>>학교</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="input_box">
				<input id="searchKeyword2" name="searchKeyword2" placeholder="검섹어를 입력하세요." style="width:100%;" type="text" value="${vo.searchKeyword2}"/>
			</div>
			<a href="javascript:void(0);" onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr_cnt"><p>Total <c:out value="${paginationInfo2.totalRecordCount}"/></p></div>
		<div class="fr">
			<a href="javascript:void(0);" onClick="fn_layer_open();" style="cursor:pointer" class="fr_btn">엑셀 다운로드</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:10%;">
			<col style="width:auto;">
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
				<th scope="col">접수번호</th>
				<th scope="col">아이디어 명칭</th>
				<th scope="col">팀명</th>
				<th scope="col">대표학생(성명)</th>
				<th scope="col">아이디어 구분</th>
				<th scope="col">학교</th>
				<th scope="col">학교유형</th>
				<th scope="col">접수상태</th>
			</tr>
		</thead>
		<tbody> 
 			<c:forEach items="${resultList2}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo2.totalRecordCount+1 - ((vo.pageIndex2-1) * vo.pageUnit2 + status.count)}</td>
					<td><c:out value="${list.applyNumber}"/></td>
					<td>
						<a onClick="fn_edit2('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.ideaName}"/></a>
					</td>
					<td><c:out value="${list.teamName}"/></td>
					<td><c:out value="${list.teamUserName1}" /></td>
					<td>
						<c:choose>
							<c:when test="${list.ideaGubun eq 'A'}">
								<c:out value="자유과제"/>
							</c:when>
							<c:when test="${list.ideaGubun eq 'B'}">
								<c:out value="전문교과과제"/>
							</c:when>
							<c:when test="${list.ideaGubun eq 'C'}">
								<c:out value="협력기업과제"/>
							</c:when>
							<c:when test="${list.ideaGubun eq 'D'}">
								<c:out value="테마과제"/>
							</c:when>
							<c:otherwise>
								<c:out value="-"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td><c:out value="${list.school}" /></td>
					<td>
						<c:choose>
							<c:when test="${list.schoolType eq 'A'}">
								<c:out value="특성화고"/>
							</c:when>
							<c:when test="${list.schoolType eq 'B'}">
								<c:out value="마이스터고"/>
							</c:when>
							<c:otherwise>
								<c:out value="-"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${list.useAt eq 'A'}">
								<c:out value="접수완료"/>
							</c:when>
							<c:when test="${list.useAt eq 'B'}">
								<c:out value="접수취소"/>
							</c:when>
							<%-- <c:when test="${list.schoolType eq 'A'}">
								<c:out value="접수대기"/>
							</c:when> --%>
							<c:otherwise>
								<c:out value="-"/>
							</c:otherwise>
						</c:choose>
					</td>
			</c:forEach>
			<c:if test="${empty resultList2}">
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
		<ui:pagination paginationInfo="${paginationInfo2}" type="image" jsFunction="fn_cmmn_page" />
		<form:hidden path="pageIndex2" />
	</div> 
	<!-- // pagination -->
	<div class="btn_wrap">
		<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
	</div>
</form:form>
<form:form commandName="commonVO" name="excelDownForm" id="excelDownForm" method="post">
	<input type="hidden" id="idx" name="idx" value="${vo.idx}"/> 
	<input type="hidden" id="searchValue4" name="searchValue4" value="${vo.searchValue4}"/>
	<input type="hidden" id="searchValue5" name="searchValue5" value="${vo.searchValue5}"/>
	<input type="hidden" id="searchValue6" name="searchValue6" value="${vo.searchValue6}"/>
	<input type="hidden" id="searchValue7" name="searchValue7" value="${vo.searchValue7}"/>
	<input type="hidden" id="searchKeyword2" name="searchKeyword2" value="${vo.searchKeyword2}"/>
	
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
<!-- // right end -->			
