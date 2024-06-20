<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<script type="text/javascript">
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
		});
		if(fn_validation_check($('#cmmnForm'),fn_custom_vali)) {
			console.log('time1::' + $('#paramKey8').val());
			console.log('time2::' + $('#paramKey10').val());
			console.log('time1::' + $('#paramKey9').val());
			console.log('time2::' + $('#paramKey10').val());
			if($('#paramKey5').val() == $('#paramKey6').val()){
				console.log('yes');
				if(parseInt($('#paramKey8').val()) > parseInt($('#paramKey10').val()) ) {
					console.log('1');
					$('#paramKey8').val('');
					$('#paramKey10').val('');
					console.log('1s ');
					alert('모집기간을 확인 하십시오.');
					return false;
				}
				if( parseInt($('#paramKey9').val()) >= parseInt($('#paramKey11').val()) ) {
					console.log('2');
					if(parseInt($('#paramKey8').val()) >= parseInt($('#paramKey10').val()) ) {
						console.log('3');
						$('#paramKey9').val('');
						$('#paramKey11').val('');
						console.log('3s');
						alert('모집기간을 확인 하십시오.');
						return false;
					}
				}
			}
			if($('#paramKey5').val() != $('#paramKey6').val()){
				console.log('no');
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
	function fn_hour(obj){
		if(obj.value > 23 || obj.value < 0)
			obj.value = null;
		if(obj.value.length > 2)
			obj.value = null;
	}
	function fn_min(obj){
		if(obj.value > 59 || obj.value < 0)
			obj.value = null;
		if(obj.value.length > 2)
			obj.value = null;
	}
	
	function fn_cancel(){
        $('#act').remove();
        $('#idx').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
        $('#cmmnForm').submit();
    }
</script>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="tabPos"/>
<form:hidden path="searchValue1" /> <!-- 메뉴명 -->
<form:hidden path="searchValue2" />
<form:hidden path="searchValue3" />
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
			<th scope="row">확인상태 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData.useAt eq 'Y' or vo.act eq 'regist'}">checked="checked"</c:if> value="Y" vali-text="확인상태를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">확인</label>
             	<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="확인상태를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">미확인</label>
			</td>
        </tr>
        <tr>
			<th scope="row">년도 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey3" name="paramKey3" class="join_select1" vali-text="년도를 선택해주세요." style="width:150px;">
					<option value="">전체</option> 
					<c:forEach items="${year}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.yearRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
        </tr>
        <tr>
			<th scope="row">구분 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey2" name="paramKey2" class="join_select1" vali-text="구분을 선택해주세요." style="width:400px;">
					<option value="">전체</option> 
					<c:forEach items="${type}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.typeRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
        </tr>
		<tr>
			<th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey4" name="paramKey4" vali-text="제목을 입력해주세요." value="${resultData.title}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">모집기간 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="text" id="paramKey5" name="paramKey5" class="datepicker" onChange="datepicker_start('paramKey5','paramKey6')" style="width: 150px; cursor: pointer;" vali-text="모집기간 시작일을 선택해주새요." readonly="readonly" value="${resultData.startDate}"/>
				<input type="text" id="paramKey8" name="paramKey8" maxlength="2" max="23" min="0" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');fn_hour(this);" style="width: 50px;" vali-text="모집기간 시작시간을 선택해주새요." value="${resultData.startHour}"/>시
				<input type="text" id="paramKey9" name="paramKey9" maxlength="2" max="59" min="0" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');fn_min(this);" style="width: 50px;" vali-text="모집기간 시작시간을 선택해주새요." value="${resultData.startMin}"/>분
				~
				<input type="text" id="paramKey6" name="paramKey6" class="datepicker" onChange="datepicker_start('paramKey5','paramKey6')" style="width: 150px; cursor: pointer;" vali-text="모집기간 종료일을 선택해주새요." readonly="readonly" value="${resultData.endDate}"/>
				<input type="text" id="paramKey10" name="paramKey10" maxlength="2" max="23" min="0" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');fn_hour(this);" style="width: 50px;" vali-text="모집기간 종료시간을 선택해주새요." value="${resultData.endHour}"/>시
				<input type="text" id="paramKey11" name="paramKey11" maxlength="2" max="59" min="0" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');fn_min(this);" style="width: 50px;" vali-text="모집기간 종료시간을 선택해주새요." value="${resultData.endMin}"/>분
			</td>
		</tr>
		<tr>
			<th scope="row">내용 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td style="width: 100%; height: 300px; resize: none;">
				<textarea id="paramKey7" name="paramKey7" editor="Y" style="width: 100%; height: 300px; resize: none;" vali-text="내용을 입력해주세요."><c:out value="${resultData.content}" escapeXml="false"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">첨부파일 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="첨부파일을 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList1', 1, 'attach', 100, 'MB', true, fileList1)}" escapeXml="false"/>
				<!-- <div style="margin-top:5px; ">
                    <label for="fileVali1" style="color: gray; font-size: 14px;">※ 이미지 사이즈(가로1903px; 세로 350px;)</label>	
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
