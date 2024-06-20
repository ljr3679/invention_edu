<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<!-- MENU TREE -->
	<script type="text/javascript" src="/js/cmmn/fancytree/fancytree.js"></script>
	<script type="text/javascript" src="/js/cmmn/fancytree/jquery.configurator.js"></script>
	<script type="text/javascript" src="/js/cmmn/fancytree/jquery.fancytree.dnd.js"></script>
	<script type="text/javascript" src="/js/cmmn/fancytree/jquery.fancytree.edit.js"></script>
	
	
	<link href="/css/cmmn/fancytree/ui.fancytree.min.css" rel="stylesheet">
	<link href="/css/cmmn/admin/admin_fancytree.css" rel="stylesheet">
	<!-- MENU TREE -->
	
	<script type="text/javascript" defer="defer">
		$(function(){
			var dragRun = false;
	    	var dragStartParent;
	    	const tree = $("#tree").fancytree({
	    		init: function(event, data) {
					$('#options_fieldset').css({'height': $('#tree_fieldset').css('height')});
			    	$.ui.fancytree.getTree("#tree").getFirstChild().setActive();
				},
	    		debugLevel: 1,
	    		extensions: ["dnd", "edit"],
	    		tooltip: false,
	    		minExpandLevel: 2,
	    		activate: function(event, data) {
	    			fn_activate_node(data.node);
				},
	    		dnd: {
					autoExpandMS: 400,
	    	        focusOnClick: true,
	    	        preventVoidMoves: true,
	    	        preventRecursiveMoves: true,
	    	        dragStart: function(node, data) {
	    	        	dragStartParent = node.parent;
						return true;
	    	        },
	    	        dragEnter: function(node, data) {
						return true;
	    	        },
	    	        dragDrop: function(node, data) {
	    	        	if(node.parent == $.ui.fancytree.getTree("#tree").getRootNode()) {
	    	        		dragRun = false;
	    	        	} else {
	    	        		dragRun = true;
	    	        		data.otherNode.moveTo(node, data.hitMode);
	    	        	}
	    	        },
	    	        dragStop: function(node, data) {
	    	        	if(dragRun) {
	    	        		dragRun = false;
	    	        		var html = '';
		    	        	$.each(node.parent.getChildren(), function(index, item) {
	    	        			html += '<input type="hidden" name="paramKeyList1" value="'+$('#'+item.key).attr('idx')+'"/>';
	    	        			html += '<input type="hidden" name="paramKeyList2" value="'+(item.getIndex()+1)+'"/>';
	    	        		});
		    	        	
		    	        	$('#paramKey10').val($('#'+node.key).attr('idx'));
		    	        	var parentIdx = $('#'+node.parent.key).attr('idx');
	    	        		$('#paramKey11').val(parentIdx ?parentIdx :'0');
	    	        		$('#paramKey12').val(node.getLevel()-1);
		    	        	
		    	        	if(dragStartParent == node.parent) $('#paramKey13').val('S');
		    	        	else {
		    	        		$.each(dragStartParent.getChildren(), function(index, item) {
			    	        		html += '<input type="hidden" name="paramKeyList1" value="'+$('#'+item.key).attr('idx')+'"/>';
		    	        			html += '<input type="hidden" name="paramKeyList2" value="'+(item.getIndex()+1)+'"/>';
			    	        	});
		    	        		$('#paramKey13').val('D');
		    	        		
		    	        		var childrenList = new Array(); 
		    	        		active_children(node, childrenList);
		    	        		$.each(childrenList, function(index, item) {
			    	        		html += '<input type="hidden" name="paramKeyList4" value="'+$('#'+item.key).attr('idx')+'"/>';
			    	        	});
		    	        		$('#paramKey14').val(node.getLevel() - dragStartParent.getLevel() - 1);
		    	        	}
		    	        	
		    	        	$('#arrayListArea').html(html);
		    	        	
		    	        	fn_cmmn_form_ajax("${vo.selfPath}sort.ajax", true, new FormData($('#cmmnForm')[0]), 'text', function(result) {
		    	        		if(result == 'Y') {
		    	    				fn_activate_node(node);
		    	    				node.parent.setExpanded();
		    	    	        	
		    	    	        	var parentObj = $('#'+node.parent.key);
		    	    	        	var mObj = $('#'+node.key);
		    	    	        	
		    	    	        	if(parentObj.find('ul').length == 0) parentObj.html(parentObj.html()+'<ul></ul>');
		    	    	        	parentObj.find('ul').eq(0).append(mObj);		
		    	    	        	
		    	    				dragStartParent.fromDict({folder: (dragStartParent.children ?true :false)});
		    	    				node.parent.fromDict({folder: (node.parent.children ?true :false)});
		    	    				
		    	    				fn_init_paramKey();
		    	    			}
		    	        	}, true, 500);
	    	        	}
	    	        }
	    		}
			});
	    });
		
		var activeNode;
		
		function fn_activate_node(node) {
			var mNode = node;
			var data = data_set(mNode);
			activeNode = mNode;
			
			$('#options_table').find('tbody').html(options_body_set(data));
			$('#tree_btn_area').html(tree_btn_area_set('Y', data));
			$('.join_select_call').select2();
			
			var nodeTitleList = new Array();
			nodeTitleList.push(mNode.title);
			
			while(mNode.parent) {
				mNode = mNode.parent;
				if(mNode == $.ui.fancytree.getTree("#tree").getRootNode()) break;
				nodeTitleList.push(mNode.title);
			}
			var txt = '';
			for(var i=0; i<nodeTitleList.length; i++) {
				txt += nodeTitleList[nodeTitleList.length-(i+1)];
				if(i != nodeTitleList.length-1) txt += ' > ';
			}
			$('#options_title').html('[ '+node.title+' ]');
			$('#tree_gbn').html(txt);
		}
		
		function data_set(node) {
			var data = new Object();
			if(node.key == 'root') data.root = 'T';
			data.useAt = $('#'+node.key).attr('useAt');
			data.gnbViewAt = $('#'+node.key).attr('gnbViewAt');
			data.sessionAt = $('#'+node.key).attr('sessionAt');
			data.tabAt = $('#'+node.key).attr('tabAt');
			data.menuTitle = $('#'+node.key).attr('menuTitle');
			data.menuType = $('#'+node.key).attr('menuType');
			data.uri = $('#'+node.key).attr('uri');
			data.linkType = $('#'+node.key).attr('linkType');
			data.linkUrl = $('#'+node.key).attr('linkUrl');
			data.boardCode = $('#'+node.key).attr('boardCode');
			data.skin = $('#'+node.key).attr('skin');
			data.block = $('#'+node.key).attr('block');
			
			return data;
		}
		
		function options_body_set(data) {
			var html = '';
			html += '<tr>';
			html += '	<th scope="row">구분</th>';
			html += '	<td>';
			html += '		<span id="tree_gbn"></span>';
			html += '	</td>';
			html += '</tr>';
if(!data || !data.root) {
			html += '<tr>';
			html += '	<th scope="row">사용 여부</th>';
			html += '	<td>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey1" id="radio_1" value="Y" style="cursor:pointer" '+(data ?(data.useAt == 'Y' ?'checked="checked"' :'') :'checked="checked"')+'><label for="radio_1">사용</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey1" id="radio_2" value="N" style="cursor:pointer" '+(data ?(data.useAt == 'N' ?'checked="checked"' :'') :'')+'><label for="radio_2">미사용</label>';
			html += '		</div>';
			html += '	</td>';
			html += '</tr>';
			<c:if test="${vo.tabPos eq '1'}">	
			html += '<tr>';
			html += '	<th scope="row">GNB노출 여부</th>';
			html += '	<td>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey2" id="radio_3" value="Y" style="cursor:pointer" '+(data ?(data.gnbViewAt == 'Y' ?'checked="checked"' :'') :'checked="checked"')+'/><label for="radio_3">사용</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey2" id="radio_4" value="N" style="cursor:pointer" '+(data ?(data.gnbViewAt == 'N' ?'checked="checked"' :'') :'')+'/><label for="radio_4">미사용</label>';
			html += '		</div>';
			html += '	</td>';
			html += '</tr>';
			
			html += '<tr>';
			html += '	<th scope="row">세션 정보</th>';
			html += '	<td>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey15" id="radio_11" value="A" style="cursor:pointer" '+(data ?(data.sessionAt == 'A' ?'checked="checked"' :'') :'checked="checked"')+'><label for="radio_11">전체 표출</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey15" id="radio_12" value="D" style="cursor:pointer" '+(data ?(data.sessionAt == 'D' ?'checked="checked"' :'') :'')+'><label for="radio_12">접근 제한</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey15" id="radio_13" value="R" style="cursor:pointer" '+(data ?(data.sessionAt == 'R' ?'checked="checked"' :'') :'')+'><label for="radio_13">표출(세션)</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey15" id="radio_14" value="N" style="cursor:pointer" '+(data ?(data.sessionAt == 'N' ?'checked="checked"' :'') :'')+'><label for="radio_14">미표출(세션)</label>';
			html += '		</div>';
			html += '	</td>';
			html += '</tr>';
			
			</c:if>
			
			html += '<tr>';
			html += '	<th scope="row">탭 사용 여부</th>';
			html += '	<td>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey16" id="radio_15" value="Y" style="cursor:pointer" '+(data ?(data.tabAt == 'Y' ?'checked="checked"' :'') :'')+'><label for="radio_15">사용</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input class="unCheck" type="radio" name="paramKey16" id="radio_16" value="N" style="cursor:pointer" '+(data ?(data.tabAt == 'N' ?'checked="checked"' :'') :'checked="checked"')+'><label for="radio_16">미사용</label>';
			html += '		</div>';
			html += '	</td>';
			html += '</tr>';
			
			html += '<tr>';
			html += '	<th scope="row">메뉴명</th>';
			html += '	<td>';
			html += '		<input id="paramKey3" name="paramKey3" type="text" style="width: 100%;" vali-text="메뉴명을 입력하여 주십시오." maxlength="100" value="'+(data ?data.menuTitle :'')+'"/>';
			html += '	</td>';
			html += '</tr>';
			html += '<tr>';
			html += '	<th scope="row">페이지 유형</th>';
			html += '	<td>';
if(data) {
			html += '		<p>';
			switch (data.menuType) {
				case 'D':html += '고정 메뉴';break;
				case 'C':html += '컨텐츠 메뉴';break;
				case 'B':html += '게시판 메뉴';break;
				case 'L':html += '링크 메뉴';break;
			}
			
			html += '		</p>';
			html += '		<input type="hidden" id="paramKey4" name="paramKey4" value="'+data.menuType+'"/>';
} else {
			<c:if test="${admSession.authority eq 'S'}">
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input type="radio" onClick="menu_type_child_call(this.value);" name="paramKey4" id="radio_5" value="D" style="cursor:pointer" vali-text="페이지 유형을 선택하여 주십시오."/><label for="radio_5">고정 메뉴</label>';
			html += '		</div>';
			</c:if>
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input type="radio" onClick="menu_type_child_call(this.value);" name="paramKey4" id="radio_6" value="C" style="cursor:pointer" vali-text="페이지 유형을 선택하여 주십시오."/><label for="radio_6">컨텐츠 메뉴</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input type="radio" onClick="menu_type_child_call(this.value);" name="paramKey4" id="radio_7" value="B" style="cursor:pointer" vali-text="페이지 유형을 선택하여 주십시오."/><label for="radio_7">게시판 메뉴</label>';
			html += '		</div>';
			html += '		<div class="on_iblock" style="margin-right: 20px;">';
			html += '			<input type="radio" onClick="menu_type_child_call(this.value);" name="paramKey4" id="radio_8" value="L" style="cursor:pointer" vali-text="페이지 유형을 선택하여 주십시오."/><label for="radio_8">링크 메뉴</label>';
			html += '		</div>';
	
}
			html += '	</td>';
			html += '</tr>';
			html += (data ?menu_type_child_set(data) :'');
}
			return html;
		}
		
		function menu_type_child_set(data, fix) {
			var html = '';
			switch (fix ?fix :data.menuType) {
			case 'D':
				html += '<tr class="menu_type_child">';
				html += '	<th scope="row">메뉴 URI</th>';
				html += '	<td>';
				html += '		<input id="paramKey5" name="paramKey5" type="text" style="width: 100%;" vali-text="메뉴 URI를 입력해주세요." maxlength="200" value="'+(data ?data.uri :'')+'"/>';
				html += '	</td>';
				html += '</tr>';
			break;
			case 'C':
				html += '<tr class="menu_type_child">';
				html += '	<th scope="row">컨텐츠</th>';
				html += '	<td>';
				html += '		<select id="paramKey6" name="paramKey6" class="join_select_call unCheck" style="min-width: 200px;">';
			<c:forEach items="${contentsList}" var="list" varStatus="status">
				html += '			<option value="${list.boardCode}" '+(data ?(data.boardCode == "${list.boardCode}" ?'selected="selected"' :'') :'')+'>${list.title}</option>';
			</c:forEach>
				html += '		</select>';
			<c:if test="${admSession.authority ne 'S'}">
				html += '		<input type="hidden" id="paramKey7" name="paramKey7" value="'+(data ?data.skin :'basic')+'"/>'
			</c:if>
				html += '	</td>';
				html += '</tr>';
			<c:if test="${admSession.authority eq 'S'}">
				html += '<tr class="menu_type_child">';
				html += '	<th scope="row">스킨</th>';
				html += '	<td>';
				html += '		<input type="text" id="paramKey7" name="paramKey7" vali-text="스킨명을 입력해주세요." value="'+(data ?data.skin :'basic')+'"/>'
				html += '	</td>';
				html += '</tr>';
			</c:if>
			break;
			case 'B':
				html += '<tr class="menu_type_child">';
				html += '	<th scope="row">게시판</th>';
				html += '	<td>';
				html += '		<select id="paramKey6" name="paramKey6" class="join_select_call unCheck" style="min-width: 200px;">';
			<c:forEach items="${boardList}" var="list" varStatus="status">
				html += '			<option value="${list.boardCode}" '+(data ?(data.boardCode == "${list.boardCode}" ?'selected="selected"' :'') :'')+'>${list.title}</option>';
			</c:forEach>
				html += '		</select>';
			<c:if test="${admSession.authority ne 'S'}">
				html += '		<input type="hidden" id="paramKey7" name="paramKey7" value="'+(data ?data.skin :'basic')+'"/>'
			</c:if>
				html += '	</td>';
				html += '</tr>';
			<c:if test="${admSession.authority eq 'S'}">
				html += '<tr class="menu_type_child">';
				html += '	<th scope="row">스킨</th>';
				html += '	<td>';
				html += '		<input type="text" id="paramKey7" name="paramKey7" vali-text="스킨명을 입력해주세요." value="'+(data ?data.skin :'basic')+'"/>'
				html += '	</td>';
				html += '</tr>';
			</c:if>
			break;
			case 'L':
				html += '<tr class="menu_type_child">';
				html += '	<th scope="row">링크 유형</th>';
				html += '	<td>';
				html += '		<div class="on_iblock" style="margin-right: 20px;">';
				html += '			<input class="unCheck" type="radio" name="paramKey8" id="radio_9" value="Y" style="cursor:pointer" '+(data ?(data.linkType == 'Y' ?'checked="checked"' :'') :'checked="checked"')+'/><label for="radio_9">새창</label>';
				html += '		</div>';
				html += '		<div class="on_iblock" style="margin-right: 20px;">';
				html += '			<input class="unCheck" type="radio" name="paramKey8" id="radio_10" value="N" style="cursor:pointer" '+(data ?(data.linkType == 'N' ?'checked="checked"' :'') :'')+'/><label for="radio_10">현재창</label>';
				html += '		</div>';
				html += '	</td>';
				html += '</tr>';
				html += '<tr class="menu_type_child">';
				html += '	<th scope="row">링크 URL</th>';
				html += '	<td>';
				html += '		<input id="paramKey9" name="paramKey9" type="text" style="width: 100%;" vali-text="링크 URL을 입력해주세요." maxlength="200" value="'+(data ?data.linkUrl :'')+'"/>';
				html += '	</td>';
				html += '</tr>';
			break;
			}
			
			return html;
		}
		
		function menu_type_child_call(value) {
			$('.menu_type_child').remove();
			$('#options_table').find('tr').last().after(menu_type_child_set(null, value));
			$('.join_select_call').select2();
		}
		
		function tree_btn_area_set(type, data) {
			var html = '';
			switch (type) {
			case 'Y':
				html += '<a onclick="fn_child_form();" style="cursor: pointer;" class="btn">하위 메뉴 등록</a>';
				if(data.block == 'F' || (data.block == 'T' && data.dataType != 'D')) {
					html += '<a onclick="fn_delete_menu();" style="cursor: pointer;" class="right btn delete">메뉴 삭제</a>';
					html += '<a onclick="fn_modify_menu();" style="cursor: pointer;" class="right btn">메뉴 수정</a>';					
				}
			break;
			case 'N':
				html += '<a onclick="fn_cancel_child();" style="cursor: pointer;" class="right btn cancel">취소</a>';
				html += '<a onclick="fn_regist_child();" style="cursor: pointer;" class="right btn">등록</a>';
			break;
			}
			return html;
		}
		
		function fn_child_form() {
			switch (activeNode.getLevel()) {
			case 1:
				var maxParent = parseInt("${maxParent}");
				if(maxParent != 0 && activeNode.getChildren() && activeNode.getChildren().length >= maxParent) {
					alert('최대 1차 메뉴 수는 '+maxParent+'입니다.');
					return;
				}
				break;
			default:
				var maxDepth = parseInt("${maxDepth}");
				if(maxDepth != 0 && activeNode.getLevel() >= maxDepth) {
					alert('최대 뎁스는 '+maxDepth+'차 까지 입니다.');
					return;
				}
				break;
			}
			
			var tree_gbn = $('#tree_gbn').html();
			$('#options_table').find('tbody').html(options_body_set(null));
			$('.join_select_call').select2();
			$('#tree_btn_area').html(tree_btn_area_set('N', null));
			$('#tree_gbn').html(tree_gbn+' [하위 메뉴 등록]');
		}
		
		function fn_regist_child() {
			if(fn_validation_check($('#cmmnForm'))) {
				var menuType = $('input[name=paramKey4]:checked').val();
				
				if(menuType == 'D' && ($('#paramKey5').val() == '/cmsManager/cms/contents.do' || $('#paramKey5').val() == '/cmsManager/cms/board.do' || $('#paramKey5').val() == '/contents.do' || $('#paramKey5').val() == '/board.do')) {
					alert('해당 URI는 사용하실 수 없습니다.');
					return;
				} else {
					fn_regist_act();
					/** URI 체크 사용 안함 **/
// 					if(menuType == "D") {
// 						fn_cmmn_ajax("${vo.selfPath}uriCheck.ajax", true, {'ajaxValue1':$('#'+activeNode.key).attr('idx'),'ajaxValue2': $('#paramKey5').val()}, 'text', uri_check_success);
// 					} else fn_regist_act();	
				}
				
			}
		}
		
		function uri_check_success(result) {
			if(result != 'Y') {
				alert('메뉴 URI가 등록되어 있습니다.');
				$('#paramKey5').focus();
			} else fn_regist_act();
		}
		
		function fn_regist_act() {
			if(confirm('하위 메뉴를 등록하시겠습니까?')) {
				if(activeNode.key == 'root') $('#paramKey10').val('0');
				else $('#paramKey10').val($('#'+activeNode.key).attr('idx'));
				
				fn_cmmn_form_ajax("${vo.selfPath}regist.ajax", true, new FormData($('#cmmnForm')[0]), 'json', regist, true, 500);
			}	
		}
		
		var increment_key = 1;
		function regist(result) {
			if(result) {
				activeNode.fromDict({folder: true});
				var childNode = activeNode.addChildren({key: "add_tree_"+(increment_key++),title: result.menuTitle});
				var node = $('#'+activeNode.key);
				
				var html = '';
				html += '<li ';
				html += 'id="'+childNode.key+'"';
				html += 'title="'+(result.menuTitle ?result.menuTitle :'')+'"';
				html += 'idx="'+(result.no ?result.no :'')+'"';
				html += 'useAt="'+(result.useAt ?result.useAt :'')+'"';
				html += 'gnbViewAt="'+(result.gnbViewAt ?result.gnbViewAt :'')+'"';
				html += 'sessionAt="'+(result.sessionAt ?result.sessionAt :'')+'"';
				html += 'tabAt="'+(result.tabAt ?result.tabAt :'')+'"';
				html += 'menuTitle="'+(result.menuTitle ?result.menuTitle :'')+'"';
				html += 'menuType="'+(result.menuType ?result.menuType :'')+'"';
				html += 'uri="'+(result.uri ?result.uri :'')+'"';
				html += 'linkType="'+(result.linkType ?result.linkType :'')+'"';
				html += 'linkUrl="'+(result.linkUrl ?result.linkUrl :'')+'"';
				html += 'boardCode="'+(result.boardCode ?result.boardCode :'')+'"';
				html += 'skin="'+(result.skin ?result.skin :'')+'"';
				html += 'block="'+(result.cmsAt == 'Y' && result.menuType == 'D'?'T' :'F')+'"';
// 				html += 'block="'+(result.uri.indexOf('/cmsManager/cms/') != -1 && !(result.uri == '/cmsManager/cms/contents.do' || result.uri == '/cmsManager/cms/board.do' || result.uri == '/contents.do' || result.uri == '/board.do')?'T' :'F')+'"';
				html += '>'+result.menuTitle;
				html += '</li>';
				
				if(node.find('ul').length > 0) node.find('ul').eq(0).append(html);				
				else node.html(node.html()+'<ul>'+html+'</ul>');
				
				fn_activate_node(activeNode);
				activeNode.setExpanded();
				fn_init_paramKey();
			} else {
				alert('서버 오류가 발생했습니다\n관리자에게 문의해주세요.');
			}
		}
		
		function fn_cancel_child() {
			fn_activate_node(activeNode);
		}
		
		function fn_delete_menu() {
			var children = new Array();
			children.push(activeNode);
			children = active_children(activeNode, children);
			
			var msg = children.length > 1 ?'하위 메뉴 모두 삭제됩니다.\n삭제하시겠습니까?' :'메뉴를 삭제하시겠습니까?';
			if(confirm(msg)) {
				var html = '';
				$.each(children, function(index, item){ html += '<input type="hidden" name="paramKeyList1" value="'+$('#'+item.key).attr('idx')+'"/>';});
				$('#arrayListArea').append(html);
				
				fn_cmmn_form_ajax("${vo.selfPath}delete.ajax", true, new FormData($('#cmmnForm')[0]), 'text', function(result) {
					if(result == 'Y') {
						var parentKey = activeNode.parent.key;
						
						activeNode.remove();
						
						$.ui.fancytree.getTree("#tree").getNodeByKey(parentKey).setActive();
						activeNode.fromDict({folder: (activeNode.getChildren() ?true :false)});
						fn_init_paramKey();
					}
				}, true, 500);
			}
		}
		
		function active_children(node, arr) {
			var children = node.getChildren();
			if(children) {
				for(var i=0; i<children.length; i++) {
					var child = children[i];
					if(child) {
						arr.push(child);
						active_children(child, arr);
					}
				}
			}
			return arr;
		}
		
		function fn_init_paramKey() {
			$('#idx').val('');
			$('#paramKey10').val('');
			$('#paramKey11').val('');
			$('#paramKey12').val('');
			$('#paramKey13').val('');
			$('#paramKey14').val('');
			
			$('#arrayListArea').html('');
		}
		
		function fn_modify_menu() {
			if(fn_validation_check($('#cmmnForm'))) {
				var menuType = $('input[name=paramKey4]:checked').val();
				
				if(menuType == 'D' && ($('#paramKey5').val() == '/cmsManager/cms/contents.do' || $('#paramKey5').val() == '/cmsManager/cms/board.do' || $('#paramKey5').val() == '/contents.do' || $('#paramKey5').val() == '/board.do')) {
					alert('해당 URI는 사용하실 수 없습니다.');
					return;
				} else {
					var msg = '메뉴를 수정하시겠습니까?';
					if(confirm(msg)) {
						var obj = $('#'+activeNode.key);
						$('#idx').val(obj.attr('idx'));
						fn_cmmn_form_ajax("${vo.selfPath}modify.ajax", true, new FormData($('#cmmnForm')[0]), 'text', function(result) {
							if(result == 'Y') {
								activeNode.fromDict({title: $('#paramKey3').val()+($('input[name=paramKey1]:checked').val() == 'N' ?' [미사용]' :'')});
								obj.attr('useAt', $('input[name=paramKey1]:checked').val());
								obj.attr('gnbViewAt', $('input[name=paramKey2]:checked').val());
								obj.attr('sessionAt', $('input[name=paramKey15]:checked').val());
								obj.attr('tabAt', $('input[name=paramKey16]:checked').val());
								obj.attr('title', $('#paramKey3').val());
								obj.attr('menuTitle', $('#paramKey3').val());
								obj.attr('menuType', $('#paramKey4').val());
								switch ($('#paramKey4').val()) {
									case "D":
										obj.attr('uri', $('#paramKey5').val());
										obj.attr('block', $('#paramKey5').val().indexOf('/cmsManager/cms/') != -1 && !($('#paramKey5').val() == '/cmsManager/cms/contents.do' || $('#paramKey5').val() == '/cmsManager/cms/board.do' || $('#paramKey5').val() == '/contents.do' || $('#paramKey5').val() == '/board.do') ?'T' :'F');
									break;
									case "C":
										obj.attr('boardCode', $('#paramKey6').val());
										obj.attr('skin', $('#paramKey7').val());
									break;
									case "B":
										obj.attr('boardCode', $('#paramKey6').val());
										obj.attr('skin', $('#paramKey7').val());
									break;
									case "L":
										obj.attr('linkType',  $('input[name=paramKey8]:checked').val());
										obj.attr('linkUrl', $('#paramKey9').val());
									break;
								}
								fn_init_paramKey();
								fn_activate_node(activeNode);
							}
						}, true, 500);
					}
				}
			}
		}
		
		function fn_move_tab(obj) {
			$('#tabPos').val($('.tabOption').index(obj)+1);
			$('#cmmnForm').attr('action', "${vo.selfURI}");
			$('#cmmnForm').submit();
		}
		
		function fn_site_info(val) {
			var siteInfo = val.split('|');
			$('#searchValue1').val(siteInfo[0]);
			$('#searchValue2').val(siteInfo[1]);
			$('#cmmnForm').attr('action', "${vo.selfURI}");
			$('#cmmnForm').submit();
		}
	</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<form:hidden path="tabPos"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<input type="hidden" id="idx" name="idx"/>
