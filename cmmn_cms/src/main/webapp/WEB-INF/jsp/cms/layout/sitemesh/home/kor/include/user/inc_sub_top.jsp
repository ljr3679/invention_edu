<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<div class="sub_top">
<div class="bread_box">
		<div class="container">
			<ul class="breadcrumb clearfix">
				<li class="home">
					<a href="/"><img src="/images/home/kor/user/common/home.png" alt="홈으로"></a>
					<span class="icon_mob_home">홈</span>
				</li>
				<li class="com_depth depth1">
					<a class="text" href="${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-1].menuPos].uri}?menuPos=${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-1].menuPos].menuPos}" class="text"><c:out value="${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-1].menuPos].menuTitle}" escapeXml="false"/></a>
					<ul id="depth1MenuList" class="depth_list">
						<c:forEach items="${menuTree}" var="menu" varStatus="status">
							<c:if test="${menu.depth eq 1 and menu.gnbViewAt eq 'Y' and menu.useAt eq 'Y'}">
								<c:choose>
									<c:when test="${menu.children gt 0}">
										<c:choose>
											<c:when test="${menu.menuType eq 'C'}">
												<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('/${vo.siteCode}/${vo.langCode}/folder.act', '${menu.menuPos}');&quot;"/>	
											</c:when>
											<c:otherwise>
												<c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${menu.menuType eq 'C'}">
												<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('${menu.uri}', '${menu.menuPos}');&quot;"/>	
											</c:when>
											<c:otherwise>
												<c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<li><a ${aTagAttr} class="text">${menu.menuTitle}</a></li>	
							</c:if>
						</c:forEach>
					</ul>
					
					<script type="text/javascript">
						var depth1Length = $('#depth1MenuList').find('li').length;
					</script>
				</li>
				<c:if test="${not empty menuTree[menuSession.topMenuList[menuSession.topMenuCnt-2].menuPos].menuTitle}">
				<li class="com_depth depth2">
					<a class="text" href="${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-2].menuPos].uri}?menuPos=${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-2].menuPos].menuPos}" class="text"><c:out value="${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-2].menuPos].menuTitle}" escapeXml="false"/></a>
					<ul id="depth2MenuList" class="depth_list">
						<c:forEach items="${menuTree}" var="menu" varStatus="status">
							<c:if test="${menu.depth eq 2 and menu.parent eq menuTree[menuSession.topMenuList[menuSession.topMenuCnt-1].menuPos].no and menu.useAt eq 'Y'}">
								<c:choose>
									<c:when test="${menu.children gt 0}">
										<c:choose>
											<c:when test="${menu.menuType ne 'L'}">
												<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('/${vo.siteCode}/${vo.langCode}/folder.act', '${menu.menuPos}');&quot;"/>	
											</c:when>
											<c:otherwise>
												<c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${menu.menuType ne 'L'}">
												<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('${menu.uri}', '${menu.menuPos}');&quot;"/>	
											</c:when>
											<c:otherwise>
												<c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<li><a ${aTagAttr} class="text">${menu.menuTitle}</a></li>	
							</c:if>
						</c:forEach>
					</ul>
					<script type="text/javascript">
						var depth2Length = $('#depth2MenuList').find('li').length;
					</script>
				</li>
				</c:if>
				<c:if test="${not empty menuTree[menuSession.topMenuList[menuSession.topMenuCnt-3].menuPos].menuTitle}">
					<li class="com_depth depth3">
						<a class="text" href="${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-3].menuPos].uri}?menuPos=${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-3].menuPos].menuPos}" class="text"><c:out value="${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-3].menuPos].menuTitle}" escapeXml="false"/></a>
						<ul id="depth3MenuList" class="depth_list">
							<c:forEach items="${menuTree}" var="menu" varStatus="status">
								<c:if test="${menu.depth eq 3 and menu.parent eq menuTree[menuSession.topMenuList[menuSession.topMenuCnt-2].menuPos].no and menu.useAt eq 'Y'}">
									<c:choose>
										<c:when test="${menu.children gt 0}">
											<c:choose>
												<c:when test="${menu.menuType ne 'L'}">
													<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('/${vo.siteCode}/${vo.langCode}/folder.act', '${menu.menuPos}');&quot;"/>	
												</c:when>
												<c:otherwise>
													<c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${menu.menuType ne 'L'}">
													<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('${menu.uri}', '${menu.menuPos}');&quot;"/>	
												</c:when>
												<c:otherwise>
													<c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									<c:if test="${menu.menuPos eq cFn:arrIndexOf(menuIdxList, 'menu128')}">
										<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;whitePaperDown();&quot;"/>
									</c:if>
									<li><a ${aTagAttr} class="text">${menu.menuTitle}</a></li>	
								</c:if>
							</c:forEach>
						</ul>
						<script type="text/javascript">
							var depth3ength = $('#depth3MenuList').find('li').length;
						</script>
					</li>
				</c:if>
			</ul>
			<ul class="btn_list">
				<li class="share">
				    <a href="#" title="SNS 노출 버튼">SNS</a>
					<ul class="sub_share_box">
						<li class="facebook"><a href="#" onclick="SnsShare.fbShare(document.location.href); return false;"><i class="xi-facebook"></i><span class="hide">페이스북으로 공유</span></a></li>
						<li class="twitter"><a href="#" onclick="SnsShare.twShare(document.title, document.location.href); return false;"><i class="xi-twitter"></i><span class="hide">트위터로 공유</span></a></li>
						<li class="kakaostory"><a href="#" onclick="SnsShare.storyShare(document.location.href); return false;"><i class="xi-kakaostory"></i><span class="hide">카카오스토리로 공유</span></a></li>
						<li class="blog"><a href="#" onclick="SnsShare.blogShare(document.title, document.location.href); return false;"><i class="xi-naver-square"></i><span class="hide">네이버블로그로 공유</span></a></li>
					</ul>
				</li>
				<li class="print"><a href="#" title="프린트 노출 버튼">프린트</a></li>
			</ul>
		</div>
	</div>
