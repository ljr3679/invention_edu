<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->

<div class="header">
	<!-- skip_navi -->
	<dl class="skip_navi">
		<dt class="hide"><strong>바로가기 메뉴</strong></dt>
		<dd><a href="#real_contents">본문 바로가기</a></dd>
		<dd><a href="#gnb">주메뉴 바로가기</a></dd>
	</dl>
	<!-- // skip_navi -->
   <script>
		$(document).ready(function () {
			getCookieMobile();

		});

		function loginPop() {
			//var loginWindow = window.open('https://www.kipa.org/kipasso/loginForm.kipa?url=http://localhost:8080/common/sso/login.do', '로그인', 'width=1062px,height=595px');
			var loginWindow = window.open('/common/sso/login.do', '로그인', 'width=1062px,height=595px');
			loginWindow.focus();
		}
		
		function login() {
			location.reload();
		}
		
		var head_slide = $('#head_slide');
		head_slide.slick({
			slidesToShow: 1, // 슬라이드 show 갯수
			slidesToScroll: 1,
			infinite: true, // 무한슬라이드
			dots: true, // 슬라이드 점표시
			speed: 500,
			arrows: false, // 슬라이드 좌우 움직임 화살표 표시
			autoplay: true, // 자동 슬라이드 넘김
			autoplaySpeed: 5000, // 자동 슬라이드 넘김 타이밍
			adaptiveHeight: true
		});

		$('.head_popzon .popzon_box .nav_box .play_btn_box .play').click(function () {
			$(this).hide();
			$('.head_popzon .popzon_box .nav_box .play_btn_box .stop').show();
			head_slide.slick('slickPlay');
		});

		$('.head_popzon .popzon_box .nav_box .play_btn_box .stop').click(function () {
			$(this).hide();
			$('.head_popzon .popzon_box .nav_box .play_btn_box .play').show();
			head_slide.slick('slickPause');
		});

		var items = $("#head_slide .slick-dots li").length;
		$(".nav_box .num .now").text("1");
		$(".nav_box .num .total").text(items);

		head_slide.on('afterChange', function (event, slick, direction) {
			var item = $(event.currentTarget).find(".slick-dots .slick-active").index();
			$(".nav_box .num .now").text(item + 1);
		});

		$(".nav_box .nav").click(function () {
			if ($(this).hasClass("prev")) {
				head_slide.slick('slickPrev');
			}
		});

		$(".nav_box .nav").click(function () {
			if ($(this).hasClass("next")) {
				head_slide.slick('slickNext');
			}
		});

		function fnLayerClose() {
			$(".popzon_btn").addClass("on");
			$(".header").addClass("pop_non");
			$(".head_popzon").slideToggle(500);
			if ($("#stop_view").prop('checked')) {
				setCookieMobile("head_popzon", "done", 1);
			} else {
				deleteCookie('head_popzon');
			}
			/* $(".head_popzon").hide(); */

		}

		function checkedToday() {
			if ($("#stop_view").prop('checked')) setCookieMobile("head_popzon", "done", 1);
			else deleteCookie('head_popzon');
		}

		function setCookieMobile(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}

		function getCookieMobile() {
			var cookiedata = document.cookie;
			if (cookiedata.indexOf("head_popzon=done") < 0) {
				$(".head_popzon").show();
				$(".popzon_btn").removeClass("on");
				$(".header").removeClass("pop_non");
				// head_slide.slick('setPosition');
				$("#popupText").text("팝업존 닫기");
			} else {
				$("#popupText").text("팝업존 열기");
				$(".popzon_btn").addClass("on");
				$(".header").addClass("pop_non");
				$(".head_popzon").hide();
			}
		}

		var deleteCookie = function (name) {
			document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
		}
		getCookieMobile();

		function fn_pop_show() {
			if ($('.head_popzon').is(':visible') == true) {
				$(".popzon_btn").addClass("on");
				$(".header").addClass("pop_non");
				$(".head_popzon").hide();
				$("#popupText").text("팝업존 열기");
				$("#popupText").addClass("on");
			} else {
				$(".head_popzon").show();
				$(".popzon_btn").removeClass("on");
				$(".header").removeClass("pop_non");
				head_slide.slick('setPosition');
				$("#popupText").text("팝업존 닫기");
				$("#popupText").removeClass("on");

				var cookiedata = document.cookie;
				if (cookiedata.indexOf("head_popzon=done") > 0) $('#stop_view').attr('checked', 'checked');

				/* deleteCookie('head_popzon'); */
			}
		}
		
		function whitePaperDown() {
			var frm = document.cmmnFileDownForm;
		   	frm.action = '/paperDownload.do';
		   	frm.submit();
		}

	</script>
	
    <!-- header_top -->
	<div class="header_top_box">
		<div class="container2">
			<div class="inner">
				<div class="link_box">
					<a href="//www.kipo.go.kr" target="_blank" title="특허청 바로가기(새창)"><img src="/images/home/kor/user/common/header_top_logo1.jpg" alt="특허청 "></a>
					<a href="//www.kipa.org/kipa/index.jsp" target="_blank" title="한국발명진흥회 바로가기(새창)"><img src="/images/home/kor/user/common/header_top_logo2.jpg" alt="한국발명진흥회 "></a>
					<a href="//www.gbe.kr/ieec/main.do" target="_blank" title="발명체험교육관 바로가기(새창)"><img src="/images/home/kor/user/common/header_top_logo3.jpg" alt="발명둥지"></a>
				</div>
				<c:choose>
					<c:when test="${empty usrSession}">
						<div class="inner_list">
							<ul class="list">
								<li class="icon01"><a href="/"><span class="text">HOME</span></a></li>
								<li class="icon02">
									<a href="javascript:void(0);" onclick="loginPop()" title="로그인">
										<span class="text">로그인</span>
									</a>
								</li>
								<li class="icon03">
									<a href="https://www.kipa.org/kipasso/member/join.kipa?user_div=cpu" target="_blank">
										<span class="text">회원가입</span>
									</a>
								</li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="inner_list">
							<ul class="list">
								<li class="icon01"><a href="/"><span class="text">HOME</span></a></li>
								<li class="icon02">
									<a href="/common/sso/logout.act" title="로그아웃">
										<span class="text">로그아웃</span>
									</a>
								</li>
								<li class="icon03">
									<a href="https://www.kipa.org/kipasso/mypage/viewMyinfo.kipa" target="_blank">
										<span class="text">정보수정</span>
									</a>
								</li>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- // header_top -->
	
	<!-- gnb_header -->
	<div class="gnb_header">
		<div class="clearfix">
            <div class="logo"><a href="/"><img src="/images/home/kor/user/common/logo.png" alt=""></a></div>
            
			<!-- gnb -->
			<div id="gnb" class="depth1">
				<ul class="clearfix">
					<c:set var="gnbMenuCnt" value="0"/>
					<c:forEach items="${menuTree}" var="menu" varStatus="status">
						<c:set var="subClass" value=""/>
						<c:choose>
							<c:when test="${menu.menuType eq 'L'}">
								<c:choose>
									<c:when test="${menu.linkType eq 'Y'}"><c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/></c:when>
									<c:otherwise><c:set var="aTagAttr" value="href=&quot;${menu.linkUrl}&quot;"/></c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${menu.children gt 0}"><c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('/${vo.siteCode}/${vo.langCode}/folder.act', '${menu.menuPos}');&quot;"/></c:when>
									<c:when test="${menu.menuPos eq cFn:arrIndexOf(menuIdxList, 'menu128')}">
										<c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;whitePaperDown();&quot;"/>
									</c:when>
									<c:otherwise><c:set var="aTagAttr" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('${menu.uri}', '${menu.menuPos}');&quot;"/></c:otherwise>
								</c:choose>
							</c:otherwise> 
						</c:choose>
						
						<c:set var="deleteMenu" value="${menu.depth eq 1 ?'menu_delete=&quot;Y&quot;' :'parent_delete=&quot;Y&quot;'}"/>

						<c:choose>
							<c:when test="${menu.depth eq 1}">
								<c:set var="gnbMenuCnt" value="${gnbMenuCnt+1}"/>
								<c:set var="gnbMenus" value="class=&quot;gnb_menu${gnbMenuCnt}&quot;"/>
							</c:when>
							<c:when test="${menu.point eq 'ES'}">
								<c:set var="gnbMenus" value="class=&quot;has_sub&quot;"/>
							</c:when>
							<c:otherwise><c:set var="gnbMenus" value=""/></c:otherwise>
						</c:choose>
						
						<li ${gnbMenus}  <c:if test="${menu.gnbViewAt eq 'N' or menu.useAt eq 'N' or (empty usrSession and menu.sessionAt eq 'R') or (not empty usrSession and menu.sessionAt eq 'N')}">${deleteMenu}</c:if>>
						<a <c:if test="${menu.depth eq 1}">class="depth1_link"</c:if> ${aTagAttr}><c:out value="${menu.menuTitle}" escapeXml="false"/></a>
						<c:choose>
							<c:when test="${menu.point eq 'S' or menu.point eq 'ES'}">
								<c:choose>
									<c:when test="${menu.depth > 1}">
										<div>
											<div class="depth3">
												<ul>
									</c:when>
									<c:otherwise>
										<div class="gnb_block" style="display: none;">
											<div class="depth2">
												<div class="head">
													<div class="menu_title"><c:out value="${menu.menuTitle}" escapeXml="false"/></div>
												</div>
												<ul>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${menu.point eq 'E'}"><c:forEach begin="1" end="${menu.eCnt}"></ul></div></div></c:forEach></c:when>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
			<!-- // gnb -->
			<div class="side_menu">
				<a href="/${vo.siteCode}/${vo.langCode}/totalSearch/index.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu75')}" class="search_loc head_btn_com"><img src="/images/home/kor/user/common/search_icon.png" alt=""></a>
				<button class="btn_sitemap"><img src="/images/home/kor/user/common/sitemap_btn_icon.png" alt="사이트맵열기"></button>
			</div>
		</div> 
		<div class="gnb_bg">
		    <div class="container2">
				<div class="bg_tit_box">
					<div class="box">
						<div class="inner_box">
							<div class="tit"><span class="ft_c">상상력</span>을 현실로 <br> 만드는 공작소!</div>
							<div class="txt">발명교육포털사이트</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			$(".gnb_header .depth1 > ul > li").on("mouseenter focusin", function () {
				$(this).children('.depth1_link').addClass('on');
				$(this).children("div").stop().slideDown();
				$('#header').css('z-index', '899');
				$('.gnbShadow').stop().fadeIn();
				return false;
			})
	
			/* 200421 */
			$(".gnb_header .depth1 > ul > li").on("mouseleave focusout", function () {
				$(this).children('.depth1_link').removeClass('on');
				$(this).children("div").stop().hide();
				$('#header').css('z-index', '300');
				$('.gnbShadow').stop().fadeOut();
				return false;
			})
		</script>
	</div>
	<div class="layer layer_menu">
	<!-- sitemap top -->
	<div class="layer_header">
		<h1 class="logo_w"><img src="/images/home/kor/user/common/sitemap_logo.png" alt=""></h1>
		<div class="inner_list">
			<ul class="list">
				<li class="icon02">
					<a href="javascript:void(0);" class="topmenu1">
						<span class="text">로그인</span>
					</a>
				</li>
				<li class="icon03">
					<a href="javascript:void(0);" class="topmenu2">
						<span class="text">회원가입</span>
					</a>
				</li>
			</ul>
		</div>
		<button type="button" class="btn_layer_close"><i class="xi-close"></i><span class="hide">닫기</span></button>
	</div>
	<!-- sitemap menu -->
	<div class="sitemap_list_wrap">
		<h2>사이트맵</h2>
		<div  class="depth1 gnb_sitemap">
			<ul class="clearfix">
				<c:set var="gnbMenuCnt" value="0"/>
					<c:forEach items="${menuTree}" var="menu" varStatus="status">
						<c:set var="subClass" value=""/>
						<c:choose>
							<c:when test="${menu.menuType eq 'L'}">
								<c:choose>
									<c:when test="${menu.linkType eq 'Y'}"><c:set var="aTagAttr2" value="href=&quot;${menu.linkUrl}&quot; target=&quot;_blank&quot;"/></c:when>
									<c:otherwise><c:set var="aTagAttr2" value="href=&quot;${menu.linkUrl}&quot;"/></c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${menu.children gt 0}"><c:set var="aTagAttr2" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('/${vo.siteCode}/${vo.langCode}/folder.act', '${menu.menuPos}');&quot;"/></c:when>
									<c:when test="${menu.menuPos eq cFn:arrIndexOf(menuIdxList, 'menu128')}">
										<c:set var="aTagAttr2" value="href=&quot;javascript:void(0);&quot; onClick=&quot;whitePaperDown();&quot;"/>
									</c:when>
									<c:otherwise><c:set var="aTagAttr2" value="href=&quot;javascript:void(0);&quot; onClick=&quot;fn_menu_move('${menu.uri}', '${menu.menuPos}');&quot;"/></c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						
						<c:set var="deleteMenu" value="${menu.depth eq 1 ?'menu_delete=&quot;Y&quot;' :'parent_delete=&quot;Y&quot;'}"/>

						<c:choose>
							<c:when test="${menu.depth eq 1}">
								<c:set var="aTagAttr2" value=""/>
								<c:set var="gnbMenuCnt" value="${gnbMenuCnt+1}"/>
								<c:set var="gnbMenus" value="class=&quot;gnb_menu${gnbMenuCnt}&quot;"/>
							</c:when>
							<c:when test="${menu.point eq 'ES'}">
								<c:set var="gnbMenus" value="class=&quot;has_sub&quot;"/>
							</c:when>
							<c:otherwise><c:set var="gnbMenus" value=""/></c:otherwise>
						</c:choose>
						
						<li ${gnbMenus}  <c:if test="${menu.useAt eq 'N' or (empty usrSession and menu.sessionAt eq 'R') or (not empty usrSession and menu.sessionAt eq 'N')}">${deleteMenu}</c:if>>
						<a <c:if test="${menu.depth eq 1}">class="depth1_link"</c:if> ${aTagAttr2}><c:out value="${menu.menuTitle}" escapeXml="false"/></a>
						<c:choose>
							<c:when test="${menu.point eq 'S' or menu.point eq 'ES'}">
								<c:choose>
									<c:when test="${menu.depth gt 1}">
										<div>
											<div class="depth3">
												<ul>
									</c:when>
									<c:otherwise>
										<div class="gnb_block">
											<div class="depth2">
												<ul>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${menu.point eq 'E'}"><c:forEach begin="1" end="${menu.eCnt}"></ul></div></div></c:forEach></c:when>
						</c:choose>
					</c:forEach>
			</ul>
		</div>
	</div>
