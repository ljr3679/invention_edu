<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- admin_contents_left start -->
<div class="admin_contents_left">
	<!-- admin_left_menu -->
	<ul class="admin_left_menu">
		<li>
			<a href="javascript:void(0);" onclick="return false;" class="on"><span class="ico"><i class="xi-list-dot xi-fw"></i></span><c:out value="${menuTree[admSession.topMenuList[admSession.topMenuCnt-1].menuPos].menuTitle}" escapeXml="false"/></a>
			<ul class="admin_left_menu2">
				<c:forEach items="${depthTree[admSession.topMenuList[admSession.topMenuCnt-1].sort-1]}" var="menu" varStatus="status">
				<c:set var="menuAuth" value="auth_${menu.no}"/>
					<c:if test="${!status.first}">
						<c:set var="deleteMenu" value="${menu.useAt eq 'N' or admSession.menuList.indexOf(menuAuth) eq -1}"/>
						<li <c:if test="${deleteMenu}">menu_delete="Y" style="display: none;"</c:if>>
							<c:choose>
								<c:when test="${menu.menuType eq 'L'}">
									<c:choose>
										<c:when test="${menu.linkType eq 'Y'}"><c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/></c:when>
										<c:otherwise><c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot;"/></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${menu.children gt 0}"><c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('/cmsManager/${admSession.mSiteCode}/${admSession.mLangCode}/folder.act', '${menu.menuPos}');&quot;"/></c:when>
										<c:otherwise><c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('${menu.uri}', '${menu.menuPos}');&quot;"/></c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
							<a ${aTagAttr} <c:if test="${menu.no eq admSession.menu.no}">class="on"</c:if>>
								<c:choose>
									<c:when test="${menu.depth ge 3 and menu.children ge 1 and cFn:arrIndexOf(admSession.topMenuPosList, menu.menuPos) eq -1}">+</c:when>
									<c:when test="${menu.depth ge 3 and menu.children ge 1 and cFn:arrIndexOf(admSession.topMenuPosList, menu.menuPos) ne -1}">-</c:when>
								</c:choose>
								<c:out value="${menu.menuTitle}" escapeXml="false"/>
							</a>
							
						<c:choose>
							<c:when test="${menu.point eq 'S' or menu.point eq 'ES'}"><ul class="admin_left_menu${menu.depth+1} menu_sub_list <c:if test="${cFn:arrIndexOf(admSession.topMenuPosList, menu.menuPos) eq -1}">close</c:if>"></c:when>
							<c:when test="${menu.point eq 'E'}"><c:forEach begin="1" end="${menu.eCnt}"></ul></c:forEach></c:when>
						</c:choose>
					</c:if>
				</c:forEach>
			</ul>
		</li>
	</ul>
	<!-- // admin_left_menu -->
					
	<button type="button" class="lm_toggle_btn"><span class="hide">주 메뉴 열기/닫기</span></button>
	<script type="text/javascript">
		checkCookie();
						
		/* lm_cookie */	
		function setCookie(cname, cvalue, exdays){
			var d = new Date();
			d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
			var expires = "expires="+d.toUTCString();
			document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
		}

		function getCookie(cname){
			var name = cname + "=";
			var ca = document.cookie.split(';');
			for(var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') {
					c = c.substring(1);
				}
				if (c.indexOf(name) == 0) {
					return c.substring(name.length, c.length);
				}
			}
			return "";
		}
						
		var chk_lm_cookie;
		function checkCookie(){
			chk_lm_cookie = getCookie("lm_cookies");
			if (chk_lm_cookie != "") {}
			else {
				setCookie("lm_cookies", "lm_on", 1);
			}
		}
						
		$(function(){
			/* init */
			var $adminLeftMenuLink1 = $(".admin_left_menu > li > a"),
			$adminContents = $(".admin_contents"),
			$lmToggleBtn = $(".lm_toggle_btn"),
			lmDelay = 200; /* admin_left_menu animation speed */			
							
			if(getCookie("lm_cookies") == "lm_off"){
				$adminContents.addClass("lm_off lm_off_init");
			}
			$adminContents.css({visibility:"visible"});
							
			/* admin_left_menu */
			$adminLeftMenuLink1.click(function(){
				if($(this).attr("href") == "#"){
					if(!$adminContents.hasClass("lm_off")){
						if(!$(this).hasClass("on")){
							$adminLeftMenuLink1.removeClass("on");
							$(".admin_left_menu2").stop(true,true).slideUp(lmDelay);
							$(this).addClass("on");
							$(this).parent().find(".admin_left_menu2").stop(true,true).slideDown(lmDelay);
						}else{
							$(this).removeClass("on");
							$(this).parent().find(".admin_left_menu2").stop(true,true).slideUp(lmDelay);
						}
						return false;
					}else{
						$adminLeftMenuLink1.removeClass("on");
						$(this).addClass("on");
						delayLmDown();
					}
				}
								
				setCookie("lm_cookies", "lm_on", 1);
			});
						
			$adminLeftMenuLink1.each(function(index){
				if($(this).hasClass("on")){
					if(!$adminContents.hasClass("lm_off")){
						$(this).siblings(".admin_left_menu2").show();
					}else{
						$(this).siblings(".admin_left_menu2").hide();
					}
				}
			});
							
			/* lm_toggle_btn */
			$lmToggleBtn.click(function(){
				if(!$adminContents.hasClass("lm_off")){
					lmOff();
					setCookie("lm_cookies", "lm_off", 1);
				}else{
					delayLmDown();
					setCookie("lm_cookies", "lm_on", 1);
				}
			});
							
			function lmOff(){
				if( ($(".admin_left_menu > li > a.on").length != 0) && !$(".admin_left_menu > li.li01 > a").hasClass("on") ){
					$(".admin_left_menu2").stop(true,true).slideUp(lmDelay);
					setTimeout(function(){
						$(".admin_logo").addClass("off");
						$adminContents.addClass("lm_off");
					}, lmDelay);
				}else{
					$(".admin_logo").addClass("off");
					$adminContents.addClass("lm_off");
				}
			}
			
			function delayLmDown(){
				$(".admin_logo").removeClass("off");
				$adminContents.removeClass("lm_off lm_off_init");
				setTimeout(function(){
					$(".admin_left_menu > li > a.on").parent().find(".admin_left_menu2").stop(true,true).slideDown(lmDelay);
				}, lmDelay);
			}
							
		});
	</script>
</div>
<!-- // admin_contents_left end -->