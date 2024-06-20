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
			if( $('#paramKey3_2').is(':checked') ){
				if($('#paramKey4').val() == "" || $('#paramKey5').val() == ""){
					alert("기간을 입력하세요.");
					return false;
				}
			} 
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
	$('input[type=radio][name=paramKey3]').on('change', function() {
		switch ($(this).val()) {
		case 'A':
			$('#timeSpan').hide();
		      	break;
		    case 'B':
		    	$('#timeSpan').show();
		     	break;
		}
	});
	$(document).ready(function(){
		$('#wordCnt').text($('#paramKey8').val().length);
		
		if( $('#paramKey3_1').is(':checked') ) $('#timeSpan').hide();
		else $('#timeSpan').show();
	});
	
	/* function custom_check(obj, index) {
		var id = $(obj).attr('id');
		switch (id) {
			case 'check4':
				return fn_email_check($('#paramKey7').val());
				break;
		}
		
		return true;
	} */
	
	function fn_word_cnt(){
		$('#wordCnt').text($('#paramKey8').val().length);
	}
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="searchValue1" /> <!-- 메뉴명 -->
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
			<th scope="row">URL 오픈방식 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey2_1" name="paramKey2" <c:if test="${resultData.openAt eq 'A' or vo.act eq 'regist'}">checked="checked"</c:if> value="A" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey2_1">현재창 이동</label>
             	<input type="radio" id="paramKey2_2" name="paramKey2" <c:if test="${resultData.openAt eq 'B'}">checked="checked"</c:if> value="B" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey2_2">새 탭 오픈</label>
			</td>
        </tr>
        <tr>
			<th scope="row">게시기간 설정 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey3_1" name="paramKey3" <c:if test="${resultData.periodAt eq 'A' or vo.act eq 'regist'}">checked="checked"</c:if> value="A" vali-text="게시기간 설정을 선택해주세요."><label style="margin-left: 10px" for="paramKey3_1">상시</label>
             	<input type="radio" id="paramKey3_2" name="paramKey3" <c:if test="${resultData.periodAt eq 'B'}">checked="checked"</c:if> value="B" vali-text="게시기간 설정을 선택해주세요."><label style="margin-left: 10px" for="paramKey3_2">기간 설정</label>
             	<span id="timeSpan">
                   	<input type="text" id="paramKey4" name="paramKey4" class="datepicker unCheck" onChange="datepicker_start('paramKey4','paramKey5')" style="width: 150px; cursor: pointer;" readonly="readonly" value="${resultData.startDate}"/>
					~
					<input type="text" id="paramKey5" name="paramKey5" class="datepicker unCheck" onChange="datepicker_start('paramKey4','paramKey5')" style="width: 150px; cursor: pointer;" readonly="readonly" value="${resultData.endDate}"/>
				</span>
			</td>
        </tr>
        <tr>
			<th scope="row">구분 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey6" name="paramKey6" vali-text="구분을 입력해주세요." value="${resultData.typeTitle}" style="width: 450px;" />
			</td>
		</tr>
		<tr>
			<th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey7" name="paramKey7" vali-text="제목을 입력해주세요." value="${resultData.title}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">세부내용 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="text" id="paramKey8" name="paramKey8" vali-text="제목을 입력해주세요." value="${resultData.content}" style="width: 100%;" onkeyup="fn_word_cnt();" maxlength="45"/>
				<div style="margin-top:5px; ">
                    <label for="paramKey8" style="color: gray; font-size: 14px;"><span id="wordCnt">0</span>/45</label>	
                </div>
			</td>
		</tr>
		<tr>
			<th scope="row">링크 URL <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey9" name="paramKey9" vali-text="링크 URL을 입력해주세요." value="${resultData.url}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">이미지 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="이미지를 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList1', 1, 'png,jpg,jpeg', 100, 'MB', true, fileList1)}" escapeXml="false"/>
				<div style="margin-top:5px; ">
                    <label for="fileVali1" style="color: gray; font-size: 14px;">※ 이미지 사이즈(가로1903px; 세로 350px;)</label>	
                </div>
			</td>
		</tr>
		<tr>
			<th scope="row">순서 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey10" name="paramKey10" vali-text="순서를 입력해주세요." value="${resultData.sort}" style="width: 450px;" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');" maxlength="3"/>
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
