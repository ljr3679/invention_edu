<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<html>
	<head>
		<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_css.jsp" %>
		<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_js.jsp" %>
		
		<script type="text/javascript">
			function fn_cmmn_list_page2(pageNo) {
				$('#pageIndex2').val(pageNo);
				$('#cmmnForm').attr('action', "${vo.selfURI}");
				$('#cmmnForm').submit();
			}
			
			function fn_regist_data(data) {
				console.log('data::' + data);
				opener.fn_append_data(data);
			}
			
			function fn_cancel() {
				window.close();
			}
		</script>
	</head>
	<body style="padding: 20px;">
	<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
		<div class="clearfix">
			<div class="fr_cnt">
				<div class="fr">
					<a href="javascript:void(0);" onclick="fn_cancel();" class="fr_btn">닫기</a>
				</div>
			</div>
		</div>
		
		<div class="sub_sch_box">
			<div class="row">
				<label style="width: 15%">상태</label>
				<div class="slt_box" style="width: 20%;">
					<select name="searchValue1" style="width: 150px;" class="join_select1">
						<option value="">전체</option>
						<option value="Y"<c:if test="${vo.searchValue1 eq 'Y'}">selected="seleted"</c:if>>사용</option>
						<option value="N"<c:if test="${vo.searchValue1 eq 'N'}">selected="seleted"</c:if>>승인거부</option>
						<option value="E"<c:if test="${vo.searchValue1 eq 'E'}">selected="seleted"</c:if>>탈퇴</option>
					</select>
				</div>
				<label style="width: 10%">키워드</label>
				<div class="slt_box" style="width: 15%">
					<select name="searchValue2" style="width: 150px;" class="join_select1">
						<option value="">전체</option>
						<option value="A" <c:if test="${vo.searchValue2 eq 'A'}">selected="selected"</c:if>>학생</option>
						<option value="B" <c:if test="${vo.searchValue2 eq 'B'}">selected="selected"</c:if>>대표학생</option>
						<option value="C" <c:if test="${vo.searchValue2 eq 'C'}">selected="selected"</c:if>>교사용</option>
					</select>
				</div>
				<label style="width: 10%">성명</label>
				<div class="input_box">
					<input id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요." type="text" value="${vo.searchKeyword}">
				</div>
				<a onclick="fn_cmmn_search2();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
			</div>
		</div>
		
		<table class="board_list th_bgc">
			<colgroup>
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:auto;">
				<col style="width:15%;">
				<col style="width:20%;">
				<col style="width:20%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">상태</th>
					<th scope="col">아이디</th>
					<th scope="col">성명</th>
					<th scope="col">이메일</th>
					<th scope="col">휴대폰</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList2}" var="list" varStatus="status">
				<tr>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${not empty list.phone ?cFn:decrypt(list.phone) :''}');"><c:out value="${paginationInfo2.totalRecordCount+1 - ((vo.pageIndex2-1) * vo.pageUnit2 + status.count)}"/></a></td>
					<td>
						<a href="javascript:void(0);" onclick="fn_regist_data('${not empty list.phone ?cFn:decrypt(list.phone) :''}');">
							<c:out value="${list.useAt}" />
							<%-- 일반
							<c:if test="${list.designAt ne 0}">/ 초대 디자이너</c:if>
		 					<c:if test="${list.expertAt ne 0}">/ 전문가</c:if>
		 					<c:if test="${list.expertAt ne 0 and list.judgeAt ne 0}">/ 심사위원</c:if>
		 					<c:if test="${list.designAt ne 0 and list.manageAt ne 0}">/ 운영위원</c:if> --%>
	 					</a>
					</td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${not empty list.phone ?cFn:decrypt(list.phone) :''}');"><c:out value="${list.id}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${not empty list.phone ?cFn:decrypt(list.phone) :''}');"><c:out value="${list.name}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${not empty list.phone ?cFn:decrypt(list.phone) :''}');"><c:out value="${not empty list.email ?cFn:decrypt(list.email) :''}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${not empty list.phone ?cFn:decrypt(list.phone) :''}');"><c:out value="${not empty list.phone ?cFn:decrypt(list.phone) :''}"/></a></td>
				</tr>
				</c:forEach>
				<c:if test="${empty resultList2}">
				<tr>
					<td id="empty_row1">등록된 게시물이 없습니다.</td>
					<script>$('#empty_row1').attr('colspan', $('#empty_row1').parent().parent().parent().find('col').length);</script>
				</tr>
				</c:if>
			</tbody>
		</table>
		
		<div id="paging" class="pagination">
			<ui:pagination paginationInfo="${paginationInfo2}" type="image" jsFunction="fn_cmmn_list_page2" />
			<form:hidden path="pageIndex2" />
		</div>
		
	</form:form>	
	<script type="text/javascript" src="/js/cmmn/common_site.js"></script>
	</body>
</html>
