<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	var textField = new Array();
	var textareaField = new Array();
	var dateField = new Array();
	var dateArrayField = new Array();
	var categoryField = new Array();
	
	var usedField = new Array();
	$.each($('.textField'), function(index, item) {usedField.push($(item).val());});
	$.each($('.textareaField'), function(index, item) {usedField.push($(item).val());});
	$.each($('.dateField'), function(index, item) {usedField.push($(item).val());});
	$.each($('.dateArrayField'), function(index, item) {usedField.push($(item).val());});
	$.each($('.categoryField'), function(index, item) {usedField.push($(item).val());});
	
	if(usedField.length > 0)  {
		var top_idx = 0;
		var splice_idx = 0;
		var tmp_arr;
		for(var i=1; i<=15; i++) {
			if(usedField.indexOf('textField'+i) == -1) textField.push('textField'+i);
			else {
				top_idx = top_idx > i ?top_idx :i;
				splice_idx += 1;
			}
		}
		tmp_arr = textField.splice(0, (top_idx - splice_idx));
		textField = textField.concat(tmp_arr);
		top_idx = 0;
		splice_idx = 0;
		tmp_arr = null;
		
		for(var i=1; i<=5; i++) {
			if(usedField.indexOf('textareaField'+i) == -1) textareaField.push('textareaField'+i);
			else {
				top_idx = top_idx > i ?top_idx :i;
				splice_idx += 1;
			}
		}
		tmp_arr = textareaField.splice(0, (top_idx - splice_idx));
		textareaField = textareaField.concat(tmp_arr);
		top_idx = 0;
		splice_idx = 0;
		tmp_arr = null;
		
		for(var i=1; i<=4; i++) {
			if(usedField.indexOf('dateField'+i) == -1) dateField.push('dateField'+i);
			else {
				top_idx = top_idx > i ?top_idx :i;
				splice_idx += 1;
			}
		}
		tmp_arr = dateField.splice(0, (top_idx - splice_idx));
		dateField = dateField.concat(tmp_arr);
		top_idx = 0;
		splice_idx = 0;
		tmp_arr = null;
		
		for(var i=1; i<=2; i++) {
			if(usedField.indexOf('dateArrayField'+i) == -1) dateArrayField.push('dateArrayField'+i);
			else {
				top_idx = top_idx > i ?top_idx :i;
				splice_idx += 1;
			}
		}
		tmp_arr = dateArrayField.splice(0, (top_idx - splice_idx));
		dateArrayField = dateArrayField.concat(tmp_arr);
		top_idx = 0;
		splice_idx = 0;
		tmp_arr = null;
		
		for(var i=1; i<=4; i++) {
			if(usedField.indexOf('categoryField'+i) == -1) categoryField.push('categoryField'+i);
			else {
				top_idx = top_idx > i ?top_idx :i;
				splice_idx += 1;
			}
		}
		tmp_arr = categoryField.splice(0, (top_idx - splice_idx));
		categoryField = categoryField.concat(tmp_arr);
		top_idx = 0;
		splice_idx = 0;
		tmp_arr = null;
	} else {
		for(var i=1; i<=15; i++) textField.push('textField'+i);
		for(var i=1; i<=5; i++) textareaField.push('textareaField'+i);
		for(var i=1; i<=4; i++) dateField.push('dateField'+i);
		for(var i=1; i<=2; i++) dateArrayField.push('dateArrayField'+i);
		for(var i=1; i<=4; i++) categoryField.push('categoryField'+i);
	}
	
	$('.add_config').on('click', function() {
		var name;
		switch ($('.add_config').index($(this))) {
			case 0:name = textField.shift();break;
			case 1:name = textareaField.shift();break;
			case 2:name = dateField.shift();break;
			case 3:name = dateArrayField.shift();break;
			case 4:name = categoryField.shift();break;
		}
		
		if(name) {
			$('#config_body').append(getConfigHtml(name));
			$('.category_select').select2();
		}
		else alert($(this).attr('config_type')+'필드를 더 이상 추가할 수 없습니다.');
	});
	
	function getConfigHtml(name, data) {
		var config_title = '';
		var cateName = '';
		var cateOptionName = '';
		if(name.indexOf('textField') != -1) config_title = 'input';
		else if(name.indexOf('textareaField') != -1) config_title = 'textarea';
		else if(name.indexOf('dateField') != -1) config_title = '날짜';
		else if(name.indexOf('dateArrayField') != -1) config_title = '기간';
		else if(name.indexOf('categoryField') != -1) {
			config_title = '카테고리';
			var num = (parseInt(name.substring(13, name.length))-1)*2;
			cateName = 'paramKey3'+num;
			cateOptionName = 'paramKey3'+(num+1);
		}
		
		var html = '';
		html += '<tr config="'+name+'">';
		html += '	<td>';
		html += '		<div style="display: inline-block; margin-bottom: 5px; width: 100%;">'+config_title;
		html += '			<span style="float: right;">';
		html += '				<input name="field_vali" type="checkbox" value="Y" class="unCheck" id="vali_'+name+'"/>';
		html += '				<label for="vali_'+name+'">입력 필수여부</label>';
		html += '			</span>';
		html += '		</div>';
		if(name.indexOf('categoryField') != -1) {
		html += '		<input name="paramKeyList2" type="text" style="width: 100%; margin-bottom: 5px;" value="" placeholder="필드명" id="title_'+name+'" vali-text="필드명을 입력해주세요."/>';
		html +=	'		<select id="cate_'+name+'" name="'+cateName+'" class="join_select1 category_select" style="width:49%;" vali-text="카테고리 그릅을 선택해주세요.">';
		html += '			<option value="">-카테고리 그룹-</option>';
		<c:forEach items="${categoryList}" var="category" varStatus="status">
		html += '			<option value="${category.categoryCode}">${category.categoryName}</option>';
		</c:forEach>
		html += '		</select>';
		html += '		<select id="cate_option_'+name+'" name="'+cateOptionName+'" class="join_select1 category_select" style="width:49%;" vali-text="카테고리 노출 유형을 선택해주세요.">';
		html += '			<option value="">-카테고리 유형-</option>';
		html += '			<option value="S">셀렉트박스</option>';
		html += '			<option value="R">라디오버튼</option>';
//		html += '			<option value="C">체크박스</option>';
		html += '		</select>';
		} else {
		html += '		<input name="paramKeyList2" type="text" style="width: 100%;" value="" placeholder="필드명" id="title_'+name+'" vali-text="필드명을 입력해주세요."/>';
		}
		html += '	</td>';
		
// 		if(name.indexOf('dateField') != -1 || name.indexOf('dateArrayField') != -1) {
// 		html += '	<td>해당없음</td>';	
// 		} else {
		html += '	<td><input name="field_search" type="checkbox" value="Y" class="unCheck" id="search_'+name+'"/><label for="search_'+name+'">검색 허용여부</label></td>';	
// 		}
		
		html += '	<td>';
		html += '		<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_'+name+'"/><label for="list_view_'+name+'">리스트 노출여부</label>';
		html += '		<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" value="" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />';
		html += '		<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" value="" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />';
		html += '		<div class="field_list_class_area"></div>';
		html += '	</td>';
		html += '	<td style="text-align: center;">';
		html += '		<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>';
		html += '		<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>';
		html += '	</td>';
		html += '	<td><a onClick="fn_remove(this);" style="cursor: pointer;">X</a></td>';
		html += '</tr>';
		
		return html;
	}
	
	function fn_list_view(obj) {
		var indexField = $('input[name="field_list_view"]').index(obj);
		
		if($(obj).prop('checked')) {
			$(obj).next().next().removeAttr('disabled');
			$(obj).next().next().next().removeAttr('disabled');
			
			$('.field_list_class_area').eq(indexField).html('<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="" placeholder="클래스명" class="unCheck">');
		} else {
			$(obj).next().next().val('');
			$(obj).next().next().attr('disabled', 'disabled');
			$(obj).next().next().next().val('');
			$(obj).next().next().next().attr('disabled', 'disabled');
			
			$('.field_list_class_area').eq(indexField).html('');
		}
	}
	
	function fn_sort(obj, type) {
		var tr = $(obj).parent().parent();
		switch (type) {
			case 1:
				if(tr.prev().attr('config') == 'regDate') alert('최상단입니다.');
				else tr.prev().before(tr);
			break;
			case 2:
				if($('#config_body').find('tr').length-1 == $('#config_body').find('tr').index(tr)) alert('최하단입니다.');
				else tr.next().after(tr);
			break;
		}
	}
	
	function fn_remove(obj) {
		$(obj).parent().parent().remove();
	}
	
	$('input[name=paramKey8]').on('change', function() {
		switch ($(this).val()) {
			case 'Y':
				var html ='';
				html += '<div id="paging_option" style="margin-top: 10px;">';
				html += '	<select name="paramKey9" id="paramKey9" class="join_select1" style="width: 150px;" vali-text="게시물 노출 갯수를 선택해주세요.">';
				html += '		<option value="">게시물 노출 갯수</option>';
				for(var i=1; i<100; i++) {
				html += '		<option value="'+i+'">'+i+'개</option>';	
				}
				html += '	</select>';
				html += '</div>';
				$('#paging_area').append(html);
				$('#paramKey9').select2();
				break;
			case 'N':
				$('#paging_option').remove();
				break;
		}
	});
	
	$('#paramKey10').on('change', function() {
		if($(this).val() > 0 && $('tr[config=attachFile]').length == 0) {
			var html = '';
			html += '<tr config="attachFile">';
			html += '	<td>';
			html += '		<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="첨부파일"/>';
			html += '			<span style="float: right;">';
			html += '				<input name="field_vali" type="checkbox" value="Y" class="unCheck" id="vali_attach_file"/><label for="vali_attach_file">입력 필수여부</label>';
			html += '			</span>';
			html += '		</div>';
			html += '		<input type="hidden" name="paramKeyList2" value="첨부파일"/>';
			html += '	</td>';
			html += '	<td>';
			html += '		해당없음';
			html += '	</td>';
			html += '	<td>';
			html += '		<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_attach_file"/><label for="list_view_attach_file">리스트 노출여부</label>';
			html += '		<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />';
			html += '		<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />';
			html += '		<div class="field_list_class_area"></div>';
			html += '	</td>';
			html += '	<td style="text-align: center;">';
			html += '		<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>';
			html += '		<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>';
			html += '	</td>';
			html += '	<td style="text-align: center;">';
			html += '		-';
			html += '	</td>';
			html += '</tr>';
			
			$('#config_body').append(html);
		} else if($(this).val() == 0 && $('tr[config=attachFile]').length != 0) {
			$('tr[config=attachFile]').remove();
		}
	});
	
	$('input[name=paramKey5]').on('change', function() {
		var data = $(this).val();
		if(data == 'Y' && $('tr[config=answerAt]').length == 0) {
			var html = '';
			html += '<tr config="answerAt">';
			html += '	<td>';
			html += '		<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="답변여부"/>';
			html += '			<span style="float: right;">';
			html += '				<input name="field_vali" type="checkbox" value="Y" class="unCheck" id="vali_attach_file"/><label for="vali_attach_file">입력 필수여부</label>';
			html += '			</span>';
			html += '		</div>';
			html += '		<input type="hidden" name="paramKeyList2" value="답변여부"/>';
			html += '	</td>';
			html += '	<td>';
			html += '		해당없음';
			html += '	</td>';
			html += '	<td>';
			html += '		<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_attach_file"/><label for="list_view_attach_file">리스트 노출여부</label>';
			html += '		<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />';
			html += '		<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />';
			html += '		<div class="field_list_class_area"></div>';
			html += '	</td>';
			html += '	<td style="text-align: center;">';
			html += '		<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>';
			html += '		<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>';
			html += '	</td>';
			html += '	<td style="text-align: center;">';
			html += '		-';
			html += '	</td>';
			html += '</tr>';
			
			$('#config_body').append(html);
		} else if($('tr[config=answerAt]').length != 0) {
			$('tr[config=answerAt]').remove();
		}
	});
	
	function fn_edit() {
		var html = '';
		$.each($('tr[config]'), function(index, item) {
			html += '<input type="hidden" name="paramKeyList1" value="'+$(item).attr('config')+'"/>';
			html += '<input type="hidden" name="paramKeyList3" value="'+($('input[name=field_vali]').eq(index).prop('checked') ?'Y' :'N')+'"/>';
		});
		
		$.each($('input[name=field_search]:checked'), function(index, item) {
			html += '<input type="hidden" name="paramKeyList4" value="'+$(item).parent().parent().attr('config')+'"/>';
			html += '<input type="hidden" name="paramKeyList5" value="'+$(item).parent().prev().children().eq(1).val()+'"/>';
		});
		
		var list_view_field = [];
		var list_view_title = [];
		var list_view_percent = [];
		var list_view_class = [];
		$.each($('input[name=field_list_view]:checked'), function(index, item) {
			list_view_field[$(item).next().next().val()-1] = $(item).parent().parent().attr('config'); 
			list_view_title[$(item).next().next().val()-1] = $(item).parent().prev().prev().children().eq(1).val();
			list_view_percent[$(item).next().next().val()-1] = $(item).next().next().next().val();
			list_view_class[$(item).next().next().val()-1] = $(item).next().next().next().next().children().val();
		});
		
		var type = 0;
		var sum = 0;
		$.each(list_view_field, function(index, item) {
			if(!item) {
				type = 1;
			}
			sum += parseInt(list_view_percent[index]);
			html += '<input type="hidden" name="paramKeyList6" value="'+item+'"/>';
			html += '<input type="hidden" name="paramKeyList7" value="'+list_view_title[index]+'"/>';
			html += '<input type="hidden" name="paramKeyList8" value="'+list_view_percent[index]+'"/>';
			html += '<input type="hidden" name="paramKeyList9" value="'+list_view_class[index]+'"/>';
		});
		
		if(fn_validation_check($('#cmmnForm'))) {
			if(type) {
				alert('순번을 정확히 입력해주세요.');
				return;
			} else if(sum > 100) {
				alert('리스트 노출 넓이는 총 100%입니다.');
				return;
			}
			
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg+' 하시겠습니까?')) {
				$('#add_field_list').html(html);
				//oEditors.getById["paramKey19"].exec("UPDATE_CONTENTS_FIELD", []);
				//oEditors.getById["paramKey20"].exec("UPDATE_CONTENTS_FIELD", []);
				$('#paramKey19').val(CKEDITOR.instances.paramKey19.getData());
				$('#paramKey20').val(CKEDITOR.instances.paramKey20.getData());
				
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}	
		}
	}
	
	function fn_cancel() {
		$('#act').val('');
		$('#idx').val('');
		$('#cmmnForm').attr('action', '${vo.selfPath}boardMng.do');
		$('#cmmnForm').submit();
	}
	
