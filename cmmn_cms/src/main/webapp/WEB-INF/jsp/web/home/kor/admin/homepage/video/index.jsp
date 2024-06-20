<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
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
		if($(obj).attr('name') == 'fileVali2') {
			if($(obj).next().find('.kssFileBody').find('li').length == 0) {
				return false;
			}
		}
		if($(obj).attr('name') == 'fileVali3') {
			if($(obj).next().find('.kssFileBody').find('li').length == 0) {
				return false;
			}
		}
		return true;
	}
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<!-- board_write -->
<div class="caption_title">· 홍보동영상 1</div>
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
        <tr>
			<th scope="row">URL 오픈방식 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData.openAt1 eq 'A' or vo.act eq 'regist'}">checked="checked"</c:if> value="A" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">현재창 이동</label>
             	<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData.openAt1 eq 'B'}">checked="checked"</c:if> value="B" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">새 탭 오픈</label>
			</td>
        </tr>
		<tr>
			<th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey2" name="paramKey2" vali-text="제목을 입력해주세요." value="${resultData.title1}" style="width: 100%;" maxlength="50"/>
			</td>
		</tr>
		<tr>
			<th scope="row">링크 URL <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey3" name="paramKey3" vali-text="링크 URL을 입력해주세요." value="${resultData.url1}" style="width: 100%;" />
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
<div class="caption_title">· 홍보동영상 2</div>
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
        <tr>
			<th scope="row">URL 오픈방식 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey4_1" name="paramKey4" <c:if test="${resultData.openAt2 eq 'A' or vo.act eq 'regist'}">checked="checked"</c:if> value="A" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey4_1">현재창 이동</label>
             	<input type="radio" id="paramKey4_2" name="paramKey4" <c:if test="${resultData.openAt2 eq 'B'}">checked="checked"</c:if> value="B" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey4_2">새 탭 오픈</label>
			</td>
        </tr>
		<tr>
			<th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey5" name="paramKey5" vali-text="제목을 입력해주세요." value="${resultData.title2}" style="width: 100%;" maxlength="50"/>
			</td>
		</tr>
		<tr>
			<th scope="row">링크 URL <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey6" name="paramKey6" vali-text="링크 URL을 입력해주세요." value="${resultData.url2}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">이미지 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali2" name="fileVali2" class="check custom" vali-text="이미지를 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList2', 1, 'png,jpg,jpeg', 100, 'MB', true, fileList2)}" escapeXml="false"/>
				<div style="margin-top:5px; ">
                    <label for="fileVali2" style="color: gray; font-size: 14px;">※ 이미지 사이즈(가로1903px; 세로 350px;)</label>	
                </div>
			</td>
		</tr>
	</tbody>
</table>
<div class="caption_title">· 홍보동영상 3</div>
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
        <tr>
			<th scope="row">URL 오픈방식 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="radio" id="paramKey7_1" name="paramKey7" <c:if test="${resultData.openAt3 eq 'A' or vo.act eq 'regist'}">checked="checked"</c:if> value="A" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey7_1">현재창 이동</label>
             	<input type="radio" id="paramKey7_2" name="paramKey7" <c:if test="${resultData.openAt3 eq 'B'}">checked="checked"</c:if> value="B" vali-text="URL 오픈방식을 선택해주세요."><label style="margin-left: 10px" for="paramKey7_2">새 탭 오픈</label>
			</td>
        </tr>
		<tr>
			<th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey8" name="paramKey8" vali-text="제목을 입력해주세요." value="${resultData.title3}" style="width: 100%;" maxlength="50"/>
			</td>
		</tr>
		<tr>
			<th scope="row">링크 URL <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey9" name="paramKey9" vali-text="링크 URL을 입력해주세요." value="${resultData.url3}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">이미지 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali3" name="fileVali3" class="check custom" vali-text="이미지를 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList3', 1, 'png,jpg,jpeg', 100, 'MB', true, fileList3)}" escapeXml="false"/>
				<div style="margin-top:5px; ">
                    <label for="fileVali3" style="color: gray; font-size: 14px;">※ 이미지 사이즈(가로1903px; 세로 350px;)</label>	
                </div>
			</td>
		</tr>
	</tbody>
</table>
<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn"><c:out value="저장"/></a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->
