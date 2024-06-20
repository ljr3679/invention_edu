<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<script type="text/javascript">
	function fn_edit() {
		if(fn_validation_check($('#cmmnForm'),fn_custom_vali)) {
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg+' 하시겠습니까?')) {
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
        $('#cmmnForm').attr('action', '${vo.selfPath}edit.do');
        $('#cmmnForm').submit();
    }
</script>

<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="tabPos"/>
<!-- board_write -->
<div class="caption_title">· 롤링영역</div>
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
				<input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData3.useAt eq 'Y' or empty resultData31}">checked="checked"</c:if> value="Y" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">사용</label>
             	<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData3.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">미사용</label>
			</td>
        </tr>
        <tr>
			<th scope="row">URL 오픈방식 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey2_1" name="paramKey2" <c:if test="${resultData3.openAt eq 'A' or empty resultData31}">checked="checked"</c:if> value="A" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey2_1">현재창 이동</label>
             	<input type="radio" id="paramKey2_2" name="paramKey2" <c:if test="${resultData3.openAt eq 'B'}">checked="checked"</c:if> value="B" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey2_2">새 탭 오픈</label>
			</td>
        </tr>
		<tr>
			<th scope="row">링크 URL <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey4" name="paramKey4" vali-text="링크 URL을 입력해주세요." value="${resultData3.url}" style="width: 100%;" />
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
	</tbody>
</table>
<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onclick="fn_edit();" style="cursor: pointer;" class="right btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}" /></a>
    <a href="javascript:void(0);" onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">목록</a>
</div>
</form:form>	