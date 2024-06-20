<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<!-- MENU TREE -->
	<script type="text/javascript" src="/js/cmmn/fancytree/fancytree.js"></script>
	
	<link href="/css/cmmn/fancytree/ui.fancytree.min.css" rel="stylesheet">
	<link href="/css/cmmn/admin/admin_fancytree.css" rel="stylesheet">
	<!-- MENU TREE -->
	<script type="text/javascript" defer="defer">
		$(function(){
			$.each($('.menu_tree_viewer'), function(index, item) {
				$(item).fancytree({
		    		init: function(event, data) {
						if(index == 0) $('#options_fieldset').css({'height': $('#tree_fieldset').css('height')});
						<c:forEach items="${resultData.menuList}" var="item">
						var node = $.ui.fancytree.getTree('#'+$(item).attr('id')).getNodeByKey("${item}");
						if(node && !node.getChildren()) $.ui.fancytree.getTree('#'+$(item).attr('id')).getNodeByKey("${item}").setSelected(true);
						</c:forEach>

				    	$.ui.fancytree.getTree('#'+$(item).attr('id')).expandAll();
					},
		    		debugLevel: 1,
		    		tooltip: false,
		    		checkbox: true,
		    		selectMode: 3
				});
		    });
		});
		
		function fn_edit() {
			if(fn_validation_check($('#cmmnForm'))) {
				var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
				if(confirm(msg+' 하시겠습니까?')) {
					var authData = '';
					
					$.each($('.menu_tree_viewer'), function(index, item) {
						$.each($.ui.fancytree.getTree('#'+$(item).attr('id')).getCheckedNodes(), function(index, item2) {
							if(item2.key != 'root' && $.ui.fancytree.getTree('#'+$(item).attr('id')).getRootNode() != item2) {
								authData += item2.key+',';
							}
						});
					});
					
					
					if(!authData) {
						alert('1개 이상의 메뉴를 선택해주세요.');
						return;
					}
					
					$('input[name=paramKey1]').val(authData.substring(0, authData.length-1));
					$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
					$('#cmmnForm').submit();
				}	
			}
		}
		
		function fn_cancel() {
			$('#act').val('');
			$('#idx').val('');
			$('#cmmnForm').attr('action', '${vo.selfPath}menuAuthorityMng.do');
			$('#cmmnForm').submit();
		}
		
		function fn_site_menu(val) {
			$('.menu_tree_viewer').removeClass('active');
			$('.menu_tree_viewer[siteKey="'+val+'"]').addClass('active');
		}
	</script>
	<style>
		.menu_tree_viewer{ display: none; }
		.menu_tree_viewer.active{ display: block !important; }
	</style>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="act"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchKeyword"/>
<input type="hidden" name="idx" value="${resultData.no}"/>
<input type="hidden" name="paramKey1" />
<c:set var="currentInfo" value="${admSession.mSiteCode}_${admSession.mLangCode}"/>

	<div class="tab mb_20" style="display: flex; justify-content: space-between; align-items: flex-end;">
		<select id="siteInfoSelector" class="join_select1" style="height: 100%; width: 250px;" onChange="fn_site_menu(this.value);">
			<c:forEach items="${admSession.siteInfo}" var="site">
				<c:forEach items="${site.value.langCode}" var="lang">
					<option value="${site.value.siteCode}_${lang.value.langCode}" <c:if test="${site.value.siteCode eq vo.searchValue1 and lang.value.langCode eq vo.searchValue2}">selected="selected"</c:if>><c:out value="${site.value.siteTxt} - ${lang.value.langTxt}"/></option>
				</c:forEach>
			</c:forEach>
		</select>
	</div>
	
	<fieldset id="tree_fieldset" class="tree">
		<legend id="tree_title">[ 메뉴 목록 ]</legend>
		<c:if test="${fn:length(langCode) gt 1}">
		<legend id="tree_language_title">
			<c:forEach items="${langCode}" var="lang">
				<a class="menu_tree_tab<c:if test="${lang.langCode eq admSession.mLangCode}"> active</c:if>" onClick="fn_menu_language(this);"><c:out value="[${lang.langTxt}]"/></a>
			</c:forEach>
		</legend>
		</c:if>
		
		<c:forEach items="${allAdminMenuTree}" var="adminMenuTreeSet" varStatus="status2">
		<div id="tree${status2.count}" class="menu_tree_viewer<c:if test="${adminMenuTreeSet.key eq currentInfo}"> active</c:if>" siteKey="${adminMenuTreeSet.key}">
			<ul id="treeData" style="display: none;">
				<li id="root" class="folder"><c:out value="관리자"/><ul>
				<c:forEach items="${adminMenuTreeSet.value}" var="menu" varStatus="status">
					<c:choose>
						<c:when test="${menu.point eq 'S' or menu.point eq 'ES'}">
							<li 
								id="auth_${menu.no}" 
								title="${menu.menuTitle}" 
								class="folder"
								idx="${menu.no}"
								<c:if test="${menu.useAt eq 'N'}">menu_delete="Y" style="display: none;"</c:if>
							><c:out value="${menu.menuTitle}"/><ul>
						</c:when>
						<c:when test="${menu.point eq 'E'}">
							<li 
								id="auth_${menu.no}" 
								title="${menu.menuTitle}" 
								idx="${menu.no}"
								<c:if test="${menu.useAt eq 'N'}">menu_delete="Y" style="display: none;"</c:if>
							><c:out value="${menu.menuTitle}"/>
							<c:forEach begin="1" end="${menu.eCnt}"></ul></c:forEach>
						</c:when>
						<c:otherwise>
							<li 
								id="auth_${menu.no}" 
								title="${menu.menuTitle}" 
								idx="${menu.no}"
								<c:if test="${menu.useAt eq 'N'}">menu_delete="Y" style="display: none;"</c:if>
							><c:out value="${menu.menuTitle}"/>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</ul>
			</ul>
		</div>
		</c:forEach>
	</fieldset>
	
	<fieldset id="options_fieldset" class="options">
		<legend id="options_title">[ 등록 정보 ]</legend>
		<c:if test="${fn:length(siteLanguage) gt 1}">
		<legend id="tree_language_title">&nbsp;</legend>
		</c:if>
		<div id="options">
			<table id="options_table" class="board_write basic">
				<caption>권한 등록 정보</caption>
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 80%;">
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
					</tr>
					<tr>
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
					</tr>
					<tr>
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
						<th scope="row">권한명<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
						<td>
							<input type="text" name="title" vali-text="권한명을 입력해주세요." style="width: 100%;" value="${resultData.title}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div id="tree_btn_area" class="tree_btn_area">
			<a onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">취소</a>
			<a onclick="fn_edit();" style="cursor: pointer;" class="right btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
		</div>
	</fieldset>
</form:form>

	<!-- Start : layer-popup content -->
	<div id="layer" class="layer-wrap">
	    <div class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <!--content //-->
	                <h1 class="pop-layer-title">- 다운로드 사유 -</h1>
	                <textarea class="vali" id="downReason" name="downReason" style="width: 500px; height: 200px;" vali-text="다운로드 사유를 입력해주세요."></textarea>
	                <div class="btn-r">
	                    <a href="#" onClick="fn_download();" class="btn-layerClose">제출</a>
	                    <a href="#" onClick="fn_layer_close();" class="btn-layerClose">닫기</a>
	                </div>
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End : layer-popup content -->
</body>