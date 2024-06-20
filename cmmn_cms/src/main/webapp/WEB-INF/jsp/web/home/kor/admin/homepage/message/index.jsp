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
	
	</script>
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
			<a href="javascript:void(0);" onClick="fn_cmmn_search();" style="cursor: pointer;" class="sch_box_btn"><span class="ico">검색</span></a>
		</div>
	</div>
	
	<!-- button -->
	<div class="clearfix">
		<div class="fr_cnt"><p>Total <c:out value="${paginationInfo.totalRecordCount}"/>건 남은 캐쉬 : <c:out value="${sCash}"/>, 문자서비스 제공자 : 메세지미 <a href="https://www.messageme.co.kr/" target="_blank"><img src="/images/cmmn/admin/bread_home.png" width="20px" /></a></p> </div>
		<div class="fr">
			<a href="javascript:void(0);" onClick="fn_edit('regist');" style="cursor:pointer" class="fr_btn">등록</a>
			<a href="javascript:void(0);" onclick="fn_delete();" style="cursor: pointer;" class="fr_btn">삭제</a>
		</div>
	</div>
	<!-- // button -->
	
	<!-- list -->
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:5%;">
			<col style="width:15%;">
			<col style="width:auto;">
			<col style="width:10%;">
			<col style="width:5%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">발신일</th>
				<th scope="col"><input type="checkbox" id="checkbox_all"></th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
					<td>
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.subject}"/></a>
					</td>
					<td style="text-align: left;">
						<a onClick="fn_edit('modify', '${list.no}');" style="cursor:pointer"><c:out value="${list.content}"/></a>
					</td>
					<td><c:out value="${list.regDate}"/></td>
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
</body>