</script>
<script type="text/javascript" src="/js/osmplayer.compressed.js"></script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="act"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchKeyword"/>
<input type="hidden" name="board_code" value="${resultData.boardCode}"/>
<div id="add_field_list">
</div>
	<table class="board_write basic">
		<caption>게시판 등록 정보</caption>
		<colgroup>
			<col style="width: 20%;">
			<col style="width: 40%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">등록자</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}"><c:out value="${admSession.name} [${admSession.id}]"/></c:when>
						<c:otherwise><c:out value="${resultData.registerName} [${resultData.registerId}]"/></c:otherwise>
					</c:choose>
					</p>
				</td>
				<th scope="row">등록일</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
							<c:out value="${sysYear}"/>
						</c:when>
						<c:otherwise><c:out value="${resultData.regDate}"/></c:otherwise>
					</c:choose>
					</p>
				</td>
			</tr>
			<tr>
				<th scope="row">수정자</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">-</c:when>
						<c:when test="${vo.act eq 'modify' and empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modifierName} [${resultData.modifierId}]"/></c:otherwise>
					</c:choose>
					</p>
				</td>
				<th scope="row">수정일</th>
				<td>
					<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">-</c:when>
						<c:when test="${vo.act eq 'modify' and empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modDate}"/></c:otherwise>
					</c:choose>
					</p>
				</td>
			</tr>
			
			<tr>
				<th scope="row">게시판 이름<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
				<td colspan="3">
					<input id="title" name="title" type="text" style="width: 30%;" vali-text="게시판 이름을 입력하여 주십시오." maxlength="100" value="${vo.act eq 'regist' ?'' :resultData.title}" />
				</td>
			</tr>
			
			<tr>
				<th scope="row">게시판 스킨<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
				<td colspan="3">
					<div class="on_iblock" style="margin-right: 20px;">
						<input type="radio" name="paramKey1" <c:if test="${resultData.boardSkin eq 'board'}">checked="checked"</c:if> id="radio_board" value="board" style="cursor:pointer" vali-text="게시판 스킨을 선택해주세요." /><label for="radio_board">일반형</label>
					</div>
					<div class="on_iblock" style="margin-right: 20px;">
						<input type="radio" name="paramKey1" <c:if test="${resultData.boardSkin eq 'notice'}">checked="checked"</c:if> id="radio_notice" value="notice" style="cursor:pointer" /><label for="radio_notice">공지형</label>
					</div>					
					<div class="on_iblock" style="margin-right: 20px;">
						<input type="radio" name="paramKey1" <c:if test="${resultData.boardSkin eq 'media'}">checked="checked"</c:if> id="radio_media" value="media" style="cursor:pointer" /><label for="radio_media">미디어</label>
					</div>					
					<div class="on_iblock" style="margin-right: 20px;">
						<input type="radio" name="paramKey1" <c:if test="${resultData.boardSkin eq 'faq'}">checked="checked"</c:if> id="radio_faq" value="faq" style="cursor:pointer" /><label for="radio_faq">FAQ</label>
					</div>
					<div class="on_iblock" style="margin-right: 20px;">
						<input type="radio" name="paramKey1" <c:if test="${resultData.boardSkin eq 'link'}">checked="checked"</c:if> id="radio_link" value="link" style="cursor:pointer" /><label for="radio_link">링크</label>
					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">게시판 권한</th>
				<td colspan="3">
					<table class="board_write basic">
						<tr>
							<th scope="row" style="width:17%">쓰기권한<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
							<td>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey2" <c:if test="${resultData.registAuth eq 'E'}">checked="checked"</c:if> id="paramKey2_1" value="E" style="cursor:pointer" vali-text="게시판 작성 권한을 선택해주세요." /><label for="paramKey2_1">비회원</label>
								</div>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey2" <c:if test="${resultData.registAuth eq 'U'}">checked="checked"</c:if> id="paramKey2_2" value="U" style="cursor:pointer" /><label for="paramKey2_2">회원</label>
								</div>					
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey2" <c:if test="${resultData.registAuth eq 'A'}">checked="checked"</c:if> id="paramKey2_3" value="A" style="cursor:pointer" /><label for="paramKey2_3">관리자</label>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row" style="width:17%">VIEW 권한<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
							<td>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey3" <c:if test="${resultData.viewAuth eq 'E'}">checked="checked"</c:if> id="paramKey3_1" value="E" style="cursor:pointer" vali-text="게시판 VIEW 권한을 선택해주세요." /><label for="paramKey3_1">비회원</label>
								</div>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey3" <c:if test="${resultData.viewAuth eq 'U'}">checked="checked"</c:if> id="paramKey3_2" value="U" style="cursor:pointer" /><label for="paramKey3_2">회원</label>
								</div>					
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey3" <c:if test="${resultData.viewAuth eq 'A'}">checked="checked"</c:if> id="paramKey3_3" value="A" style="cursor:pointer" /><label for="paramKey3_3">관리자</label>
								</div>
							</td>
						</tr>
						
					</table>
				</td>
			</tr>
			
			<tr>
				<th scope="row">게시판 부가 기능</th>
				<td colspan="3">
					<table class="board_write basic">
						<tr>
							<th scope="row" style="width:17%">비밀글 사용 여부<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
							<td>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey4" <c:if test="${resultData.secretAt eq 'N'}">checked="checked"</c:if> id="paramKey4_1" value="N" style="cursor:pointer" vali-text="비밀글 사용 여부를 선택해주세요." /><label for="paramKey4_1">미사용</label>
								</div>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey4" <c:if test="${resultData.secretAt eq 'Y'}">checked="checked"</c:if> id="paramKey4_2" value="Y" style="cursor:pointer" /><label for="paramKey4_2">사용</label>
								</div>					
								<b>해당 기능은 일반형 게시판만 적용 됩니다.</b>
							</td>
						</tr>
						
						<tr>
							<th scope="row" style="width:17%">답변 사용 여부<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
							<td>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey5" <c:if test="${resultData.answerAt eq 'N'}">checked="checked"</c:if> id="paramKey5_1" value="N" style="cursor:pointer" vali-text="답변 기능 사용 여부를 선택해주세요." /><label for="paramKey5_1">미사용</label>
								</div>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey5" <c:if test="${resultData.answerAt eq 'Y'}">checked="checked"</c:if> id="paramKey5_2" value="Y" style="cursor:pointer" /><label for="paramKey5_2">사용</label>
								</div>
								<b>해당 기능은 일반형 게시판만 적용 됩니다.</b>
							</td>
						</tr>

						<tr>
							<th scope="row" style="width:17%">검색기 사용 여부<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
							<td>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey7" <c:if test="${resultData.searchAt eq 'Y'}">checked="checked"</c:if> id="paramKey7_1" value="Y" style="cursor:pointer" vali-text="검색기 사용 여부를 선택해주세요." /><label for="paramKey7_1">사용</label>
								</div>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey7" <c:if test="${resultData.searchAt eq 'N'}">checked="checked"</c:if> id="paramKey7_2" value="N" style="cursor:pointer" /><label for="paramKey7_2">미사용</label>
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row" style="width:17%">페이징 사용 여부<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
							<td id="paging_area">
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey8" <c:if test="${resultData.pagingAt eq 'Y'}">checked="checked"</c:if> id="paramKey8_1" value="Y" style="cursor:pointer" vali-text="페이징 사용 여부를 선택해주세요." /><label for="paramKey8_1">사용</label>
								</div>
								<div class="on_iblock" style="margin-right: 20px;">
									<input type="radio" name="paramKey8" <c:if test="${resultData.pagingAt eq 'N'}">checked="checked"</c:if> id="paramKey8_2" value="N" style="cursor:pointer" /><label for="paramKey8_2">미사용</label>
								</div>
								<c:if test="${resultData.pagingAt eq 'Y'}">
									<div id="paging_option" style="margin-top: 10px;">
										<select name="paramKey9" id="paramKey9" class="join_select1" style="width: 150px;" vali-text="게시물 노출 갯수를 선택해주세요.">
											<option value="">게시물 노출 갯수</option>
										<c:forEach begin="1" end="101" step="1" var="item">
											<option value="${item}" <c:if test="${item eq resultData.pagingCnt}">selected="selected"</c:if>><c:out value="${item}개"/></option>	
										</c:forEach>
										</select>
									</div>
									<script>$('#paramKey9').select2();</script>
								</c:if>
							</td>
						</tr>

						<tr>
							<th scope="row" style="width:17%">첨부파일</th>
							<td>
								<select name="paramKey10" id="paramKey10" class="join_select1 unCheck" style="width: 150px;">
									<option value="0">첨부파일 없음</option>
									<c:forEach begin="1" end="10" step="1" var="item" varStatus="status">
										<option value="${item}" <c:if test="${resultData.attachCnt eq item}">selected="selected"</c:if>><c:out value="${item}"/>개</option>	
									</c:forEach>
								</select>
							</td>
						</tr>

					</table>				
				</td>
			</tr>
			
			<tr>
				<th scope="row">게시판 구성</th>
				<td colspan="3">
					<table class="board_write basic">
						<caption>게시판 구성</caption>
						<colgroup>
							<col />
							<col width="20%" />
							<col width="35%" />
							<col width="10%" />
							<col width="5%" />
						</colgroup>
						<tbody id="config_body">
							<tr id="config_btn">
								<td colspan="5">
									<input type="button" value="input 추가" class="common_btn type2 restore add_config" config_type="input" style="cursor: pointer;">
									<input type="button" value="textarea 추가" class="common_btn type2 restore add_config" config_type="textarea" style="cursor: pointer;">
									<input type="button" value="날짜 추가" class="common_btn type2 restore add_config" config_type="날짜" style="cursor: pointer;">
									<input type="button" value="기간 추가" class="common_btn type2 restore add_config" config_type="기간" style="cursor: pointer;">
									<input type="button" value="카테고리 추가" class="common_btn type2 restore add_config" config_type="카테고리" style="cursor: pointer;">
								</td>
							</tr>
							<c:if test="${vo.act eq 'regist'}">
							<tr config="useAt">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="사용 여부"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="Y" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="사용 여부"/>
								</td>
								<td>
									<input name="field_search" type="checkbox" value="Y" class="unCheck" id="search_useAt"/><label for="search_useAt">검색 허용여부</label>
								</td>
								<td>
									<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_useAt"/><label for="list_view_useAt">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									<div class="field_list_class_area"></div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
							<tr config="no">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="NO."/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="N"/>
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="no"/>
								</td>
								<td>해당없음</td>
								<td>
									<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_no"/><label for="list_view_no">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									<div class="field_list_class_area"></div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
							<tr config="cnt">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="조회수"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="N" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="조회수"/>
								</td>
								<td>해당없음</td>
								<td>
									<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_cnt"/><label for="list_view_cnt">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									<div class="field_list_class_area"></div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
							<tr config="register">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="작성자"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="N" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="작성자"/>
								</td>
								<td>
									<input name="field_search" type="checkbox" value="Y" class="unCheck" id="search_register"/><label for="search_register">검색 허용여부</label>
								</td>
								<td>
									<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_register"/><label for="list_view_register">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									<div class="field_list_class_area"></div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
							<tr config="regDate">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="등록일"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="N" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="등록일"/>
								</td>
								<td>해당없음</td>
								<td>
									<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_reg_date"/><label for="list_view_reg_date">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									<div class="field_list_class_area"></div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
							<tr config="title">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="제목"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="Y" checked="checked" />
										</span>
									</div>
									<input name="paramKeyList2" type="text" style="width: 100%;" value="" placeholder="필드명" id="board_title_title" vali-text="제목을 입력해주세요."/>
								</td>
								<td>
									<input name="field_search" type="checkbox" value="Y" class="unCheck" id="search_title"/><label for="search_title">검색 허용여부</label>
								</td>
								<td>
									<input name="field_list_view" onChange="fn_list_view(this);" type="checkbox" value="Y" class="unCheck" id="list_view_title"/><label for="list_view_title">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" disabled="disabled" placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" disabled="disabled" placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									<div class="field_list_class_area"></div>
								</td>
								<td style="text-align: center;">
									<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>
									<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>
								</td>
								<td style="text-align: center;">-</td>
							</tr>
							
							</c:if>
							<c:forEach items="${resultData.listFields}" var="item" varStatus="status">
							<c:choose>
								<c:when test="${item eq 'useAt'}">
							<tr config="useAt">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="사용 여부"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="Y" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="사용 여부"/>
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listSearchs.indexOf(item)}"/>
									<input name="field_search" type="checkbox" value="Y" <c:if test="${mIndex ge 0}">checked="checked"</c:if> class="unCheck" id="search_${item}"/><label for="search_${item}">검색 허용여부</label>
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:when test="${item eq 'no'}">
							<tr config="no">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="NO."/>
										<span style="float: right;">
											<input type="hidden" type="hidden" name="field_vali" type="checkbox" value="N" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="no"/>
								</td>
								<td>해당없음</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:when test="${item eq 'cnt'}">
							<tr config="cnt">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="조회수"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="N" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="조회수"/>
								</td>
								<td>해당없음</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:when test="${item eq 'register'}">
							<tr config="register">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="작성자"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="N" />
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="작성자"/>
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listSearchs.indexOf(item)}"/>
									<input name="field_search" type="checkbox" value="Y" <c:if test="${mIndex ge 0}">checked="checked"</c:if> class="unCheck" id="search_${item}"/><label for="search_${item}">검색 허용여부</label>
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:when test="${item eq 'regDate'}">
							<tr config="regDate">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="등록일"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="N"/>
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="등록일"/>
								</td>
								<td>해당없음</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">-</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:when test="${item eq 'title'}">
							<tr config="title">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="제목"/>
										<span style="float: right;">
											<input type="hidden" name="field_vali" type="checkbox" value="Y" checked="checked" />
										</span>
									</div>
									<input name="paramKeyList2" type="text" style="width: 100%;" value="${resultData.listTitles[status.index]}" placeholder="필드명" id="board_title_${item}" vali-text="제목을 입력해주세요."/>
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listSearchs.indexOf(item)}"/>
									<input name="field_search" type="checkbox" value="Y" <c:if test="${mIndex ge 0}">checked="checked"</c:if> class="unCheck" id="search_${item}"/><label for="search_${item}">검색 허용여부</label>
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${empty mIndex or mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">
									<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>
									<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>
								</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:when test="${item eq 'attachFile'}">
							<tr config="attachFile">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="첨부파일"/>
										<span style="float: right;">
											<input name="field_vali" type="checkbox" value="Y" <c:if test="${resultData.listValis[status.index] eq 'Y'}">checked="checked"</c:if> class="unCheck" id="vali_${item}"/><label for="vali_${item}">입력 필수여부</label>
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="첨부파일"/>
								</td>
								<td>
									해당없음
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">
									<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>
									<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>
								</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:when test="${item eq 'answerAt'}">
							<tr config="answerAt">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="답변여부"/>
										<span style="float: right;">
											<input name="field_vali" type="checkbox" value="Y" <c:if test="${resultData.listValis[status.index] eq 'Y'}">checked="checked"</c:if> class="unCheck" id="vali_${item}"/><label for="vali_${item}">입력 필수여부</label>
										</span>
									</div>
									<input type="hidden" name="paramKeyList2" value="답변여부"/>
								</td>
								<td>
									해당없음
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">
									<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>
									<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>
								</td>
								<td style="text-align: center;">-</td>
							</tr>
								</c:when>
								<c:otherwise>
							<c:choose>
								<c:when test="${fn:indexOf(item, 'textField') != -1}">
									<c:set var="config_title" value="textField"/>
									<c:set var="config_ex" value="input"/>
								</c:when>									
								<c:when test="${fn:indexOf(item, 'textareaField') != -1}">
									<c:set var="config_title" value="textareaField"/>
									<c:set var="config_ex" value="textarea"/>
								</c:when>									
								<c:when test="${fn:indexOf(item, 'dateField') != -1}">
									<c:set var="config_title" value="dateField"/>
									<c:set var="config_ex" value="날짜"/>
								</c:when>									
								<c:when test="${fn:indexOf(item, 'dateArrayField') != -1}">
									<c:set var="config_title" value="dateArrayField"/>
									<c:set var="config_ex" value="기간"/>
								</c:when>									
								<c:when test="${fn:indexOf(item, 'categoryField') != -1}">
									<c:set var="config_title" value="categoryField"/>
									<c:set var="config_ex" value="카테고리"/>
								</c:when>
							</c:choose>
							<tr config="${item}">
								<td>
									<div style="display: inline-block; margin-bottom: 5px; width: 100%;"><c:out value="${config_ex}"/>
										<span style="float: right;">
											<input name="field_vali" type="checkbox" value="Y" <c:if test="${resultData.listValis[status.index] eq 'Y'}">checked="checked"</c:if> class="unCheck" id="vali_${item}"/><label for="vali_${item}">입력 필수여부</label>
										</span>
									</div>
									<c:choose>
										<c:when test="${fn:indexOf(item, 'categoryField') ne -1}">
											<c:set var="numLen" value="${fn:length(item)}"/>
											<c:set var="cateNum" value="${(fn:substring(item, 13, numLen)-1)*2}"/>
											<c:set var="cateName" value="paramKey3${cateNum}"/>
											<c:set var="cateOptionName" value="paramKey3${cateNum+1}"/>
											<c:set var="getCateName" value="categoryField${fn:substring(item, 13, numLen)}"/>
											<c:set var="getCateOptionName" value="categoryField${fn:substring(item, 13, numLen)}Option"/>
											
											<input name="paramKeyList2" type="text" style="width: 100%; margin-bottom: 5px;" value="${resultData.listTitles[status.index]}" placeholder="필드명" id="title_${item}" vali-text="필드명을 입력해주세요."/>
											
											<select id="cate_${item}" name="${cateName}" class="join_select1" style="width:49%;" vali-text="카테고리 그릅을 선택해주세요.">
												<option value="">-카테고리 그룹-</option>
												<c:forEach items="${categoryList}" var="category" varStatus="status">
													<option value="${category.categoryCode}" <c:if test="${category.categoryCode eq resultData[getCateName]}">selected="selected"</c:if>>${category.categoryName}</option>
												</c:forEach>
											</select>
											<select id="cate_option_${item}" name="${cateOptionName}" class="join_select1" style="width:49%;" vali-text="카테고리 노출 유형을 선택해주세요.">
												<option value="">-카테고리 유형-</option>
												<option value="S" <c:if test="${'S' eq resultData[getCateOptionName]}">selected="selected"</c:if>>셀렉트박스</option>
												<option value="R" <c:if test="${'R' eq resultData[getCateOptionName]}">selected="selected"</c:if>>라디오버튼</option>
<%-- 												<option value="C" <c:if test="${'C' eq resultData[getCateOptionName]}">selected="selected"</c:if>>체크박스</option> --%>
											</select>
										</c:when>
										<c:otherwise>
											<input name="paramKeyList2" type="text" style="width: 100%;" value="${resultData.listTitles[status.index]}" placeholder="필드명" id="title_${item}" vali-text="필드명을 입력해주세요."/>	
										</c:otherwise>
									</c:choose>
								</td>
								<td>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${fn:indexOf(item, 'dateField') ne -1 or fn:indexOf(item, 'dateArrayField') ne -1}"> --%>
<!-- 											해당없음 -->
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
											<c:set var="mIndex" value="${resultData.listSearchs.indexOf(item)}"/>
											<input name="field_search" type="checkbox" value="Y" <c:if test="${mIndex ge 0}">checked="checked"</c:if> class="unCheck" id="search_${item}"/><label for="search_${item}">검색 허용여부</label>	
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
								</td>
								<td>
									<c:set var="mIndex" value="${resultData.listViewFields.indexOf(item)}"/>
									<input name="field_list_view" onChange="fn_list_view(this);" <c:if test="${mIndex ge 0}">checked="checked"</c:if> type="checkbox" value="Y" class="unCheck" id="list_view_${item}"/><label for="list_view_${item}">리스트 노출여부</label>
									<input type="number" name="field_sort" min="0" style="width: 50px;" <c:if test="${mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${mIndex+1}"</c:if> placeholder="순번" class="vali_inc" vali-text="순번을 입력해주세요." />
									<input type="number" name="field_width" min="0" style="width: 50px;" <c:if test="${mIndex lt 0}">disabled="disabled"</c:if> <c:if test="${mIndex ge 0}">value="${resultData.listViewPercents[mIndex]}"</c:if> placeholder="넓이" class="vali_inc" vali-text="넓이를 입력해주세요." />
									
									<div class="field_list_class_area">
									<c:if test="${mIndex ge 0}">
										<input name="field_class" type="text" style="width: 100%; margin-top: 10px;" value="${resultData.listViewClasses[mIndex]}" placeholder="클래스명" class="unCheck">
									</c:if>
									</div>
								</td>
								<td style="text-align: center;">
									<a onclick="fn_sort(this,1)" style="cursor: pointer; color: red; font-size: 15px; vertical-align: middle;" title="순서변경 UP">▲</a>
									<a onclick="fn_sort(this,2)" style="cursor: pointer; color: blue; font-size: 15px; vertical-align: middle;" title="순서변경 DOWN">▼</a>
								</td>
								<td>
									<input type="hidden" class="${config_title}" value="${item}"/>
									<a onClick="fn_remove(this);" style="cursor: pointer;">X</a>
								</td>
							</tr>
								</c:otherwise>
							</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</td>
			</tr>
			
			<tr>
				<th scope="row">게시판 상단 내용<br />(사용자 페이지 노출용)</th>
				<td colspan="3">
					<textarea id="paramKey19" name="paramKey19" class="unCheck" editor="Y" style="width: 100%; height: 250px;"><c:out value="${resultData.topContents}" escapeXml="false"/></textarea>
				</td>
			</tr>

			<tr>
				<th scope="row">게시판 하단 내용<br />(사용자 페이지 노출용)</th>
				<td colspan="3">
					<textarea id="paramKey20" name="paramKey20" class="unCheck" editor="Y" style="width: 100%; height: 250px;"><c:out value="${resultData.bottomContents}" escapeXml="false"/></textarea>
				</td>
			</tr>

			<tr>
				<th scope="row">게시판 소개</th>
				<td colspan="3">
					<textarea id="paramKey21" name="paramKey21" class="unCheck" style="width: 100%; height: 250px;"><c:out value="${resultData.contents}" escapeXml="false"/></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="btn_wrap">
		<a onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">취소</a>
		<a onclick="fn_edit();" style="cursor: pointer;" class="right btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
	</div>	
</form:form>	
</body>