<input type="hidden" id="paramKey10" name="paramKey10"/>
<input type="hidden" id="paramKey11" name="paramKey11"/>
<input type="hidden" id="paramKey12" name="paramKey12"/>
<input type="hidden" id="paramKey13" name="paramKey13"/>
<input type="hidden" id="paramKey14" name="paramKey14"/>
<div id="arrayListArea"></div>
	<div class="tab mb_20" style="display: flex; justify-content: space-between; align-items: flex-end;">
		<ul>
			<li <c:if test="${vo.tabPos eq '1'}">class="on"</c:if>><a class="tabOption" onclick="fn_move_tab(this);" style="cursor: pointer;">사용자 메뉴</a></li>
			<li <c:if test="${vo.tabPos eq '2'}">class="on"</c:if>><a class="tabOption" onclick="fn_move_tab(this);" style="cursor: pointer;">관리자 메뉴</a></li>
		</ul>
		
		<select id="siteInfoSelector" class="join_select1" style="height: 100%; width: 250px;" onChange="fn_site_info(this.value);">
			<c:forEach items="${admSession.siteInfo}" var="site">
				<c:forEach items="${site.value.langCode}" var="lang">
					<option value="${site.value.siteCode}|${lang.value.langCode}" <c:if test="${site.value.siteCode eq vo.searchValue1 and lang.value.langCode eq vo.searchValue2}">selected="selected"</c:if>><c:out value="${site.value.siteTxt} - ${lang.value.langTxt}"/></option>
				</c:forEach>
			</c:forEach>
		</select>
	</div>
	
	<fieldset id="tree_fieldset" class="tree">
		<legend id="tree_title">[ 메뉴 목록 ]</legend>
		<legend id="tree_language_title"></legend>
		<div id="tree">
			<ul id="treeData" style="display: none;">
				<li id="root" class="folder"><c:out value="${vo.tabPos eq '1' ?'사용자' :'관리자'}"/><ul>
				<c:forEach items="${menuTreeSet}" var="menu" varStatus="status">
					<c:choose>
						<c:when test="${menu.point eq 'S' or menu.point eq 'ES'}">
							<li 
								id="tree_${status.count}" 
								title="${menu.menuTitle}${menu.useAt eq 'N'?' [미사용]' :''}" 
								class="folder"
								
								idx="${menu.no}"
								useAt="${menu.useAt}"
								gnbViewAt="${menu.gnbViewAt}"
								sessionAt="${menu.sessionAt}"
								tabAt="${menu.tabAt}"
								menuTitle="${menu.menuTitle}"
								menuType="${menu.menuType}"
								uri="${menu.oriUri}"
								linkType="${menu.linkType}"
								linkUrl="${menu.linkUrl}"
								boardCode="${menu.boardCode}"
								skin="${menu.skin}"
								block="${menu.cmsAt eq 'Y' and menu.menuType eq 'D' ?'T' :'F'}"
