<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
		});
		if(fn_validation_check($('#cmmnForm'),fn_custom_vali)) {
			if(confirm('저장 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}
	}
	
	function fn_custom_vali(obj, index) {
		if($(obj).attr('name') == 'fileVali1') {
			if($(obj).next().find('.kssFileBody').find('li').length == 0) {
				return false;
			}
		}
		return true;
	}
	function fn_cancel(){
        $('#act').remove();
        $('#idx').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
        $('#cmmnForm').submit();
    }
	
	/* function custom_check(obj, index) {
		var id = $(obj).attr('id');
		switch (id) {
			case 'check4':
				return fn_email_check($('#paramKey7').val());
				break;
		}
		
		return true;
	} */
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="searchValue1" /> <!-- 메뉴명 -->
<form:hidden path="searchValue2" /> <!-- 메뉴명 -->
<form:hidden path="searchValue3" /> <!-- 메뉴명 -->
<form:hidden path="searchValue4" />
<form:hidden path="searchValue5" />
<form:hidden path="searchKeyword" /> <!-- 메뉴명 -->
<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">사용여부 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData.useAt eq 'Y' or vo.act eq 'regist'}">checked="checked"</c:if> value="Y" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">사용</label>
             	<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">미사용</label>
			</td>
        </tr>
        <tr>
			<th scope="row">구분 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey2" name="paramKey2" class="join_select1" vali-text="구분을 선택해주세요." style="width:200px;">
					<option value="">전체</option> 
					<c:forEach items="${type}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.typeRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">년도 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey3" name="paramKey3" class="join_select1" vali-text="년도를 선택해주세요." style="width:200px;">
					<option value="">전체</option> 
					<c:forEach items="${year}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.yearRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">지역 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey4" name="paramKey4" class="join_select1" vali-text="지역을 선택해주세요." style="width:200px;">
					<option value="">전체</option> 
					<c:forEach items="${region}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.regionRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">협력기관 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey5" name="paramKey5" vali-text="협력기관을 입력해주세요." value="${resultData.title}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">교원수 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey6" name="paramKey6" vali-text="교원수를 입력해주세요." value="${resultData.teacherCnt}" style="width: 450px;" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');" maxlength="4"/>
				<div style="margin-top:5px; ">
                    <label for="paramKey6" style="color: gray; font-size: 14px;">※ 숫자(정수)만 입력.</label>	
                </div>
			</td>
		</tr>
		<tr>
			<th scope="row">학생수 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey7" name="paramKey7" vali-text="학생수를 입력해주세요." value="${resultData.studentCnt}" style="width: 450px;" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');" maxlength="4"/>
				<div style="margin-top:5px; ">
                    <label for="paramKey7" style="color: gray; font-size: 14px;">※ 숫자(정수)만 입력.</label>	
                </div>
			</td>
		</tr>
		<tr>
			<th scope="row">우수 사례 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td style="width: 100%; height: 300px; resize: none;">
				<textarea id="paramKey8" name="paramKey8" editor="Y" vali-text="우수 사례를 입력해주세요." style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.content}" escapeXml="false"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">보고서 다운로드 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="보고서를 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList1', 1, 'pdf', 100, 'MB', true, fileList1)}" escapeXml="false"/>
				<!-- <div style="margin-top:5px; ">
                    <label for="fileVali1" style="color: gray; font-size: 14px;">※ 첨부파일은 최대 1개 5MB이하 jpg, png, jpeg, gif, tiff, bmp 확장자만 등록 가능합니다.</label>	
                </div> -->
			</td>
		</tr>
	</tbody>
</table>

<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->