</div>
<script>
	// get type
	
	var mainSwiper, headerVer;
	var moveWidth;

		function resizeWidth() {
			$(window).on('resize', function () {
				return moveWidth = $(window).width();
			})
		}

		//기본 sitemap
		$('.btn_sitemap').on('click', function () {
			$('.layer_menu').css({
				'right':0,
				'opacity':1
			}).addClass('on');
			$('body').css('overflow-y', 'hidden');
			$('.topmenu1').focus();
		});

		$('.btn_layer_close').on('click', function () {
			$('.layer_menu').css({
				'right': '-100%',
				'opacity': 0
			}).removeClass('on');
			$('body').css('overflow-y', '');
			$('.btn_sitemap').focus();
		});

		//모바일 메뉴 스크립트 
		var detph1 = $('.sitemap_list_wrap .depth1 > ul > li > a');
		var detph2 = $('.sitemap_list_wrap .depth2 > ul > li > a');
		var detph3 = $('.sitemap_list_wrap .depth3 > ul > li > a');
		var depth_block = $('.sitemap_list_wrap .depth2, .sitemap_list_wrap .depth3');

		function mobileMenu() {
			var site_link = $('.sitemap_list_wrap  a');
				
			if ($(window).innerWidth() <= 1280) {
				detph1.addClass('depth1_link');
				detph2.addClass('depth2_link');
				detph3.addClass('depth3_link');
				$('.sitemap_list_wrap .depth3').each(function () {
					$(this).parents('li').children('a').removeAttr('onclick');
					$(this).parents('li').children('a').addClass('has_sub').append('<i class="xi-plus"></i>');
				});
				}else {
				detph1.removeClass('depth1_link');
				detph2.removeClass('depth2_link');
				detph3.removeClass('depth3_link');
				$('.sitemap_list_wrap .depth3').each(function () {
					$(this).parents('li').children('a').removeClass('has_sub');
					$('i.xi-plus').remove();
				});
			}
			site_link.click(function () {
				if ($(this).hasClass('depth1_link')) {
					//$(this).removeAttr('href');
					$('.depth1_link + div .depth2, .depth1_link + div .depth3').slideUp(200);
					$(this).siblings('.gnb_block').children('.depth2').slideToggle(200);
					console.log('1');
					return false;
				} else if ($(this).hasClass('depth2_link')) {
					$('.depth3').removeClass('onnnnn');
					$(this).next('div').children('.depth3').addClass('onnnnn');
					//$(this).siblings('.depth3').slideToggle(200);
					if ($(this).hasClass('has_sub')) {
						console.log('2');
						return false;
						//$(this).removeAttr('href');
					}
				} 
			})
		}
		$(document).ready(function(){
			mobileMenu();
				
			$(window).resize(function(){
				if ($(window).innerWidth() <= 1280) {
					detph1.addClass('depth1_link');
					detph2.addClass('depth2_link');
					detph3.addClass('depth3_link');
						$('i.xi-plus').remove();
					$('.sitemap_list_wrap .depth3').each(function () {
						$(this).parents('li').children('a').addClass('has_sub').append('<i class="xi-plus"></i>');
					});
				}else {
					detph1.removeClass('depth1_link');
					detph2.removeClass('depth2_link');
					detph3.removeClass('depth3_link');
					$('.gnb_header .depth2').removeAttr('style');
					$('.sitemap_list_wrap .depth3').each(function () {
						$(this).parents('li').children('a').removeClass('has_sub');
						$('i.xi-plus').remove();
					});
				}
			});
		})
</script>
</div>