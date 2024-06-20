<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<link href="/css/cmmn/admin/category.css" rel="stylesheet">
	<script type="text/javascript" defer="defer">
		var code;
		function fn_cate_show() {
			$('#layer_container').html(getCateHtml());
			$('#layer').fadeIn();		
		}
		
		function fn_cate_modify_show() {
			if(!$('#cate_list').find('li.on').length) {
				alert('카테고리를 선택해주세요.');
				return;
			}
			
			var data = {'code': code};
			fn_cmmn_ajax("${vo.selfPath}select_cate.ajax", true, data, 'json', function(result) {
				$('#layer_container').html(getCateHtml(result));
				$('#layer').fadeIn();	
			}, true, 500);
					
		}
		
		function getCateHtml(data) {
			var html = '';
			html += '<h1 id="layer_title" class="pop-layer-title">- 카테고리 '+(data ?'수정' :'등록')+' -</h1>';
			html += '<div id="layer_content">';
			html += '	<table class="board_write basic">';
			html += '		<colgroup>';
			html += '			<col style="width: 30%;">';
			html += '			<col style="width: 70%;">';
			html += '		</colgroup>';
			html += '		<tbody>';
			html += '			<tr>';
			html += '				<th scope="row">카테고리 명</th>';
			html += '				<td>';
			html += '					<input id="cate_name" type="text" value="'+(data ?data.categoryName :'')+'"/>';
			html += '				</td>';
			html += '			</tr>';
			html += '		</tbody>';
			html += '	</table>';
			html += '</div>';
            html += '<div class="btn-r">';
            html += '	<a onClick="fn_cate_act(\''+(data ?'modify' :'regist')+'\');" class="btn-layerClose">'+(data ?'수정' :'등록')+'</a>';
            if(data) {
            html += '	<a onClick="fn_cate_act(\'delete\');" class="btn-layerClose">삭제</a>';
            }
            html += '	<a onClick="fn_layer_close();" class="btn-layerClose">닫기</a>';
            html += '</div>';
            
            return html;
		}
		
		function fn_cate_act(act) {
			var cate_name = $('#cate_name').val();
			if(!cate_name) {
				alert('카테고리 명을 입력해주세요.');
				$('#cate_name').focus();
				return;
			}
			
			var data = {'cate_name': cate_name, 'code':code};
			fn_cmmn_ajax("${vo.selfPath}cate_"+act+".ajax", true, data, 'text', function(result) {
				if(result) {
					switch (act) {
					case 'regist':
						$('#cate_list').prepend('<li><a onClick="fn_select_cate(this, \''+result+'\');">'+cate_name+'</a></li>');
						break;
					case 'modify':
						$('#cate_list').find('li.on').children().html(cate_name);
						break;
					case 'delete':
						$('#cate_list').find('li.on').remove();
						$('#tree_title').html('[ 목록 ]');
						$('#cate_data_list').html('');
						$('#cate_data_txt').val('');
						$('#cate_data_pos').html('');
						$('#cate_data_pos').select2();
						break;
					}
					
					fn_layer_close();
				}
			}, true, 500);
		}
		
		function fn_select_cate(obj, code) {
			this.code = code;
			
			$('#cate_list').find('li.on').removeClass('on');
			$(obj).parent().addClass('on');
			$('#tree_title').html('[ '+$(obj).html()+' 목록 ]');
			
			var data = {'code': code};
			fn_cmmn_ajax("${vo.selfPath}cate_data_list.ajax", true, data, 'text', function(result) {
				$('#cate_data_list').html('');
				
				var html = '';
				html += '<option value="0">최상위 데이터</option>';
				
				if(result) {
					$('#cate_data_list').html(result);
					
					$.each($('#cate_data_list').children(), function(index, item) {
					html += '<option value="'+$(item).children().eq(0).attr('key')+'">'+$(item).children().eq(0).html()+'</option>';
					});
				}
				
				$('#cate_data_txt').val('');
				$('#cate_data_pos').html(html);
				$('#cate_data_pos').select2();
			}, true, 500);
		}
		
		var selectData;
		function fn_data_show(obj) {
			selectData = obj;
			var data = {'key': $(obj).attr('key')};
			fn_cmmn_ajax("${vo.selfPath}cate_data.ajax", true, data, 'json', function(result) {
				$('#layer_container').html(getCateDataHtml(result));
				$('#layer').fadeIn();	
			}, true, 500);
		}
		
		function getCateDataHtml(data) {
			var html = '';
			html += '<h1 id="layer_title" class="pop-layer-title">- 카테고리 데이터 수정 -</h1>';
			html += '<div id="layer_content">';
			html += '	<table class="board_write basic">';
			html += '		<colgroup>';
			html += '			<col style="width: 30%;">';
			html += '			<col style="width: 70%;">';
			html += '		</colgroup>';
			html += '		<tbody>';
			html += '			<tr>';
			html += '				<th scope="row">데이터 명</th>';
			html += '				<td>';
			html += '					<input type="text" id="data_name" value="'+data.dataName+'"/>';
			html += '				</td>';
			html += '			</tr>';
			html += '			<tr>';
			html += '				<th scope="row">순번</th>';
			html += '				<td>';
			html += '					<input type="number" min="0" id="data_sort" value="'+data.sort+'"/>';
			html += '				</td>';
			html += '			</tr>';
			html += '		</tbody>';
			html += '	</table>';
			html += '</div>';
            html += '<div class="btn-r">';
            html += '	<a onClick="fn_data_modify();" class="btn-layerClose">수정</a>';
            html += '	<a onClick="fn_data_remove();" class="btn-layerClose">삭제</a>';
            html += '	<a onClick="fn_layer_close();" class="btn-layerClose">닫기</a>';
            html += '</div>';
            
            return html;
		}
		
		function fn_data_modify() {
			var dataName = $('#data_name').val();
			var dataSort = parseInt($('#data_sort').val());
			
			if(!dataName) {
				alert('데이터 명을 입력해주세요.');
				return;
			}
			
			if(dataSort != 0 && !dataSort) {
				alert('순번을 입력해주세요.');
				return;
			}
			
			if(dataSort <= 0) {
				alert('순번은 음수가 될 수 없습니다.');
				return;
			}
			
			var max = $(selectData).parent().parent().children().length;
			if(dataSort > max) {
				alert('순번의 최대값은 '+max+' 입니다.');
				return;
			}
			var mSort = parseInt($(selectData).parent().parent().children().index($(selectData).parent()))+1;
			var data = {'key': $(selectData).attr('key'), 'dataName':dataName, 'dataSort':dataSort, 'mSort':mSort};
			fn_cmmn_ajax("${vo.selfPath}cate_data_modify.ajax", true, data, 'text', function(result) {
				if(result) {
					if(mSort < dataSort) $(selectData).parent().parent().children().eq(dataSort-1).after($(selectData).parent());
					else if(mSort > dataSort) $(selectData).parent().parent().children().eq(dataSort-1).before($(selectData).parent());
					
					$(selectData).html(dataName);
					fn_layer_close();
				}
			}, true, 500);
		}
		
		function fn_data_remove() {
			var dataName = $('#data_name').val();
			var mSort = parseInt($(selectData).parent().parent().children().index($(selectData).parent()))+1;
			
			if(!dataName) {
				alert('데이터 명을 입력해주세요.');
				return;
			}
			
			var data = {'key': $(selectData).attr('key'), 'dataName':dataName, 'mSort':mSort};
			fn_cmmn_ajax("${vo.selfPath}cate_data_delete.ajax", true, data, 'text', function(result) {
				if(result) {
					$(selectData).parent().remove();
					if($(selectData).parent().parent().attr('id') == 'cate_data_list') {
						$('#cate_data_pos').find('option').eq(mSort).remove();
						$('#cate_data_pos').select2();	
					}
					fn_layer_close();
				}
			}, true, 500);
			
		}
		
		function fn_data_regist() {
			var pos = $('#cate_data_pos').val();
			var txt = $('#cate_data_txt').val();
			 
			if(!pos) {
				alert('카테고리를 선택해주세요.');
				return;
			}
			
			if(!txt) {
				alert('데이터명을 입력해주세요.');
				return;
			}
			
			var data = {'code':code, 'data_pos':pos, 'data_txt':txt};
			fn_cmmn_ajax("${vo.selfPath}cate_data_regist.ajax", true, data, 'text', function(result) {
				if(result) {
					if(pos == '0') {
						$('#cate_data_pos').append('<option value="'+result+'">'+txt+'</option>');
						$('#cate_data_pos').select2();
						$('#cate_data_list').append('<li><a onClick="fn_data_show(this);" key="'+result+'">'+txt+'</a></li>');
					}
					else {
						var obj = $('[key="'+pos+'"]');
						if($(obj).parent().find('ul').length == 0) $(obj).parent().append('<ul><li><a onClick="fn_data_show(this);" key="'+result+'">'+txt+'</a></li></ul>');
						else $(obj).parent().find('ul').append('<li><a onClick="fn_data_show(this);" key="'+result+'">'+txt+'</a></li>');
					}
					$('#cate_data_txt').val('');
				}
			}, true, 500);
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">

	<fieldset id="category_fieldset" class="category">
		<legend id="title">[ 카테고리 목록 ]</legend>
		<div id="category_container">
			<div>
				<a onClick="fn_cate_show();" style="margin-right: 5px;">[ 카테고리 추가 ]</a>
				<a onClick="fn_cate_modify_show();" style="margin-left: 5px;">[ 카테고리 수정 ]</a>
			</div>
	        <ul id="cate_list">
	        	<c:forEach items="${resultList}" var="list" varStatus="status">
	        		<li><a onClick="fn_select_cate(this, '${list.categoryCode}');"><c:out value="${list.categoryName}"/></a></li>
	        	</c:forEach>
	        </ul>
		</div>
	</fieldset>
	
	<fieldset id="options_fieldset" class="options">
		<legend id="title">[ 카테고리 정보 ]</legend>
		<div id="options_container">
			<fieldset id="tree_fieldset" class="tree">
				<legend id="tree_title">[ 목록 ]</legend>
				<div id="options_tree">
					<ul id="cate_data_list">
					</ul>
				</div>
			</fieldset>
			<fieldset id="info_fieldset" class="info">
				<legend id="title">[ 카테고리 데이터 추가 정보 ]</legend>
				<div>
					<table id="options_table" class="board_write basic">
						<caption>카테고리 데이터 추가 정보</caption>
						<colgroup>
							<col style="width: 30%;">
							<col style="width: 70%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">추가 위치</th>
								<td>
									<select id="cate_data_pos">
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">데이터 명</th>
								<td>
									<input id="cate_data_txt" type="text"/>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div id="tree_btn_area" class="tree_btn_area">
						<a onclick="fn_data_regist();" style="cursor: pointer;" class="right btn">등록</a>
					</div>
				</div>
			</fieldset>
		</div>
	</fieldset>
	
</form:form>

	<!-- Start : layer-popup content -->
	<div id="layer" class="layer-wrap">
	    <div class="pop-layer">
	        <div class="pop-container">
	            <div id="layer_container" class="pop-conts">
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End : layer-popup content -->
	
</body>