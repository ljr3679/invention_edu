$(function(){
	var $gnb = $(".gnb"),
		$mGnb = $(".m_gnb"),
		$sitemap = $(".sitemap"),
		$topBtn = $(".top_btn"),
		$contents = $(".contents"),
		$header = $(".header"),
		$gnbClone = $gnb.html(),

		mGnbReady = false,
		sitemapReady = false,
		pageY,
		footH,
		contentsFrontY;

	// m_gnb, sitemap 蹂듭궗
		//$mGnb.html($gnbClone);
		//$mGnb.find(".sub_gnb").attr("class","m_sub_gnb");
		//$mGnb.find(".sub2_gnb").attr("class","m_sub2_gnb");
		$sitemap.html($gnbClone);
		$sitemap.find(".sub_gnb").attr("class","sitemap_sub_gnb");
		$sitemap.find(".sub2_gnb").attr("class","sitemap_sub2_gnb");

	
	// gnb �ㅻ쾭 ��
	$('.gnb > li, .gnb_bg').hover(function(){
		$(".sub_gnb").stop().fadeIn(300);
		$(".gnb_bg").stop().fadeIn(300);
		$(".header .gnb_header").addClass("on");
		
	}, function(){
		$(".sub_gnb").stop().fadeOut(10);
		$(".gnb_bg").stop().fadeOut(10);
		$(".header .gnb_header").removeClass("on");
	});

	$(".gnb > li a, .gnb_bg").focus(function(){
		$(".sub_gnb").stop().fadeIn(300);
		$(".gnb_bg").stop().fadeIn(300);
		$(".header .gnb_header").addClass("on");
	});
	$(".gnb, .gnb_bg").focusout(function(){
		$(".sub_gnb").stop().fadeOut(300);
		$(".gnb_bg").stop().fadeOut(300);
		$(".header .gnb_header").removeClass("on");
	});


	

	$(window).load(function(){
		/* contents */
		var footH = $("#footer").outerHeight();
		$(".contents").css("padding-bottom", footH);
	});

	$(window).resize(function(){
		/* contents */
		var footH = $("#footer").outerHeight();
		$(".contents").css("padding-bottom", footH);
	});
	$(window).trigger("resize");



	// �ㅽ겕濡� ��
	$(window).scroll(function(){
		if($("body").hasClass("scroll_fixed")==false){
			pageY = window.pageYOffset;
			contentsFrontY = $contents.offset().top;

			if(pageY > 0){
				$header.addClass("scrolled");
			}
			else{
				$header.removeClass("scrolled");
			}
		}
		else{}
	});
	$(window).scroll();

	




	/* foot_site_menu */
	var foot_site_speed = 300,
		foot_site_easing = "easeOutQuint";
	$(".site_btn").click(function(e) {
		if ($(this).siblings(".site_link").is(":hidden")) {
			$(".site_link:visible").slideUp(foot_site_speed, foot_site_easing);
			$(this).addClass("on").siblings(".site_link").slideDown(foot_site_speed, foot_site_easing);
		} else {
			$(this).removeClass("on").siblings(".site_link").slideUp(foot_site_speed, foot_site_easing);
		}
		e.stopPropagation();
	});

	$(document).click(function() {
		$(".site_btn").removeClass("on");
		$(".site_link:visible").slideUp(foot_site_speed, foot_site_easing);
	});

	$(".tab_wrap .video_cont .img_wrap").click(function(){
		$(".popup_layer").addClass("video");

	});

	$(".popup_layer > .cont .close").click(function(){
		$(".popup_layer").removeClass("video");
	});

	//怨듯넻��
	$('.com_tab_cont .list li').click(function() {
		var tab_id = $(this).attr('data-tab');
		$('.com_tab_cont .list').removeClass('on');
		$('.com_tab_cont .list li').removeClass('on');
		$('.com_tab_info').removeClass('on');

		$(this).addClass('on');
		$("#" + tab_id).addClass('on');

		return false;

	});

	$('.com_tab_cont.sty1 .list li').click(function() {
		var text =$(this).html()
		$(".tab_slt_box").html(text);
		$('.com_tab_cont.sty1 .list').removeClass('on');
		return false;
	});

	$('.tab_slt_box').click(function() {
		$('.com_tab_cont.sty1 .list').toggleClass('on');
		$(this).toggleClass('on');
	});

	$('.com_tab_cont.sty1 .list li button').click(function() {
		var text = $(this).html();
		$('.left_tit .get_txt').html(text);
	});
	
	var past_silde1 = $('#past_silde_list1');
		past_silde1.slick({
		slidesToShow: 4, 
		slidesToScroll: 4,
		infinite: true,
		dots: false,
		arrows: false,
//		autoplay: true,
		autoplaySpeed: 3000,
		speed: 600,
		  responsive: [
			{
			  breakpoint: 1081,
			  settings: {
				slidesToShow: 3,
				slidesToScroll: 3,
			  }
			},
			{
			  breakpoint: 768,
			  settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			  }
			}
		  ]
	});

	var past_silde1_1 = $('#past_silde_list1_1');
		past_silde1_1.slick({
		slidesToShow: 4, 
		slidesToScroll: 1,
		infinite: true,
		dots: false,
		arrows: false,
//		autoplay: true,
		autoplaySpeed: 3000,
		speed: 600,
		  responsive: [
			{
			  breakpoint: 1081,
			  settings: {
				slidesToShow: 3,
				slidesToScroll: 1,
			  }
			},
			{
			  breakpoint: 768,
			  settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			  }
			}
		  ]
	});

	var past_silde2 = $('#past_silde_list2');
		past_silde2.slick({
		slidesToShow: 4, 
		slidesToScroll: 4,
		infinite: true,
		dots: false,
		arrows: false,
//		autoplay: true,
		autoplaySpeed: 3000,
		speed: 600,
		  responsive: [
			{
			  breakpoint: 1081,
			  settings: {
				slidesToShow: 3,
				slidesToScroll: 3,
			  }
			},
			{
			  breakpoint: 768,
			  settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			  }
			}
		  ]
	});

	var past_silde3 = $('#past_silde_list3');
		past_silde3.slick({
		slidesToShow: 4, 
		slidesToScroll: 4,
		infinite: true,
		dots: false,
		arrows: false,
//		autoplay: true,
		autoplaySpeed: 3000,
		speed: 600,
		  responsive: [
			{
			  breakpoint: 1081,
			  settings: {
				slidesToShow: 3,
				slidesToScroll: 3,
			  }
			},
			{
			  breakpoint: 768,
			  settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			  }
			}
		  ]
	});

	$(".slide1 .slick-prev").click(function(){
		if($(this).hasClass("prev")){
			past_silde1.slick('slickPrev');
		}
	});
   $(".slide1 .slick-next").click(function(){
		if($(this).hasClass("next")){
			past_silde1.slick('slickNext');
		}
	});
	
	$(".slide2 .slick-prev").click(function(){
		if($(this).hasClass("prev")){
			past_silde2.slick('slickPrev');
		}
	});
   $(".slide2 .slick-next").click(function(){
		if($(this).hasClass("next")){
			past_silde2.slick('slickNext');
		}
	});

	$(".slide3 .slick-prev").click(function(){
		if($(this).hasClass("prev")){
			past_silde3.slick('slickPrev');
		}
	});
   $(".slide3 .slick-next").click(function(){
		if($(this).hasClass("next")){
			past_silde3.slick('slickNext');
		}
	});
	
	$(".slide1_1 .slick-prev").click(function(){
		if($(this).hasClass("prev")){
			past_silde1_1.slick('slickPrev');
		}
	});
   $(".slide1_1 .slick-next").click(function(){
		if($(this).hasClass("next")){
			past_silde1_1.slick('slickNext');
		}
	});
	
    if($('.calendar').length > 0) {
        $('.calendar input').datepicker();
    }

});

//title媛� 媛��몄삤湲�

/*
$("document").ready(function() {
	$('.right_cont').each(function(){
		var jb = $(this).children('h5').text();
			console.log('aa : ',jb);
			$(this).before('<div class="left_tit">' + jb + '</div>');
	});
});
*/