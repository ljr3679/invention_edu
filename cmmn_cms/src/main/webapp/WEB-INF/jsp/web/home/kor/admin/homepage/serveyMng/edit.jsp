<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	$('#add_form_btn').on('click', function() {
		$('#sub_add_type').find('option').eq(0).prop('selected', true);
		$('#sub_add_option_data').find('option').eq(0).prop('selected', true);
		
		$('#sub_add_type').trigger('change');
		$('#sub_add_option_data').trigger('change');
	});
	
	function fn_sub_delete(obj) {
		$(obj).parent().parent().next().remove();
		$(obj).parent().parent().remove();
	}
	
	function fn_remove(obj) {
		if(confirm('삭제 하시겠습니까?')) {
			$('#act').val('delete');
			$('#cmmnForm').attr('action', '${selfPath}edit.act');
			$('#cmmnForm').submit();
		}
	}
	
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
		});
		
		$('#addArea').html('');
		
		if(fn_validation_check($('#cmmnForm'))) {
			var html = '';
			var dumy = $('input[name=dumyList]');
			var totalScore = 0;
			if(dumy.length == 0){
				alert("설문을 하나이상 등록해주세요.")
				return false;
			}
		      
			for(var i=1; i<=dumy.length; i++) {
				var type = $('input[name=paramKeyList2').eq(i-1).val();
				var idx = dumy.eq(i-1).val();
				
				var textObjs = $('input:text[name=surveyTx'+idx+']'); 
				var txt = '';
				
				switch (type) {
					case 'A':
						$.each(textObjs, function(index, data) {
							txt += $(data).val();
							if(textObjs.length-1 != index) txt += '[-g-]';
						});
						html += '<input type="hidden" name="paramKeyList5" value="'+txt+'" />';
						break;
					case 'B':
						html += '<input type="hidden" name="paramKeyList5" value="-1" />';
						break;
				}
			}
			$('#addArea').append(html);
			
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg+' 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}
	}
	
	function fn_cancel() {
		$('#act').val('');
		$('#idx').val('');
		$('#cmmnForm').attr('action', '${selfPath}index.do');
		$('#cmmnForm').submit();
	}
	
	function fn_sub_add_type(val) {
		if(val != 'A') $('#sub_add_option').hide();
		else $('#sub_add_option').show();
	}
	
	var surveyCnt = parseInt("${fn:length(resultSubDataList)}")+1;
	function fn_add_sub_data() {
		var sub_add_type = $('#sub_add_type').val();
		var sub_add_option = $('#sub_add_option_data').val();

		var html = '';
		html += '<tr>';
		html += '	<th scope="row">설문내용'+surveyCnt+'</th>';
		html += '	<td colspan="3">';
		html += '		<input type="hidden" name="dumyList" value="'+surveyCnt+'"/>';
		html += '		<input type="hidden" name="paramKeyList1" value="-1"/>';
		html += '		<input type="hidden" name="paramKeyList2" value="'+sub_add_type+'"/>';
		html += '		<input type="text" id="paramKeyList3" name="paramKeyList3" style="width: 100%;" vali-text="설문'+surveyCnt+' 내용을 입력해주세요."/>';
		html += '	</td>';
		html += '	<td rowspan="2"><a onClick="fn_sub_delete(this);" style="cursor:pointer" class="btn delete">삭제</a></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<th scope="row">설문답변'+surveyCnt+'</th>';
		
		switch (sub_add_type) {
			case 'A':
				html += '	<td colspan="3">';
				for(var i=1; i<=parseInt(sub_add_option); i++) {
				html += '		<input type="radio" class="an_radio unCheck"/>';
				html += '		<input type="text" id="surveyTx'+surveyCnt+'_'+i+'_tx" name="surveyTx'+surveyCnt+'" style="width: 100px;" vali-text="답변'+surveyCnt+' 항목을 입력해주세요."/>';
				}
				html += '	</td>';
				break;
			case 'B':
				html += '	<td colspan="3">입력형(500자까만 입력)<input type="hidden" name="surveyTx'+surveyCnt+'" value="-1"/></td>';
				break;
		}
		html += '</tr>';
		
		surveyCnt++;
		$('#tableBody').append(html);
		fn_layer_close();
	}
</script>
<style>
	.an_radio {
		margin-left: 10px;
		margin-right: 10px !important;
	}
</style>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex" />
<form:hidden path="searchKeyword" />
<div id="addArea"></div>

	<!-- button -->
	<div class="clearfix">
	<c:choose>
		<c:when test="${vo.act eq 'regist'}">
		<div class="fr">
			<a id="add_form_btn" onClick="fn_layer_open();" style="cursor:pointer" class="fr_btn">추가</a>
		</div>
		</c:when>
	</c:choose>
	</div>
	<!-- // button -->
	
