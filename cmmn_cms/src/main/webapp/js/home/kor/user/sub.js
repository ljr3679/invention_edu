$(function(){

	//상세검색 버튼
	$('.details_sch .sch_box .box').eq(1).hide();

	$(".det_btn .btn").on('click', function(){
		if($('.details_sch .sch_box .box').eq(1).hasClass('on')){
			$('.det_btn .btn').removeClass('on');
			$('.details_sch .sch_box .box').eq(1).removeClass('on');
			$('.details_sch .sch_box .box').eq(1).slideUp(500);
		} else {
			$('.det_btn .btn').addClass('on');
			$('.details_sch .sch_box .box').eq(1).addClass('on');
			$('.details_sch .sch_box .box').eq(1).slideDown(500);
		}
	});

	// FAQ
    $(".q_area").on('click', function(){
        $(this).parents('li').siblings().removeClass('on');
        $(this).parents('li').slideDown(500).toggleClass('on');
    });

	

	
	$('.com_tab_list .list li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('.com_tab_list .list li').removeClass('on');
		$('.sub_tab_cont').removeClass('on');

		$(this).addClass('on');
		$("#" + tab_id).addClass('on');

		return false;

	});
	
	$('.tab_com_cont .list li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('.tab_com_cont .list li').attr('title', '선택되지 않음').removeClass('on');
		$('.tab_cont').removeClass('on');

		$(this).attr('title', '선택됨').addClass('on');
		$("#" + tab_id).addClass('on');
		return false;
	});

	



	$(".btn_bottom button").click(function () {
		if ($(this).hasClass('btn_open')) {
			$('.search_wrap .detail').slideDown();
			$(this).hide();
			$('.btn_bottom .btn_close').show();
			console.log('open');
		} else if ($(this).hasClass('btn_close')) { 
			$('.search_wrap .detail').slideUp();
			$(this).hide();
			$('.btn_bottom .btn_open').show();
			console.log('close');
		}
	});

});
