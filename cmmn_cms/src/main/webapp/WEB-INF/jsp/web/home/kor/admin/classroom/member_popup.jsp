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
			
			function fn_regist_data(name,phone) {
				opener.fn_append_data(name,phone);
				alert("입력되었습니다.");
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
				<col style="width:auto;">
				<col style="width:15%;">
				<col style="width:15%;">
				<col style="width:20%;">
				<col style="width:20%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">아이디</th>
					<th scope="col">성명</th>
					<th scope="col">생년월일</th>
					<th scope="col">이메일</th>
					<th scope="col">휴대폰</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList2}" var="list" varStatus="status">
				<tr>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${list.name}','${list.phone}');"><c:out value="${paginationInfo2.totalRecordCount+1 - ((vo.pageIndex2-1) * vo.pageUnit2 + status.count)}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${list.name}','${list.phone}');"><c:out value="${list.id}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${list.name}','${list.phone}');"><c:out value="${list.name}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${list.name}','${list.phone}');"><c:out value="${list.birth}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${list.name}','${list.phone}');"><c:out value="${list.email}"/></a></td>
					<td><a href="javascript:void(0);" onclick="fn_regist_data('${list.name}','${list.phone}');"><c:out value="${list.phone}"/></a></td>
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
