<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>
	function fn_edit(idx){
		$('#idx').val(idx);
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
		$('#cmmnForm').submit();
	}
	
	function fn_user_apply() {
		if($("#user_number").val() == "") {
			alert("접수번호를 입력해주세요.");
			return;
		}
		if($("#user_pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		var data = {'user_number': $("#user_number").val(), 'user_pw': $("#user_pw").val()};
		fn_cmmn_ajax("${vo.selfPath}apply_check.ajax", false, data, 'json', function(res) {
			if(res) {
				if(res.result == "200") {
					if(res.checked == "Y") {
						$('#idx').val(res.idx);
						$('#cmmnForm').attr('action', "${vo.selfPath}apply_view.do");
						$('#cmmnForm').submit();
					} else {
						alert("비밀번호 및 접수번호를 확인 후 다시 시도해주세요.");
					}
				}
			}
		});
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<form:hidden path="idx"/>
<form:hidden path="act"/>

	<div class="cont_wrap">
		<div class="cont_each">
			<!-- base -->
			<div class="search_wrap">
				<div class="base flex">
					<label for="categori">년도</label>
					<select name="searchValue1" id="searchValue1">
						<option value="">전체</option>
						<c:forEach items="${yearList}" var="list" varStatus="status">
							<option value="${list.no}" <c:if test="${vo.searchValue1 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
						</c:forEach>
					</select>
					<label for="categori">모집상태</label>
					<select name="searchValue2" id="searchValue2">
						<option value="">전체</option>
						<option value="A" <c:if test="${vo.searchValue2 eq 'A'}">selected="selected"</c:if>>모집예정</option>
						<option value="B" <c:if test="${vo.searchValue2 eq 'B'}">selected="selected"</c:if>>모집중</option>
						<option value="C" <c:if test="${vo.searchValue2 eq 'C'}">selected="selected"</c:if>>모집종료</option>
					</select>
					<input type="text" placeholder="검색어를 입력하세요." class="search_word" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}">
					<button type="button" class="btn_search" onclick="fn_cmmn_search();">검색 <i class="xi-search"></i></button>
				</div>
			</div>
			<div class="table_top_nav">
				<div class="right_area">
					<a href="javascript:;" class="contest_btn enroll_btn">신청내역 조회</a>
				</div>
			</div>
			<div class="board_wrap mobile">
				<ul>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<li>
							<div class="title">
								<a href="javascript:void(0);" onclick="fn_edit('${list.no}');"><c:out value="${list.title}" escapeXml="false"/></a>
							</div>
							<div class="order_list">
								<dl>
									<dt>연도</dt>
									<dd><c:out value="${list.yearName}"/></dd>
								</dl>
								<dl>
									<dt>모집기간</dt>
									<dd><c:out value="${list.startDate}"/> ~ <c:out value="${list.endDate}"/></dd>
								</dl>
								<dl>
									<dt>작성일</dt>
									<dd><c:out value="${list.regDate}"/></dd>
								</dl>
								<dl>
									<dt>모집상태</dt>
									<dd>
										<c:choose>
											<c:when test="${list.mojibAt eq 'A'}"><span class="teg_area">모집예정</span></c:when>
											<c:when test="${list.mojibAt eq 'B'}"><span class="teg_notice">모집중</span></c:when>
											<c:when test="${list.mojibAt eq 'C'}"><span class="teg_new">모집종료</span></c:when>
										</c:choose>
									</dd>
								</dl>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
	
			<div class="board_wrap web">
				<table>
					<thead>
					  <tr>
						<th>번호</th>
						<th>연도</th>
						<th>제목</th>
						<th>모집기간</th>
						<th>작성일</th>
						<th>모집상태</th>
					  </tr>
					</thead>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr>
								<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
								<td><c:out value="${list.yearName}"/></td>
								<td class="subject"><a href="javascript:void(0);" onclick="fn_edit('${list.no}');"><c:out value="${list.title}" escapeXml="false"/></a></td>
								<td><c:out value="${list.startDate}"/> ~ <c:out value="${list.endDate}"/></td>
								<td><c:out value="${list.regDate}"/></td>
								<td>
									<c:choose>
										<c:when test="${list.mojibAt eq 'A'}"><span class="teg_area">모집예정</span></c:when>
										<c:when test="${list.mojibAt eq 'B'}"><span class="teg_notice">모집중</span></c:when>
										<c:when test="${list.mojibAt eq 'C'}"><span class="teg_new">모집종료</span></c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="table_pagging">
				<span class="num">
					<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_cmmn_page" />
				</span>
				<form:hidden path="pageIndex" />
			</div>
		</div>
	</div>
	<div class="pop_enroll" style="">
		<div class="cont">
			<div class="box">
				<div class="inner">
					<div class="tit_box">
						<div class="tit">신청내역 조회</div>
					</div>
					<div class="com_table_cont">
						<div class="table_box">
							<table class="board_write">
								<caption></caption>
								<colgroup>
									<col style="width: 205px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>접수번호</th>
										<td><input name="user_number" id="user_number" value="" type="text" title="접수번호를 입력해주세요"></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input name="user_pw" id="user_pw" value="" type="password" title="비밀번호를 입력해주세요"></td>
									</tr>
								</tbody>
							</table>
							<span class="bt_txt">접수번호 및 비밀번호를 입력하여 신청내역을 조회하실 수 있습니다.</span>
							<div class="btn_center_area">
								<button class="btn_blue big" type="button" onclick="fn_user_apply();">조회</button>
							</div>
						</div>
					</div>
				</div>
				<div class="board_btn_area">
					<button type="button" class="btn_base close">취소</button>
				</div>
			</div>
		</div>
	</div>
</form:form>
</body>
