<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script>
		function fn_edit(act, idx) {
			$('#idx').val(idx);
			$('#act').val(act);
			$('#cmmnForm').attr('action', "${selfPath}edit.do");
			$('#cmmnForm').submit();
		}
		
		function fn_servey_list(idx) {
// 			alert("준비중입니다.");
// 			return;
			$('#idx').val(idx);
			$('#cmmnForm').attr('action', "${selfPath}servey_list.do");
			$('#cmmnForm').submit();
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/> 		  							<!-- 고유값 -->
	<form:hidden path="act"/> 		  							<!-- 상태값 -->
	<div class="sub_sch_box">
		<div class="row">
			<label for="searchValue1" style="width: 10%">공개여부</label>
			<div class="slt_box" style="width: 15%;">
				<select id="searchValue1" name="searchValue1" class="join_select1">
					<option value="">전체</option>
					<option value="Y" <c:if test="${vo.searchValue1 eq 'Y'}">selected="selected"</c:if>>공개</option>
					<option value="N" <c:if test="${vo.searchValue1 eq 'N'}">selected="selected"</c:if>>미공개</option>
				</select>
			</div>
			<label for="searchValue2" style="width: 10%">키워드</label>
			<div class="slt_box" style="width: 15%;">
				<select id="searchValue2" name="searchValue2" class="join_select1">
					<option value="0">전체</option>
					<option value="1" <c:if test="${vo.searchValue2 eq '1'}">selected="selected"</c:if>>제목</option>
					<option value="2" <c:if test="${vo.searchValue2 eq '2'}">selected="selected"</c:if>>내용</option>
				</select>
			</div>
			<div class="input_box">
				<input id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요." type="text" value="${vo.searchKeyword}"/>
			</div>
			<a onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr_cnt"><p>Total <c:out value="${paginationInfo.totalRecordCount}"/></p></div>
		<div class="fr">
			<a onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:auto%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:15%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">바로가기</th>
				<th scope="col">설문기간</th>
				<th scope="col">공개여부</th>
				<th scope="col">타입</th>
				<th scope="col">등록일</th>
				<th scope="col">설문관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">${list.title}</a></td>
					<td><a href="/home/kor/archive/serveyMng/edit.do?menuPos=126&idx=${list.no}&act=detail" style="cursor:pointer"  class="fr_btn" target="_blank">바로가기</a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">${list.surveyStartDate} ~ ${list.surveyEndDate}</a></td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">${list.useAtName}</a></td>
					<td>
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">
							<c:choose>
								<c:when test="${list.memberType eq 'A'}">회원</c:when>
								<c:when test="${list.memberType eq 'B'}">전체</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</a>
					</td>
					<td><a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer">${list.regDate}</a></td>
					<td>
						<a onClick="fn_servey_list('${list.no}');" style="cursor:pointer" class="fr_btn">설문관리</a>
					</td>
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

</body>