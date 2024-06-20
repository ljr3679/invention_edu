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
	
	function fn_email_check(email) { 
		if(!/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g.test(email)) return false;
	    else return true;
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
			<th scope="row">년도 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey1" name="paramKey1" class="join_select1" vali-text="년도를 선택해주세요." style="width:150px;">
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
				<select id="paramKey2" name="paramKey2" class="join_select1" vali-text="지역을 선택해주세요." style="width:150px;">
					<option value="">전체</option> 
					<c:forEach items="${region}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.regionRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">구분 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey3" name="paramKey3" class="join_select1" vali-text="구분을 선택해주세요." style="width:150px;">
					<option value="">전체</option> 
					<c:forEach items="${type}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.typeRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">접수번호 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey4" name="paramKey4" vali-text="접수번호를 입력해주세요." value="${resultData.regNo}" style="width: 450px;" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');"/>
			</td>
		</tr>
		<tr>
			<th scope="row">발명명칭 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey5" name="paramKey5" vali-text="발명명칭을 입력해주세요." value="${resultData.title}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">발명동기</th>
			<td style="width: 100%; height: 300px; resize: none;">
				<textarea id="paramKey6" name="paramKey6" editor="Y" class="unCheck" style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.invention}" escapeXml="false"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">발명내용</th>
			<td style="width: 100%; height: 300px; resize: none;">
				<textarea id="paramKey7" name="paramKey7" editor="Y" class="unCheck" style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.content}" escapeXml="false"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">대표 이미지 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali2" name="fileVali2" class="check custom" vali-text="대표 이미지를 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList2', 1, 'png,jpg,jpeg', 100, 'MB', true, fileList2)}" escapeXml="false"/>
				<!-- <div style="margin-top:5px; ">
                    <label for="fileVali1" style="color: gray; font-size: 14px;">※ 첨부파일은 최대 1개 5MB이하 jpg, png, jpeg, gif, tiff, bmp 확장자만 등록 가능합니다.</label>	
                </div> -->
			</td>
		</tr>
		<tr>
			<th scope="row">이미지 등록 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="이미지를 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList1', 15, 'png,jpg,jpeg', 1, 'GB', true, fileList1)}" escapeXml="false"/>
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
