<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function initInfoSlide4() {
		var $infoSlide4 = $('#info_slide4');
		$infoSlide4.slick({
			slidesToShow: 1, // 슬라이드 show 갯수
			slidesToScroll: 1,
			infinite: true, // 무한슬라이드
			dots: true, // 슬라이드 점표시
			speed: 500,
			arrows: true, // 슬라이드 좌우 움직임 화살표 표시
			autoplay: true, // 자동 슬라이드 넘김
			autoplaySpeed: 5000, // 자동 슬라이드 넘김 타이밍
		});
		
		//seq numbering
		var tot = $infoSlide4.find('.slick-dots li').length;
		$('.nav_box1 .num .now').text('1');
		$('.nav_box1 .num .total').text( tot );
	
		$infoSlide4.on('afterChange', function(event, slick, direction){
			var itemIdx = $(event.currentTarget).find('.slick-dots .slick-active').index();
			$('.nav_box1 .num .now').text( itemIdx + 1 );
		});
	}	//initInfoSlide4
	function initInfoSlide5() {
		var $infoSlide5 = $('#info_slide5');
		$infoSlide5.slick({
			slidesToShow: 1, // 슬라이드 show 갯수
			slidesToScroll: 1,
			infinite: true, // 무한슬라이드
			dots: true, // 슬라이드 점표시
			speed: 500,
			arrows: true, // 슬라이드 좌우 움직임 화살표 표시
			autoplay: true, // 자동 슬라이드 넘김
			autoplaySpeed: 5000, // 자동 슬라이드 넘김 타이밍
		});
		
		//seq numbering
		var tot = $infoSlide5.find('.slick-dots li').length;
		$('.nav_box2 .num .now').text('1');
		$('.nav_box2 .num .total').text( tot );
	
		$infoSlide5.on('afterChange', function(event, slick, direction){
			var itemIdx = $(event.currentTarget).find('.slick-dots .slick-active').index();
			$('.nav_box2 .num .now').text( itemIdx + 1 );
		});
	}	//initInfoSlide5
	function initInfoSlide6() {
		var $infoSlide6 = $('#info_slide6');
		$infoSlide6.slick({
			slidesToShow: 1, // 슬라이드 show 갯수
			slidesToScroll: 1,
			infinite: true, // 무한슬라이드
			dots: true, // 슬라이드 점표시
			speed: 500,
			arrows: true, // 슬라이드 좌우 움직임 화살표 표시
			autoplay: true, // 자동 슬라이드 넘김
			autoplaySpeed: 5000, // 자동 슬라이드 넘김 타이밍
		});
		
		//seq numbering
		var tot = $infoSlide6.find('.slick-dots li').length;
		$('.nav_box3 .num .now').text('1');
		$('.nav_box3 .num .total').text( tot );
	
		$infoSlide6.on('afterChange', function(event, slick, direction){
			var itemIdx = $(event.currentTarget).find('.slick-dots .slick-active').index();
			$('.nav_box3 .num .now').text( itemIdx + 1 );
		});
	}	//initInfoSlide6
	function initInfoSlide7() {
		var $infoSlide7 = $('#info_slide7');
		$infoSlide7.slick({
			slidesToShow: 1, // 슬라이드 show 갯수
			slidesToScroll: 1,
			infinite: true, // 무한슬라이드
			dots: true, // 슬라이드 점표시
			speed: 500,
			arrows: true, // 슬라이드 좌우 움직임 화살표 표시
			autoplay: true, // 자동 슬라이드 넘김
			autoplaySpeed: 5000, // 자동 슬라이드 넘김 타이밍
		});
	
		//seq numbering
		var tot = $infoSlide7.find('.slick-dots li').length;
		$('.nav_box4 .num .now').text('1');
		$('.nav_box4 .num .total').text( tot );
	
		$infoSlide7.on('afterChange', function(event, slick, direction){
			var itemIdx = $(event.currentTarget).find('.slick-dots .slick-active').index();
			$('.nav_box4 .num .now').text( itemIdx + 1 );
		});
	}	//initInfoSlide7
	
	$(document).ready(function() {
		(function() {
			if (console && typeof console.debug === 'function') {
				console.debug('Browser Detection : ' + navigator.sayswho);
			}
		})();	//Browser Detection - Anonymous Function Call.
	
		initInfoSlide4();
		initInfoSlide5();
		initInfoSlide6();
		initInfoSlide7();
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
				<div class="title"><span class="ft_c">[체험프로그램]</span> 기타 체험 프로그램</div>
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
												<div class="text">레고에듀케이션</div>
											</div>
										</div>
									</li>
									<li class="icon2">
										<div class="inner_box">
											<div class="one"><span class="text">체험개요</span></div>
											<div class="text_box">
												<div class="text">초중고 전 학제 대상 교구 활용 융합과학 학습</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">체험내용</span></div>
											<div class="text_box">
												<div class="text">단순 조립을 넘어 모터와 센서 등을 활용한 아이들의 표현력 발휘 향상에 도움이 되는 STEAM 교육 교보재 체험</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">프로세스</span></div>
											<div class="text_box">
												<div class="text">체험부스 내 아이들 입장 (인당 제한시간 10분) → 교보재 주제에 맞는 조립 및  원리 파악</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="info_slide_cont">
								<ul id="info_slide4" class="info_slide">
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_01.jpg" alt="레고 체험 사진 1번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_02.jpg" alt="레고 체험 사진 2번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_03.jpg" alt="레고 체험 사진 3번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_04.jpg" alt="레고 체험 사진 4번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_05.jpg" alt="레고 체험 사진 5번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_06.jpg" alt="레고 체험 사진 6번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_07.jpg" alt="레고 체험 사진 7번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_08.jpg" alt="레고 체험 사진 8번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/lego_09.jpg" alt="레고 체험 사진 9번째" />
											</div>
										</div>
									</li>
								</ul>
								<div class="nav_box nav_box1">
								   <p class="num">
									   <span class="now"></span> / <span class="total"></span>
								   </p>
							   </div>
							</div>
						</div>
					</li>
					<li>
						<div class="info_list_box">
							<div class="box">
								<ul class="list2">
									<li class="icon1">
										<div class="inner_box">
											<div class="one"><span class="text">콘텐츠명</span></div>
											<div class="text_box">
												<div class="text">가상터치 체험부스 (Virtual Touch)</div>
											</div>
										</div>
									</li>
									<li class="icon2">
										<div class="inner_box">
											<div class="one"><span class="text">체험개요</span></div>
											<div class="text_box">
												<div class="text">버튼이나 터치스크린이 필요 없는 터치 체험</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">체험내용</span></div>
											<div class="text_box">
												<div class="text">가상터치 기술 시연 및 전시를 통한 아이들의 창의력, 인지능력 향상 도모</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">프로세스</span></div>
											<div class="text_box">
												<div class="text">체험부스 내 아이들 입장 → AI(딥러닝) 기술 분석 원리 강연 및 기자재 체험</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="info_slide_cont">
								<ul id="info_slide5" class="info_slide">
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/booth_01.jpg" alt="부스 체험 사진 1번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/booth_02.jpg" alt="부스 체험 사진 2번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/booth_04.jpg" alt="부스 체험 사진 3번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/booth_05.jpg" alt="부스 체험 사진 4번째" />
											</div>
										</div>
									</li>
								</ul>
								<div class="nav_box nav_box2">
								   <p class="num">
									   <span class="now"></span> / <span class="total"></span>
								   </p>
							   </div>
							</div>
						</div>
					</li>
					<li>
						<div class="info_list_box">
							<div class="box">
								<ul class="list2">
									<li class="icon1">
										<div class="inner_box">
											<div class="one"><span class="text">콘텐츠명</span></div>
											<div class="text_box">
												<div class="text">코딩 체험부스 (아두이노)</div>
											</div>
										</div>
									</li>
									<li class="icon2">
										<div class="inner_box">
											<div class="one"><span class="text">체험개요</span></div>
											<div class="text_box">
												<div class="text">아두이노 시뮬레이션 코딩 체험</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">체험내용</span></div>
											<div class="text_box">
												<div class="text">아두이노 시뮬레이션 코딩 및 S/W 개발 툴 활용 등을 통한 문제해결역량 함양</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">프로세스</span></div>
											<div class="text_box">
												<div class="text">체험부스 내 아이들 입장 → 코딩, 시뮬레이션 툴 활용법 교육 체험</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="info_slide_cont">
								<ul id="info_slide6" class="info_slide">
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/coding_01.jpg" alt="코딩 체험 사진 1번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/coding_02.jpg" alt="코딩 체험 사진 2번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/coding_03.jpg" alt="코딩 체험 사진 3번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/coding_04.jpg" alt="코딩 체험 사진 4번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/coding_05.jpg" alt="코딩 체험 사진 5번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/coding_06.jpg" alt="코딩 체험 사진 6번째" />
											</div>
										</div>
									</li>
								</ul>
								<div class="nav_box nav_box3">
								   <p class="num">
									   <span class="now"></span> / <span class="total"></span>
								   </p>
							   </div>
							</div>
						</div>
					</li>
					<li>
						<div class="info_list_box">
							<div class="box">
								<ul class="list2">
									<li class="icon1">
										<div class="inner_box">
											<div class="one"><span class="text">콘텐츠명</span></div>
											<div class="text_box">
												<div class="text">과학원리체험</div>
											</div>
										</div>
									</li>
									<li class="icon2">
										<div class="inner_box">
											<div class="one"><span class="text">체험개요</span></div>
											<div class="text_box">
												<div class="text">일상에 녹아있는 다양한 과학원리 체험</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">체험내용</span></div>
											<div class="text_box">
												<div class="text">물리학 박사님과 함께 하는 과학 원리 체험을 통해, 발명과 과학에 대한 탐구 마인드와  문제해결역량 함양</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">프로세스</span></div>
											<div class="text_box">
												<div class="text">개인 단위 체험부스 입장 → 다양한 과학 원리 실험도구 및 교보재 체험 → 일정 시간대 박사님 강연 진행</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="info_slide_cont">
								<ul id="info_slide7" class="info_slide">
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_01.jpg" alt="과학 체험 사진 1번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_02.jpg" alt="과학 체험 사진 2번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_03.jpg" alt="과학 체험 사진 3번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_04.jpg" alt="과학 체험 사진 4번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_05.jpg" alt="과학 체험 사진 5번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_06.jpg" alt="과학 체험 사진 6번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_07.jpg" alt="과학 체험 사진 7번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_08.jpg" alt="과학 체험 사진 8번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_09.jpg" alt="과학 체험 사진 9번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2023/science_10.jpg" alt="과학 체험 사진 10번째" />
											</div>
										</div>
									</li>
								</ul>
								<div class="nav_box nav_box4">
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
