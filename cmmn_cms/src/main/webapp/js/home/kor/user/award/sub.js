$(function(){
 
    $('.com_tab_cont .list li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('.com_tab_cont .list li').removeClass('on');
		$('.info_txt').removeClass('on');

		$(this).addClass('on');
		$("#"+tab_id).addClass('on');
        
        return false;
	});


	//아이디어 경진대회 VIEW 이미지 슬라이드
	var silde_list = $('#slide_list');
		silde_list.slick({
			slidesToShow: 1, // 슬라이드 show 갯수
			slidesToScroll: 1,
			infinite: true, // 무한슬라이드
			dots: true, // 슬라이드 점표시
			speed: 500,
			arrows: false, // 슬라이드 좌우 움직임 화살표 표시
			autoplay: true, // 자동 슬라이드 넘김
			autoplaySpeed: 5000, // 자동 슬라이드 넘김 타이밍
			adaptiveHeight: true,


		});

		$(".play_box .nav").click(function(){
			 if($(this).hasClass("prev")){
				 silde_list.slick('slickPrev');
			 }
		 });

		$(".play_box .nav").click(function(){
			 if($(this).hasClass("next")){
				 silde_list.slick('slickNext');
			 }
		 });

		var items = $("#slide_list .slick-dots li").length;
        $(".nav_box .num .now").text("1");
        $(".nav_box .num .total").text(items);

        silde_list.on('afterChange', function(event, slick, direction){
            var item = $(event.currentTarget).find(".slick-dots .slick-active").index();
            $(".nav_box .num .now").text(item+1);
		});


});