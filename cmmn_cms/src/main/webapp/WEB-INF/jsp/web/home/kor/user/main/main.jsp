<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
	<script type="text/javascript">
		function fn_notice_init(param, obj) {
			if(obj != null) {
				$(".swiper-slide").removeClass("on");
				$(obj).parent().addClass("on");
			}
			fn_cmmn_ajax("${vo.selfPath}notice_init.ajax", false, {'board_code' : param}, 'json', function(res) {
				
// 				console.log("대기표보내는값"+JSON.stringify(res));
				 if(res) {
					 if(res.result == "200") {
						 var datas = res.noticeList;
						 var menuPos = res.menuPos;
						 var html = "";
						 $('#no_item').empty();
						 $('#no_item').remove();
						 
							 for (var i = 0; i < datas.length; i++) {
								 var data = datas[i];
								 
								 html += "<li>";
				                 html += "    <a href=\"/${vo.siteCode}/${vo.langCode}"+data.menuUri+"?menuPos="+data.menuPos+"&idx="+data.no+"&act=detail&pageIndex=1\" onclick=\"\" class=\"box\" tabindex=\"-1\">";
				                 html += "        <span class=\"mark bg1\">"+data.menuTitle+"</span>";
				                 html += "        <div class=\"title\">"+data.title+"</div>";
				                 html += "        <div class=\"date\">"+data.regDate+"</div>";
				                 html += "    </a>";
				                 html += "</li>";
							 }
							 
							 var ant_slide = $('#ant_slide');
							 ant_slide.slick('unslick'); 
							 
							 $("#ant_slide").html(html);
							 
							ant_slide.slick({
							slidesToShow: 4, 
							slidesToScroll: 4,
							infinite: true,
							dots: true,
							arrows: false,
							autoplay: true,
							autoplaySpeed: 3000,
							speed: 800,
							  responsive: [
								{
								  breakpoint: 1081,
								  settings: {
									slidesToShow: 3,
									slidesToScroll: 3,
									infinite: true,
									dots: true
								  }
								},
								{
								  breakpoint: 768,
								  settings: {
									slidesToShow: 2,
									slidesToScroll: 1
								  }
								},
								{
								  breakpoint: 481,
								  settings: {
									slidesToShow: 1,
									slidesToScroll: 1
								  }
								}
							  ]
							});
							if(datas.length == 0){
								html += "<div class=\"title_area\" id=\"no_item\">";
								html += "<div class=\"title\" style=\"font-size:20px;\">해당 게시물이 존재하지 않습니다.</div>";
								html += "</div>";
								$('#slide_id').append(html);
							}
							res.noticeList = null;
							datas = null;
					 }
				} 
			});
			return;
		}
		$(document).ready(function() {
			fn_notice_init('0');
		});
		function fn_tab_change(param) {
			if(param == '1') {
				$('#videoTab1').removeClass('on');
				$('#videoTab2').removeClass('on');
				$('#videoTab3').removeClass('on');
				$('#tab1').removeClass('on');
				$('#tab2').removeClass('on');
				$('#tab3').removeClass('on');
				$('#tab1').addClass('on');
				$('#videoTab1').addClass('on');
			} else if(param == '2') {
				$('#videoTab1').removeClass('on');
				$('#videoTab2').removeClass('on');
				$('#videoTab3').removeClass('on');
				$('#tab1').removeClass('on');
				$('#tab2').removeClass('on');
				$('#tab3').removeClass('on');
				$('#tab2').addClass('on');
				$('#videoTab2').addClass('on');
			} else if(param == '3') {
				$('#videoTab1').removeClass('on');
				$('#videoTab2').removeClass('on');
				$('#videoTab3').removeClass('on');
				$('#tab1').removeClass('on');
				$('#tab2').removeClass('on');
				$('#tab3').removeClass('on');
				$('#tab3').addClass('on');
				$('#videoTab3').addClass('on');
			}
		}
		function whitePaperDown() {
			var frm = document.cmmnFileDownForm;
		   	frm.action = '/paperDownload.do';
		   	frm.submit();
		}
	</script>
