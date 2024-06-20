<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>

</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<form:hidden path="idx"/> 		  							<!-- 고유값 -->
	<form:hidden path="act"/> 		  							<!-- 상태값 -->
	<div class="sub_sch_box">
		<div class="row">
				<label style="">발신일 </label>
				<div class="input_box" style="">
					<form:input type="text" path="searchValue3" name="searchValue3" class="datepicker"  onChange="datepicker_start('searchValue3','searchValue4')" style="width: 150px; cursor: pointer;"/>
					~
					<form:input type="text" path="searchValue4" name="searchValue4" class="datepicker"  onChange="datepicker_start('searchValue3','searchValue4')" style="width: 150px; cursor: pointer;"/>
				</div>
				<label style="margin-left: 20px;" for="searchKeyword">제목</label>
				<div class="input_box">
					<input id="searchKeyword" name="searchKeyword" placeholder="제목을 입력하세요." type="text" value="${vo.searchKeyword}"/>
				</div>				
				<label style="margin-left: 20px;" for="searchKeyword2">내용</label>
				<div class="input_box">
					<input id="searchKeyword2" name="searchKeyword2" placeholder="내용을 입력하세요." type="text" value="${vo.searchKeyword2}"/>
				</div>
				<label style="margin-left: 20px;" for="searchKeyword3">수신번호</label>
				<div class="input_box">
					<input id="searchKeyword3" name="searchKeyword3" placeholder="내용을 입력하세요." type="text" value="${vo.searchKeyword3}"/>
				</div>				
			<a href="javascript:void(0);" onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:15%;">
			<col style="width:auto;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">발신번호</th>
				<th scope="col">수신번호</th>
				<th scope="col">발신일</th>
				<th scope="col">발신여부</th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td><c:out value="${list.subject}"/></td>
					<td style="text-align: left;"><c:out value="${list.content}"/></td>
					<td><c:out value="${list.caller}"/></td>
					<td><c:out value="${list.phone}"/></td>
					<td><c:out value="${list.sendDate}"/></td>
					<td>
						<c:choose>
							<c:when test="${list.resultCode eq '100'}">
 								데이터 전송 성공
							</c:when>
							<c:when test="${list.resultCode eq '155'}">
 								회원 상태 관련 오류
							</c:when>			
							<c:when test="${list.resultCode eq '185'}">
 								Cash 부족
							</c:when>	
							<c:when test="${list.resultCode eq '225'}">
 								Message 길이 오류
							</c:when>	
							<c:when test="${list.resultCode eq '315'}">
 								발신번호 오류
							</c:when>
							<c:otherwise>실패</c:otherwise>
						</c:choose>					
					
					
					
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