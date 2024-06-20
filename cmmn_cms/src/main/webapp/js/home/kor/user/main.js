$(function(){
	
	//메인 비주얼
	var main_val = $('#main_slide');
		main_val.slick({
			slidesToShow: 1, 
			slidesToScroll: 1,
			infinite: true, 
			dots: true, 
			speed: 500,
			arrows: false,
			autoplay: true, 
			autoplaySpeed: 5000, 
			adaptiveHeight: true
		});

	//새소식 탭
	var $tab_box = $('.tab_box .tab_list li');
	$tab_box.each(function(){
		$tab_box.click(function() {
			var tab_id = $(this).attr('data-tab');
	
			$tab_box.removeClass('on');
			$('.tab_cont').removeClass('on');
	
			$(this).addClass('on');
			$("#" + tab_id).addClass('on');
			return false;
		});
	});
	
    

	//홍보 동영상 탭
	/*var $this = $(this);
	var $tab_detail = $('video_cont');
	
    $tab_box2.click(function() {
        var _index = $(this).index();
        alert(_index); 
        $tab_detail.removeClass('on');
        $(this).addClass('on');
        $tab_detail.eq(_index).addClass('on');
    }).eq(0).addClass('on').trigger('click');
    */

	//주요 사업별 공지사항
	var ant_slide = $('#ant_slide');
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

	
	//팝업존
	var banner_slide = $("#banner_slide");
    banner_slide.slick({
		slidesToShow: 1, 
		slidesToScroll: 1,
		infinite: true, 
		dots: true, 
		speed: 500,
		arrows: false,
		autoplay: true, 
		autoplaySpeed: 5000, 
		adaptiveHeight: true
	});

    // 배너 zone 이전 다음
    $(".pop_control .button").click(function () {
        if ($(this).hasClass("prev")) { // 해당 버튼이 prev라는 클래스가 있을때
            banner_slide.slick('slickPrev'); // 배너 슬라이드에 슬라이드를 이전 슬라이드로 이동
        }
    });

    $(".pop_control .button").click(function () {
        if ($(this).hasClass("next")) { // 해당 버튼이 next라는 클래스가 있을때 
            banner_slide.slick('slickNext'); // 배너 슬라이드에 슬라이드를 다음 슬라이드로 이동
        }
    });

	// 배너 zone 슬라이드 숫자
    var items = $("#banner_slide .slick-dots li").length; // 도트 갯수 확인
    $(".pop_control .num .now").text("1"); // 처음 노출되는 텍스트 1
    $(".pop_control .num .total").text(items); // 도트 갯수 확인 후 도트갯수만큼 숫자 노출

    banner_slide.on('afterChange', function (event, slick, direction) {
        var item = $(event.currentTarget).find(".slick-dots .slick-active").index();
        $(".pop_control .num .now").text(item + 1);
    });


	//주요 사업별 공지사항 
	var swiper = new Swiper('.swiper-container', {
		 slidesPerView: 8,
		 spaceBetween: 20,
		 freeMode: true,
		 navigation: {
		  nextEl: ".btn_arr_next",
		  prevEl: ".btn_arr_prev"
		},
		breakpoints: { 
			1081: {
			  slidesPerView: 5,
			},
			  768: {
			  slidesPerView: 4,
			},
			  481: {
			  slidesPerView: 3,
			}
		 }

	});


});