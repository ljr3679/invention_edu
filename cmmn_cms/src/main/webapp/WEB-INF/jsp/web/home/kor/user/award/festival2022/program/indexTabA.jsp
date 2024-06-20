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
				<div class="title"><span class="ft_c">[체험프로그램]</span> 가상현실콘텐츠(VR Attraction)</div>
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
												<div class="text">VR Attraction (비행 시뮬레이션, 롤러코스터, 레이싱, 드론시뮬레이터 등)</div>
											</div>
										</div>
									</li>
									<li class="icon2">
										<div class="inner_box">
											<div class="one"><span class="text">체험개요</span></div>
											<div class="text_box">
												<div class="text">가상현실 시뮬레이팅 어트랙션 활용 체험</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">체험내용</span></div>
											<div class="text_box">
												<div class="text">VR어트랙션 활용, 단순 체험을 넘어선 체감의 효과를 통해 아이들이 느끼는 페스티벌 현장에서의 즐거움 배가</div>
											</div>
										</div>
									</li>
									<li class="icon3">
										<div class="inner_box">
											<div class="one"><span class="text">프로세스</span></div>
											<div class="text_box">
												<div class="text">탑승 및 VR 착용 → 프로그램 안내 → QR 스탬프 증정</div>
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
												<img src="/images/home/kor/user/award/festival2022/vr_img_01.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 1번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_02.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 2번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_03.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 3번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_04.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 4번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_05.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 5번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_06.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 6번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_07.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 7번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_08.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 8번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_09.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 9번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_10.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 10번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_11.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 11번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_12.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 12번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_13.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 13번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_14.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 14번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_15.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 15번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_16.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 16번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_17.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 17번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_18.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 18번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_19.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 19째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_20.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 20번째" />
											</div>
										</div>
									</li>
									<li>
										<div class="img_box">
											<div class="inner_box">
												<img src="/images/home/kor/user/award/festival2022/vr_img_21.jpg" alt="가상현실콘텐츠(VR Attraction) 체험 사진 21번째" />
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