<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:40%;">
		<col style="width:20%;">
		<col style="width:10%;">
		<col style="width:10%;">
	</colgroup>
	<tbody id="tableBody">
		<tr>
			<th scope="row">공개여부 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="4">
				<input type="radio" vali-text="공개여부를 선택해주세요." name="paramKey6" id="paramKey6_a" value="Y" onchange="informationCheck(this);" <c:if test="${resultData.useAt eq 'Y'}">checked="checked"</c:if> />
				<label for="paramKey6_a">공개</label>
				<input type="radio" vali-text="공개여부를 선택해주세요." name="paramKey6" id="paramKey6_b" value="N" onchange="informationCheck(this);" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> />
				<label for="paramKey6_b">비공개</label>
			</td>
		</tr>
		<tr>
			<th scope="row">타입 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="4">
				<input type="radio" vali-text="공개여부를 선택해주세요." name="paramKey11" id="paramKey11_1" value="A" <c:if test="${resultData.memberType eq 'A'}">checked="checked"</c:if> />
				<label for="paramKey11_1">회원</label>
				<input type="radio" vali-text="공개여부를 선택해주세요." name="paramKey11" id="paramKey11_2" value="B" <c:if test="${resultData.memberType eq 'B'}">checked="checked"</c:if> />
				<label for="paramKey11_2">전체</label>
			</td>
		</tr>
		<tr>
			<th scope="row">설문기간 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="4">
				<input type="text" id="paramKey8" name="paramKey8" value="${resultData.surveyStartDate}" onChange="datepicker_start('paramKey8','paramKey9')" vali-text="설문기간 시작일을 입력해주세요." class="datepicker"  style="width: 15%; cursor: pointer;" readonly="readonly"/>
				&nbsp;~&nbsp;
				<input type="text" id="paramKey9" name="paramKey9" value="${resultData.surveyEndDate}" onChange="datepicker_start('paramKey8','paramKey9')" vali-text="설문기간 종료일을 입력해주세요." class="datepicker"  style="width: 15%; cursor: pointer;" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="4"><input type="text" id="title" name="title" value="${resultData.title}" vali-text="제목을 입력해주세요." style="width: 100%;"/></td>
		</tr>
		
		<tr>
			<th scope="row">내용 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="4">
				<textarea id="paramKey10" name="paramKey10" style="width: 100%; height: 250px;" editor="Y" vali-text="내용을 입력해주세요."><c:out value="${resultData.content}"/></textarea>
			</td>
		</tr>
		
		<c:forEach items="${resultSubDataList}" var="list" varStatus="status">
		<tr>
			<th scope="row">설문${status.count}</th>
			<td colspan="3">
				<input type="hidden" name="dumyList" value="${status.count}"/>
				<input type="hidden" name="paramKeyList1" value="${list.no}"/>
				<input type="hidden" name="paramKeyList2" value="${list.surveyType}"/>
				
				<input type="text" id="paramKeyList3" name="paramKeyList3" value="${list.surveyTitle}" style="width: 100%;"/>
			</td>
			<td rowspan="2">
			<c:choose>
				<c:when test="${vo.act eq 'regist'}">
				<a onClick="fn_sub_delete(this);" style="cursor:pointer" class="btn delete">삭제</a>
				</c:when>
			</c:choose>
			</td>
		</tr>
		<tr>
			<th scope="row">답변${status.count}</th>
			<c:choose>
				<c:when test="${list.surveyType eq 'A'}">
					<c:set var="surveyText" value="${fn:split(list.surveyText,'[-g-]')}" />
					
					<td colspan="3">
					<c:forEach items="${surveyText}" var="list2" varStatus="status2">
						<input type="radio" class="an_radio unCheck"/>
						<input type="text" name="surveyTx${status.count}" style="width: 100px;" value="${list2}"/>
	  				</c:forEach>
					</td>
				</c:when>
				<c:when test="${list.surveyType eq 'B'}">
					<td colspan="3">
						입력형(500자까만 입력)
						<input type="hidden" name="surveyTx${status.count}" value="-1"/>
					</td>
				</c:when>
			</c:choose>
		</tr>
		</c:forEach>
	</tbody>
</table>
<!-- // board_write -->
<div class="btn_wrap">
	<a onClick="fn_edit();" style="cursor: pointer;" class="btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
	<c:if test="${vo.act eq	'modify'}"><a onclick="fn_remove();" style="cursor: pointer;" class="right btn delete">삭제</a></c:if>
	<a onClick="fn_cancel();" style="cursor: pointer;" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->		


	<!-- Start : layer-popup content -->
	<div id="layer" class="layer-wrap">
	    <div class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <!--content //-->
	                <h1 class="pop-layer-title">- 설문 폼 -</h1>
	                <table class="board_write basic">
	                	<colgroup>
							<col style="width:120px;">
							<col style="width:250px;">
						</colgroup>
						<tbody>
		                	<tr>
		                		<th scope="row">형식</th>
		                		<td>
		                			<select class="join_select1" style="width: 100%;" id="sub_add_type" onChange="fn_sub_add_type(this.value);">
		                				<option value="A">선택형</option>
		                				<option value="B">입력형</option>
		                			</select>
		                		</td>
		                	</tr>
		                	<tr id="sub_add_option">
		                		<th scope="row">답변항목</th>
		                		<td>
		                			<select id="sub_add_option_data" class="join_select1" style="width: 100%;">
		                				<c:forEach begin="1" end="6" var="list">
		                					<option value="${list}"><c:out value="${list}개" /></option>
		                				</c:forEach>
		                			</select>
		                		</td>
		                	</tr>
	                	</tbody>
	                </table>
	                <div class="btn-r">
	                    <a href="#" onClick="fn_add_sub_data();" class="btn-layerClose">등록</a>
	                    <a href="#" onClick="fn_layer_close();" class="btn-layerClose">닫기</a>
	                </div>
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End : layer-popup content -->	
</body>
<!-- header end -->