</head>
<body>
	<div class="section sen1">
                <div class="main_cont">
                    <ul id="main_slide">
                    	<c:forEach items="${visualList}" var="list" varStatus="status">
							<c:choose>
								<c:when test="${not empty list.attachReName}">
									<li style="background-image: url('/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do');">
										<div class="container">
											<a href="${list.url}" <c:if test="${list.openAt ne 'A'}">target="_blank"</c:if> class="box" tabindex="-1">
												<div class="sub_title"><c:out value="${list.typeTitle}"/></div>
		                                        <div class="title"><c:out value="${list.title}"  escapeXml="false"/></div>
		                                        <div class="text"><c:out value="${list.content}" escapeXml="false"/></div>
		                                    </a>
		                                 </div>
		                             </li>
								</c:when>
								<c:otherwise>
									<li style="background-image: url('/images/home/kor/user/main/main_vis.jpg');">
										<div class="container">
											<a href="${list.url}" class="box" <c:if test="${list.openAt ne 'A'}">target="_blank"</c:if> tabindex="-1">
												<div class="sub_title"><c:out value="${list.typeTitle}"/></div>
		                                        <div class="title"><c:out value="${list.title}"  escapeXml="false"/></div>
		                                        <div class="text"><c:out value="${list.content}" escapeXml="false"/></div>
		                                    </a>
		                                 </div>
		                             </li>
								</c:otherwise>
							</c:choose>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            <!-- // sen1 -->

            <!-- sen5 -->
            <div class="section sen5">
                <div class="container">
                    <div class="quick_cont">
                        <ul class="list">
                            <li class="icon01"><a href="/home/kor/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}" class="box">교육자료</a></li>
                            <li class="icon02"><a href="/home/kor/education/material/work/index.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu126')}" class="box">수상작품집</a></li>
                            <li class="icon03"><a href="/home/kor/education/theme/invention/index.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu130')}" class="box">테마영상</a></li>
                            <li class="icon04"><a href="/home/kor/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu135')}" class="box">웹진『잎세플러스』</a></li>
                            <li class="icon05"><a href="javascript:void(0);" onclick="whitePaperDown();" class="box">발명교육백서</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- // sen5 -->

            <!-- sen2 -->
            <div class="section sen3">
                <div class="container">
                    <div class="info_box">
                        <div class="box news">
                            <div class="title_area">
                                <div class="title">새소식</div>
                                <div class="tab_box">
                                    <ul class="tab_list">
                                        <li data-tab="tab01" class="on"><button type="button" class="btn">공지사항</button></li>
                                        <li data-tab="tab02"><button type="button" class="btn">언론보도</button></li>
                                    </ul>
                                    <a href="/home/kor/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu70')}" title="상세페이지 링크 이동">
                                        <img src="/images/home/kor/user/main/view_icon.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div id="tab01" class="tab_cont on">
                                <div class="main_news_box">


                                    <a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu'.concat(noticeAllList[0].menuNo))}&act=detail&idx=${noticeAllList[0].no}&pageIndex=1">
                                        <div class="date">
                                            <div class="date_inner">
                                                <div class="day"><c:out value="${noticeAllList[0].regDay}"/></div>
                                                <div class="year"><c:out value="${noticeAllList[0].regYear}.${noticeAllList[0].regMonth}"/></div>
                                            </div>
                                        </div>
                                        <div class="txt_box">
                                            <div class="txt_inner">
                                                <div class="tit">
                                                    <c:out value="${noticeAllList[0].title}" escapeXml="false"/>
                                                </div>
                                            </div>
                                        </div>
                                    </a>


                                </div>
                                <div class="news_list_box">
                                    <ul class="list">
										<c:forEach items="${noticeAllList}" begin="1" var="list" varStatus="status">
											<li>
	                                            <a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu'.concat(list.menuNo))}&act=detail&idx=${list.no}&pageIndex=1">
	                                                <span class="txt"><c:out value="${list.title}"  escapeXml="false"/></span>
	                                                <span class="date"><c:out value="${list.regDate}"/></span>
	                                            </a>
	                                        </li>
										</c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div id="tab02" class="tab_cont">
                                <div class="main_news_box">
                                    <a href="/${vo.siteCode}/${vo.langCode}${pressList[0].menuUri}?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu'.concat(pressList[0].menuNo))}&act=detail&idx=${pressList[0].no}&pageIndex=1" >
                                        <div class="date">
                                            <div class="date_inner">
                                                <div class="day"><c:out value="${pressList[0].regDay }"/></div>
                                                <div class="year"><c:out value="${pressList[0].regYear}.${pressList[0].regMonth}"/></div>
                                            </div>
                                        </div>
                                        <div class="txt_box">
                                            <div class="txt_inner">
                                                <div class="tit">
                                                    <c:out value="${pressList[0].title}"  escapeXml="false"/>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="news_list_box">
                                    <ul class="list">
										<c:forEach items="${pressList}" begin="1" var="list" varStatus="status">
											<li>
												<a href="/${vo.siteCode}/${vo.langCode}${list.menuUri}?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu'.concat(list.menuNo))}&act=detail&idx=${list.no}&pageIndex=1" >
	                                                <span class="txt"><c:out value="${list.title}"  escapeXml="false"/></span>
	                                                <span class="date"><c:out value="${list.regDate}" /></span>
	                                            </a>
	                                        </li>
										</c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="box video">
                            <div class="title_area">
                                <div class="title">홍보동영상</div>
                            </div>
                            <div class="tab_wrap">
                                <div class="tab_box2">
                                    <ul class="tab_list">
                                        <li data-tab="tab1" id="videoTab1" class="on" >
                                            <a class="btn" href="javascript:fn_tab_change('1');">
                                                <div class="title">
                                                	<c:out value="${videoData.title1}"  escapeXml="false"/>
												</div>
                                            </a>
                                        </li>

                                        <li data-tab="tab2" id="videoTab2">
                                            <a class="btn" href="javascript:fn_tab_change('2');">
                                                <div class="title">
                                                	<c:out value="${videoData.title2}"  escapeXml="false"/> 
                                                </div>
                                            </a>
                                        </li>

                                        <li data-tab="tab3" id="videoTab3">
                                            <a class="btn" href="javascript:fn_tab_change('3');">
                                                <div class="title">
													<c:out value="${videoData.title3}"  escapeXml="false"/>
                                                </div>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                                <div id="tab1" class="video_cont on">
                                	<c:choose>
                                		<c:when test="${videoData.openAt1 eq 'A'}">
                                			<a class="img_wrap" href="${videoData.url1}" title="현재창으로보기">
		                                        <div class="img_box">
		                                            <div class="img_inner">
		                                                <img class="lazyload" src="/images/site/${fn:substring(fileList1[0].attachReName, 0, fn:indexOf(fileList1[0].attachReName, fileList1[0].extension)-1)}/${fileList1[0].extension}/loader.do" onerror="" alt="${videoData.title1}" />
		                                            </div>
		                                        </div>
		                                    </a>
                                		</c:when>
                                		<c:otherwise>
                                			<a class="img_wrap" href="${videoData.url1}" target="_blank" title="새창으로보기">
		                                        <div class="img_box">
		                                            <div class="img_inner">
		                                                <img class="lazyload" src="/images/site/${fn:substring(fileList1[0].attachReName, 0, fn:indexOf(fileList1[0].attachReName, fileList1[0].extension)-1)}/${fileList1[0].extension}/loader.do" onerror="" alt="${videoData.title1}" />
		                                            </div>
		                                        </div>
		                                    </a>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                                <div id="tab2" class="video_cont">
                                	<c:choose>
                                		<c:when test="${videoData.openAt2 eq 'A'}">
                                			<a class="img_wrap" href="${videoData.url2}" title="현재창으로보기">
		                                        <div class="img_box">
		                                            <div class="img_inner">
		                                                <img class="lazyload" src="/images/site/${fn:substring(fileList2[0].attachReName, 0, fn:indexOf(fileList2[0].attachReName, fileList2[0].extension)-1)}/${fileList2[0].extension}/loader.do" onerror="" alt="${videoData.title2}" />
		                                            </div>
		                                        </div>
		                                    </a>
                                		</c:when>
                                		<c:otherwise>
                                			<a class="img_wrap" href="${videoData.url2}" target="_blank" title="새창으로보기">
		                                        <div class="img_box">
		                                            <div class="img_inner">
		                                                <img class="lazyload" src="/images/site/${fn:substring(fileList2[0].attachReName, 0, fn:indexOf(fileList2[0].attachReName, fileList2[0].extension)-1)}/${fileList2[0].extension}/loader.do" onerror="" alt="${videoData.title2}" />
		                                            </div>
		                                        </div>
		                                    </a>
                                		</c:otherwise>
                                	</c:choose>
                                </div>

                                <div id="tab3" class="video_cont">
                                    <c:choose>
                                		<c:when test="${videoData.openAt3 eq 'A'}">
                                			<a class="img_wrap" href="${videoData.url3}" title="현재창으로보기">
		                                        <div class="img_box">
		                                            <div class="img_inner">
		                                                <img class="lazyload" src="/images/site/${fn:substring(fileList3[0].attachReName, 0, fn:indexOf(fileList3[0].attachReName, fileList3[0].extension)-1)}/${fileList3[0].extension}/loader.do" onerror="" alt="${videoData.title3}" />
		                                            </div>
		                                        </div>
		                                    </a>
                                		</c:when>
                                		<c:otherwise>
                                			<a class="img_wrap" href="${videoData.url3}" target="_blank" title="새창으로보기">
		                                        <div class="img_box">
		                                            <div class="img_inner">
		                                                <img class="lazyload" src="/images/site/${fn:substring(fileList3[0].attachReName, 0, fn:indexOf(fileList3[0].attachReName, fileList3[0].extension)-1)}/${fileList3[0].extension}/loader.do" onerror="" alt="${videoData.title3}" />
		                                            </div>
		                                        </div>
		                                    </a>
                                		</c:otherwise>
                                	</c:choose>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // sen3 -->
            <!-- sen4 -->
            <div class="section sen4">
                <div class="container">
                    <div class="cont">
                        <div class="title_area">
                            <div class="title">주요 사업별 공지사항</div>
                        </div>
                        <div class="menu_box">
                            <button type="button" class="btn_arr btn_arr_prev swiper-button-disabled" title="슬라이드 이전 보기 버튼" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">이전보기</button>
                            <div class="ant_menu_box">
                                <div class="ant_menu_list swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
                                    <ul id="menu_list" class="list swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                                        <li class="swiper-slide on swiper-slide-active" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('0',this);" class="tit">전체</button></li>
                                        <li class="swiper-slide swiper-slide-next" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('1',this);" class="tit">직업계고 발명·특허교육지원 사업</button></li>
                                        <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('2',this);" class="tit">창의력챔피언대회</button></li>
                                        <!-- <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('3',this);" class="tit">차세대영재기업인선발</button></li> -->
                                        <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('4',this);" class="tit">IP-MEISTER</button></li>
                                        <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('5',this);" class="tit">YIP</button></li>
                                        <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('6',this);" class="tit">발명교육대상</button></li>
                                        <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('7',this);" class="tit">전국교원발명연구대회</button></li>
                                        <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('8',this);" class="tit">학생발명전시회</button></li>
                                        <li class="swiper-slide" style="width: 132px; margin-right: 20px;"><button type="button" onClick="fn_notice_init('9',this);" class="tit">지식재산 일반 선도학교 운영사업</button></li>
                                    </ul>
                                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                                </div>
                            </div>
                            <button type="button" class="btn_arr btn_arr_next" title="슬라이드 다음 보기 버튼" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false">다음보기</button>
                        </div>
                        <div class="ant_slide_area" id="slide_id">
                            <ul id="ant_slide">
                                 <!-- <li>
                                     <a href="yip/notice/bbs/48" class="box" tabindex="-1">
                                         <span class="mark bg1">YIP</span>
                                         <div class="title">2022 청소년 발명가 프로그램 (YIP) 최종 선발 교육생 공지</div>
                                         <div class="date">22.06.24</div>
                                     </a>
                                 </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // sen4 -->

            <!-- sen6 -->
            <div class="section sen6">
                <div class="container">
                    <div class="title_area">
                        <div class="title">팝업존</div>
                    </div>
                    <div class="pop_cont">
                        <div class="pop_box">
                            <div class="cont_inner">
                                <ul class="list">
                                    <li>
                                    	<c:choose>
                                    		<c:when test="${popupData.openAt eq 'A'}">
                                    			<a href="${popupAData.url}" class="box">
		                                            <div class="img_box">
		                                                <div class="inner_box">
		                                                    <img src="/images/site/${fn:substring(popupAData.attachReName, 0, fn:indexOf(popupAData.attachReName, popupAData.attachExtension)-1)}/${popupAData.attachExtension}/loader.do"  alt="${popupAData.attachName}" />
		                                                </div>
		                                            </div>
		                                        </a>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<a href="${popupAData.url}" target="_blank" class="box">
		                                            <div class="img_box">
		                                                <div class="inner_box">
		                                                    <img src="/images/site/${fn:substring(popupAData.attachReName, 0, fn:indexOf(popupAData.attachReName, popupAData.attachExtension)-1)}/${popupAData.attachExtension}/loader.do"  alt="${popupAData.attachName}" />
		                                                </div>
		                                            </div>
		                                        </a>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </li>
                                    <li>
                                    	<c:choose>
                                    		<c:when test="${popupBData.openAt eq 'A'}">
                                    			<a href="${popupBData.url}" class="box">
		                                            <div class="img_box">
		                                                <div class="inner_box">
		                                                    <img src="/images/site/${fn:substring(popupBData.attachReName, 0, fn:indexOf(popupBData.attachReName, popupBData.attachExtension)-1)}/${popupBData.attachExtension}/loader.do"  alt="${popupBData.attachName}" />
		                                                </div>
		                                            </div>
		                                        </a>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<a href="${popupBData.url}" target="_blank" class="box">
		                                            <div class="img_box">
		                                                <div class="inner_box">
		                                                    <img src="/images/site/${fn:substring(popupBData.attachReName, 0, fn:indexOf(popupBData.attachReName, popupBData.attachExtension)-1)}/${popupBData.attachExtension}/loader.do"  alt="${popupBData.attachName}" />
		                                                </div>
		                                            </div>
		                                        </a>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="pop_box banner_box">
                            <div class="title_area">
                                <div class="pop_control">
                                    <button type="button" class="button prev" title="슬라이드 이전 버튼" style=""></button>
                                    <p class="num"><span class="now">1</span> / <span class="newtotal"><c:out value="${fn:length(popupList)}" /></span></p>
                                    <button type="button" class="button next" title="슬라이드 다음 버튼"></button>
                                </div>
                            </div>
                            <div class="banner_slide_area">
                                <span class="hide">해당 슬라이드는 키보드(TAB)키로 이동 후 운용,작동 가능한 슬라이드입니다</span>
                                <ul id="banner_slide">
									<c:forEach items="${popupList}" var="list" varStatus="status">
										<c:choose>
											<c:when test="${list.openAt eq 'A'}">
												<li>
		                                            <a href="${list.url}" class="box" tabindex="${status.count}">
		                                                <div class="img_box">
		                                                    <div class="img_inner">
		                                                        <img class="lazyload" src="/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do"  alt="${list.attachName}" />
		                                                    </div>
		                                                </div>
		                                            </a>
		                                        </li>
											</c:when>
											<c:otherwise>
												<li>
		                                            <a href="${list.url}" target="_blank" class="box" tabindex="${status.count}">
		                                                <div class="img_box">
		                                                    <div class="img_inner">
		                                                        <img class="lazyload" src="/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do"  alt="${list.attachName}" />
		                                                    </div>
		                                                </div>
		                                            </a>
		                                        </li>
											</c:otherwise>
										</c:choose>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
</body>