<%-- 								block="${fn:indexOf(menu.uri, '/cmsManager/cms/') != -1 and not (menu.uri eq '/cmsManager/cms/contents.do' or menu.uri eq '/cmsManager/cms/board.do' or menu.uri eq '/contents.do' or menu.uri eq '/board.do')?'T' :'F'}" --%>
							><c:out value="${menu.menuTitle}${menu.useAt eq 'N'?' [미사용]' :''}"/><ul>
						</c:when>
						<c:when test="${menu.point eq 'E'}">
							<li 
								id="tree_${status.count}" 
								title="${menu.menuTitle}${menu.useAt eq 'N'?' [미사용]' :''}" 
								
								idx="${menu.no}"
								useAt="${menu.useAt}"
								gnbViewAt="${menu.gnbViewAt}"
								sessionAt="${menu.sessionAt}"
								tabAt="${menu.tabAt}"
								menuTitle="${menu.menuTitle}"
								menuType="${menu.menuType}"
								uri="${menu.oriUri}"
								linkType="${menu.linkType}"
								linkUrl="${menu.linkUrl}"
								boardCode="${menu.boardCode}"
								skin="${menu.skin}"
								block="${menu.cmsAt eq 'Y' and menu.menuType eq 'D' ?'T' :'F'}"
<%-- 								block="${fn:indexOf(menu.uri, '/cmsManager/cms/') != -1 and not (menu.uri eq '/cmsManager/cms/contents.do' or menu.uri eq '/cmsManager/cms/board.do' or menu.uri eq '/contents.do' or menu.uri eq '/board.do')?'T' :'F'}" --%>
							><c:out value="${menu.menuTitle}${menu.useAt eq 'N'?' [미사용]' :''}"/>
							<c:forEach begin="1" end="${menu.eCnt}"></ul></c:forEach>
						</c:when>
						<c:otherwise>
							<li 
								id="tree_${status.count}" 
								title="${menu.menuTitle}${menu.useAt eq 'N'?' [미사용]' :''}" 
								
								idx="${menu.no}"
								useAt="${menu.useAt}"
								gnbViewAt="${menu.gnbViewAt}"
								sessionAt="${menu.sessionAt}"
								tabAt="${menu.tabAt}"
								menuTitle="${menu.menuTitle}"
								menuType="${menu.menuType}"
								uri="${menu.oriUri}"
								linkType="${menu.linkType}"
								linkUrl="${menu.linkUrl}"
								boardCode="${menu.boardCode}"
								skin="${menu.skin}"
								block="${menu.cmsAt eq 'Y' and menu.menuType eq 'D' ?'T' :'F'}"
<%-- 								block="${fn:indexOf(menu.uri, '/cmsManager/cms/') != -1 and not (menu.uri eq '/cmsManager/cms/contents.do' or menu.uri eq '/cmsManager/cms/board.do' or menu.uri eq '/contents.do' or menu.uri eq '/board.do')?'T' :'F'}" --%>
							><c:out value="${menu.menuTitle}${menu.useAt eq 'N'?' [미사용]' :''}"/>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</ul>
			</ul>
		</div>
	</fieldset>
	
	<fieldset id="options_fieldset" class="options">
		<legend id="options_title"></legend>
		<legend id="tree_language_title"></legend>
		<div id="options">
			<table id="options_table" class="board_write basic">
				<caption>메뉴 등록 정보</caption>
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 80%;">
				</colgroup>
				<tbody></tbody>
			</table>
		</div>
		
		<div id="tree_btn_area" class="tree_btn_area">
		</div>
	</fieldset>
</form:form>
</body>