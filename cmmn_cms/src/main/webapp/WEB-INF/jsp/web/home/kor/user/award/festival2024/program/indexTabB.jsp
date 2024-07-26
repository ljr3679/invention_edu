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
				<div class="title"><span class="ft_c">[체험프로그램]</span> 동작인식 커넥트</div>
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
												<div class="text">Complete the Inventions!</div>
											</div>
										</div>
									</li>
									<li class="icon2">
										<div class="inner_box">
											<div class="one"><span class="text">체험개요</span></div>
											<div class="text_box">
												<div class="text">퍼즐로 완성시키는 발명품</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">체험내용</span></div>
											<div class="text_box">
												<div class="text">조각조각 퍼즐로 나누어진 유명한 발명품을 조합을 통해 완성, 세레모니 영상 송출</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">프로세스</span></div>
											<div class="text_box">
												<div class="text">체험존 범위 내 아이들 진입 (제한시간 30초) → 유명한 발명품의 완성된 모습 선택 → 퍼즐 조합을 통한 발명품 완성, 발명 히스토리 애니메이션 송출 → QR 스탬프 증정</div>
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
												<img src="/images/home/kor/user/award/festival2024/connect_01.jpg" alt="동작인식 체험 사진 1번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_02.jpg" alt="동작인식 체험 사진 2번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_03.jpg" alt="동작인식 체험 사진 3번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_04.jpg" alt="동작인식 체험 사진 4번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_05.jpg" alt="동작인식 체험 사진 5번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_06.jpg" alt="동작인식 체험 사진 6번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_07.jpg" alt="동작인식 체험 사진 7번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_08.jpg" alt="동작인식 체험 사진 8번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2024/connect_09.jpg" alt="동작인식 체험 사진 9번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="images/connect_10.jpg" alt="동작인식 체험 사진 10번째" />
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
