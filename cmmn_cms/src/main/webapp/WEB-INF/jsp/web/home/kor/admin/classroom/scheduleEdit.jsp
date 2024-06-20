<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
		if(fn_validation_check($('#cmmnForm'))) {
			if(confirm('저장 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}scheduleEdit.act');
				$('#cmmnForm').submit();
			}
		}
	}

	function fn_cancel(){
        $('#act').remove();
        $('#idx').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}scheduleList.do');
        $('#cmmnForm').submit();
    }

	function fn_delete() {
		
		if(confirm('삭제 하시겠습니까?')) {
			$('#act').val('delete');
			$('#cmmnForm').attr('action', "${vo.selfPath}scheduleEdit.act");
			$('#cmmnForm').submit();
		}
	}	
	
	
	$("#paramKey1").datepicker({
		dateFormat: "yy-mm-dd"
	});		
	
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="idx2"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="searchValue1" /> <!-- 검색조건 -->
<form:hidden path="searchKeyword" /> <!-- 키워드 -->
<input type="hidden" id="gno" name="gno" value="${resultData.gno}">

<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">교육일</th>
			<td>
				<input type="text" id="paramKey1" name="paramKey1" vali-text="교육일을 입력해주세요." value="${resultData.eduDate}" style="width: 10%;" />
			</td>
		</tr>	
		<tr>
			<th scope="row">담당</th>
			<td>
				<input type="text" id="paramKey2" name="paramKey2" vali-text="담당교사를 입력해주세요." value="${resultData.charge}" style="width: 20%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">수업종류</th>
			<td>
				<select id="paramKey3" name="paramKey3" class="join_select1" vali-text="학제를 선택해주세요." style="width:150px;">
					<option value="e1" <c:if test="${resultData.eduKind eq 'e1'}">selected="selected"</c:if>>원격강의</option>
					<option value="e2" <c:if test="${resultData.eduKind eq 'e2'}">selected="selected"</c:if>>발표회</option>
					<option value="e3" <c:if test="${resultData.eduKind eq 'e3'}">selected="selected"</c:if>>현장학습</option>
				</select>
				
			</td>
		</tr>
		<tr>
			<th scope="row">자원</th>
			<td>
				<input type="text" id="paramKey4" name="paramKey4" vali-text="자원을 입력해주세요." value="${resultData.resourceKind}" style="width: 10%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">완료여부</th>
			<td>
				<select id="paramKey5" name="paramKey5" class="join_select1" vali-text="학제를 선택해주세요." style="width:150px;">
					<option value="N" <c:if test="${resultData.eduKind eq 'N'}">selected="selected"</c:if>>미완료</option>
					<option value="Y" <c:if test="${resultData.eduKind eq 'Y'}">selected="selected"</c:if>>완료</option>
				</select>				
			</td>
		</tr>
	</tbody>
</table>

<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn">저장</a>
	<a href="javascript:void(0);" onClick="fn_delete();" class="btn">삭제</a>
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->
