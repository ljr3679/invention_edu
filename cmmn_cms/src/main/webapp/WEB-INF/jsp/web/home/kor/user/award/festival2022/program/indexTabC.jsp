<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function initInfoSlide () {
		var $infoSlide = $('#info_slide');
		$infoSlide.slick({
			slidesToShow: 1, // 슬라이드 show 갯수
			slidesToScroll: 1,
			infinite: true, // 무한슬라이드
			dots: true, // 슬라이드 점표시
			speed: 500,
			arrows: true, // 슬라이드 좌우 움직임 화살표 표시
			autoplay: true, // 자동 슬라이드 넘김
			autoplaySpeed: 5000, // 자동 슬라이드 넘김 타이밍
			adaptiveHeight: true
		});
	
		//seq numbering
		var tot = $infoSlide.find('.slick-dots li').length;
		$('.nav_box .num .now').text('1');
		$('.nav_box .num .total').text( tot );
	
		$infoSlide.on('afterChange', function(event, slick, direction){
			var itemIdx = $(event.currentTarget).find('.slick-dots .slick-active').index();
			$('.nav_box .num .now').text( itemIdx + 1 );
		});
	}	//initInfoSlide
	
	$( document ).ready(function() {
		initInfoSlide();
	});
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
	<div class="com_program_view_cont">
		<div class="box">
			<div class="title_area">
				<div class="title"><span class="ft_c">[체험프로그램]</span> 증강현실 콘텐츠(AR 보물찾기)</div>
			</div>
			<div class="info_list_area">
				<ul class="info_list">
					<li>
						<div class="info_list_box">
							<div class="box">
								<ul class="list2">
									<li class="icon1">
										<div class="inner_box">
											<div class="one"><span class="text">콘텐츠명</span></div>
											<div class="text_box">
												<div class="text">AR 보물찾기</div>
											</div>
										</div>
									</li>
									<li class="icon2">
										<div class="inner_box">
											<div class="one"><span class="text">체험개요</span></div>
											<div class="text_box">
												<div class="text">증강현실 어플리케이션 활용 오프라인 보물찾기</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">체험내용</span></div>
											<div class="text_box">
												<div class="text">AR 앱이 인스톨 되어있는 태블릿활용(30대), 제한시간 內 행사장 곳곳에 숨겨진 보물(마커)을 찾아 태블릿에 인식,획득 보물의 개수 대비 보상 지급</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">프로세스</span></div>
											<div class="text_box">
												<div class="text">참가자 사전 모집(인원TBD) 및 안내센터 태블릿 수령 → 마커 스팟 힌트제공 및 앱 실행 (제한시간 30분)</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="info_slide_cont">
								<ul id="info_slide" class="info_slide">
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/aug_01.jpg" alt="증강현실 콘텐츠(AR 보물찾기) 체험 사진 1번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/aug_02.jpg" alt="증강현실 콘텐츠(AR 보물찾기) 체험 사진 2번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/aug_03.jpg" alt="증강현실 콘텐츠(AR 보물찾기) 체험 사진 3번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/aug_04.jpg" alt="증강현실 콘텐츠(AR 보물찾기) 체험 사진 4번째" />
											</div>
										</div>
									</li>
								</ul>
								<div class="nav_box">
								   <p class="num">
									   <span class="now"></span> / <span class="total"></span>
								   </p>
							   </div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="btn_box">
		<a href="javascript:void(0);" onclick="fn_back();" class="btn_com">이전</a>
	</div>
</form:form>
</body>
