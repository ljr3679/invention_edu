<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>
	function fn_edit(act, idx, type) {
		if(type == "A") {
			<c:if test="${empty usrSession}">
				alert("회원만 가능한 설문조사입니다. 로그인 후 이용해주세요.");
				return;
			</c:if>	
		}
		
		$('#idx').val(idx);
		$('#act').val(act);
		$('#cmmnForm').attr('action', "${selfPath}edit.do");
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<form:hidden path="idx"/>
<form:hidden path="act"/>
	<div class="cont_each">
		<div class="search_wrap">
			<div class="base flex">
				<label for="searchValue1">카테고리</label>
				<select name="searchValue1" id="searchValue1">
					<option value="0" <c:if test="${vo.searchValue1 eq '0'}">selected="selected"</c:if>>전체</option>
					<option value="1" <c:if test="${vo.searchValue1 eq '1'}">selected="selected"</c:if>>제목</option>
					<option value="2" <c:if test="${vo.searchValue1 eq '2'}">selected="selected"</c:if>>내용</option>
				</select>
				<input id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요." class="search_word" type="text" value="${vo.searchKeyword}">
				<button type="button" class="btn_search" onclick="fn_cmmn_search();">검색 <i class="xi-search"></i></button>
			</div>
		</div>
		<div class="table_top_nav">
			<div class="left_area page_num"><i class="xi-file-text-o"></i> 총 <span class="point_blue"><c:out value="${paginationInfo.totalRecordCount}"/></span>개</div>
		</div>
		<div class="board_wrap mobile">
			<c:forEach items="${resultList}" var="list" varStatus="status">
				<ul>
					<li><a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer"><c:out value="${list.title}" escapeXml="false" /></a></li>
					<li>
						<a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer">
							<c:choose>
								<c:when test="${list.memberType eq 'A'}">회원</c:when>
								<c:when test="${list.memberType eq 'B'}">전체</c:when>
							</c:choose>
						</a>
					</li>
					<li><a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer">${list.surveyStartDate} ~ ${list.surveyEndDate}</a></li>
					<li><a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer">${list.regDate}</a></li>
				</ul>
			</c:forEach>
		</div>
		
		<div class="board_wrap web">
			<table>
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 50%;">
					<col style="width: 10%;">
					<col style="width: 20%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>타입</th>
						<th>설문일자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class=""><a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer">${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</a></td>
							<td class=""><a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer"><c:out value="${list.title}" escapeXml="false" /></a></td>
							<td class="">
								<a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer">
									<c:choose>
										<c:when test="${list.memberType eq 'A'}">회원</c:when>
										<c:when test="${list.memberType eq 'B'}">전체</c:when>
									</c:choose>
								</a>
							</td>
							<td class=""><a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer">${list.surveyStartDate} ~ ${list.surveyEndDate}</a></td>
							<td class=""><a onclick="fn_edit('detail', '${list.no}', '${list.memberType}');" style="cursor:pointer">${list.regDate}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</form:form>
</body>
