<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('#paramKey11').html(CKEDITOR.instances.paramKey11.getData());
			$('#paramKey12').html(CKEDITOR.instances.paramKey12.getData());
			$('#paramKey13').html(CKEDITOR.instances.paramKey13.getData());
		});
		
		if($('#paramKey4').val() == '' || $('#paramKey4').val() == 'null') {
			$('#paramKey4 option:selected').val('0');
			$('#paramKey4').val('0');
		}
		alert($('#paramKey4').val());
		if(fn_validation_check($('#cmmnForm'),fn_custom_vali)) {
			if(confirm('저장 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');

				//$('#cmmnForm').submit();
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
	/* $(document).ready(function(){
		fn_type_init();
	}); */
	function fn_type_init() {
		fn_cmmn_ajax("${vo.selfPath}type_init.ajax", false, {'parent':$( "#paramKey3 option:selected" ).val()}, 'json', function(res) {
			if(res) {
				var result = res.result;
				var categoryList = res.categoryList;
				var msg = res.msg;
				switch (result) {
				case '400': alert(msg); break;
				case '200' :
					var s_html = "<option value=''>선택</option>";
					if(categoryList.length > 0) {
						for(var i=0; i<categoryList.length; i++) {
							var d = categoryList[i];
							if($('#typeNo').val() == d.no) {
								s_html += '<option value="'+d.no+'" selected>'+d.dataName+'</option>';
							} else {
								s_html += '<option value="'+d.no+'">'+d.dataName+'</option>';
							}
						}
					}
					$("#paramKey4").html(s_html);
					$("#paramKey4").select2();
				return; break;
				case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
				}
			}
		});
	}
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="searchValue1" /> 
<form:hidden path="searchValue2" /> 
<form:hidden path="searchValue3" /> 
<form:hidden path="searchValue4" /> 
<form:hidden path="searchValue5" /> 
<form:hidden path="searchKeyword" /> 
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
			<th scope="row">수상년도 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey2" name="paramKey2" class="join_select1" vali-text="수상년도를 선택해주세요." style="width:150px;">
					<c:forEach items="${yearList}" var="value" varStatus="status">
						<option value="${value}"<c:if test="${resultData.year eq value}">selected="selected"</c:if>>${value}</option>
					</c:forEach>
				</select>
			</td>
        </tr>
        <tr>
			<th scope="row">분류/상격 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey3" name="paramKey3" class="join_select1" vali-text="분류/상격을 선택해주세요." style="width:150px;" onchange="fn_type_init();">
					<c:forEach items="${parent}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.parentRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
				<select id="paramKey4" name="paramKey4" class="join_select1 unCheck" style="width:150px;">
					<c:forEach items="${categoryList2}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.typeRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
        </tr>
        <tr>
			<th scope="row">학교구분  <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey5" name="paramKey5" class="join_select1" vali-text="학교구분을 선택해주세요." style="width:150px;">
					<c:forEach items="${school}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.schoolRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
        </tr>
        <tr>
			<th scope="row">기술구분  <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey6" name="paramKey6" class="join_select1" vali-text="기술구분을 선택해주세요." style="width:150px;">
					<c:forEach items="${tech}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${resultData.techRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
			</td>
        </tr>
		<tr>
			<th scope="row">학교명 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey7" name="paramKey7" vali-text="학교명을 입력해주세요." value="${resultData.schoolName}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">지도교사 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey8" name="paramKey8" vali-text="지도교사를 입력해주세요." value="${resultData.teacher}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">수상자 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey9" name="paramKey9" vali-text="수상자를 입력해주세요." value="${resultData.winner}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey10" name="paramKey10" vali-text="제목을 입력해주세요." value="${resultData.title}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
		<tr>
			<th scope="row">발명동기 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td style="width: 100%; height: 300px; resize: none;">
				<textarea id="paramKey11" name="paramKey11" editor="Y" vali-text="발명동기을 입력해주세요." style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.intention}" escapeXml="false"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">발명내용 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td style="width: 100%; height: 300px; resize: none;">
				<textarea id="paramKey12" name="paramKey12" editor="Y" vali-text="발명내용을 입력해주세요." style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.content}" escapeXml="false"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">용도 및 효과 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td style="width: 100%; height: 300px; resize: none;">
				<textarea id="paramKey13" name="paramKey13" editor="Y" vali-text="용도 및 효과를 입력해주세요." style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.purpose}" escapeXml="false"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">유튜브ID <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> 
			<td>
				<input type="text" id="paramKey14" name="paramKey14" vali-text="유튜브ID를 입력해주세요." value="${resultData.youtube}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">썸네일 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="썸네일을 업로드해주세요."/>
				<c:out value="${cFn:kssFileInclude('fileDataList1', 1, 'png,jpg,jpeg', 100, 'MB', true, fileList1)}" escapeXml="false"/>
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
</body>
<!-- header end -->