</div>
	<!-- // bread_box -->
<script type="text/javascript">


	if($(".bread_box .breadcrumb > li").length > 3){
		$(".bread_box .breadcrumb").addClass("depth3");
	}

	$(function(){
		var speed = 300,
		easing = "easeOutQuint";


		$(".bread_box .breadcrumb > li > a").click(function(e){
			var winW = $(window).innerWidth();
			if (winW > 767) {
				if(!$(this).parent("li").hasClass("home")){
					if($(this).next(".depth_list").is(":hidden")){
						$(".bread_box .breadcrumb > li").removeClass("on");
						$(".depth_list:visible").slideUp(speed, easing);
						$(this).parent("li").addClass("on");
						$(this).next(".depth_list").slideDown(speed, easing);
					}
					else{
						$(this).parent("li").removeClass("on");
						$(this).next(".depth_list").slideUp(speed, easing);
					}
					return false;
				}	
			} else {
				e.preventDefault();
			}
			
		});

		$('.print > a').focus(function(){
			$(".depth2").removeClass('on');
			$("#depth2MenuList").slideUp(speed, easing);

		});

		$(".bread_box .btn_list > li.share").click(function(){
			if($(this).find(".sub_share_box").is(":hidden")){
				$(".sub_share_box:visible").hide();
				$(this).find("> a").addClass("on");
				$(this).find(".sub_share_box").show();
			}else{
				$(this).find("> a").removeClass("on");
				$(this).find(".sub_share_box").hide();
			}
		});

		$(".sub_share_box li.blog a").blur(function(){
			$(this).closest(".sub_share_box").hide();
			$(".bread_box .btn_list > li.share > a").removeClass("on")
		});

		// 프린트버튼
		$(".bread_box .btn_list > li.print > a").click(function(){
			window.print();
			return false;
		});
		
	});
</script>