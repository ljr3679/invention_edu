$(function(){
	var $gnb = $(".gnb"),
		$mGnb = $(".m_gnb"),
		$sitemap = $(".sitemap"),
		$topBtn = $(".top_btn"),
		$contents = $(".contents"),
		$header = $(".header"),
		$gnbClone = $gnb.html(),
		mGnbReady = false,
		pageY,
		contentsFrontY; // 스크롤 시 gnb 고정을 위한 이벤트 발생 offset 값 설정.

	// m_gnb, sitemap 복사
	$mGnb.html($gnbClone);
	$sitemap.html($gnbClone);
	$mGnb.find(".sub_gnb").attr("class","m_sub_gnb");
	$mGnb.find(".sub2_gnb").attr("class","m_sub2_gnb");
	$sitemap.find(".sub_gnb").attr("class","sitemap_sub_gnb");
	$sitemap.find(".sub2_gnb").attr("class","sitemap_sub2_gnb");

	

	// sitemap 열기
	$(".sitemap_btn").click(function(){
		$("body").addClass("scroll_fixed");
		black_bg_over();
		$(".sitemap_wrap").stop().fadeIn(300);
	});

	// sitemap 닫기
	$(".sitemap_close").click(function(){
		$("body").removeClass("scroll_fixed");
		black_bg_leave();
		$(".sitemap_wrap").stop().fadeOut(300);
	});

	// m_gnb 열기
	$(".m_gnb_btn").click(function(e){
		$("body").addClass("scroll_fixed");
		mGnbReady = true;
		black_bg_over();
		$(".m_gnb_bg").show().animate({opacity:0.5}, 400);
		$(".m_gnb_wrap").show().animate({right:0});
	});

	
	// m_gnb 닫기
	$(".m_gnb_bg, .m_gnb_close").click(function(e){
		$("body").removeClass("scroll_fixed");
		mGnbClose();
		return false;
	});

	// mGnbClose function
	function mGnbClose(){
		$("body").removeClass("scroll_fixed");
		$(".m_gnb_bg").stop().animate({opacity:0}, 400, function(e){
			$(this).hide();
		});
		$(".m_gnb_wrap").stop().animate({right:-480}, function(e){
			$(this).hide();
			black_bg_leave();
		});
		mGnbReady = false;
	}
	
	// black_bg function
	function black_bg_over(){
		$("body").css({"overflow-y":"hidden"});
	}
	function black_bg_leave(){
		$("body").css({"overflow-y":"visible"});
	}



	// 스크롤 시
	$(window).scroll(function(){
		if($("body").hasClass("scroll_fixed")==false){
			pageY = window.pageYOffset;
			contentsFrontY = $contents.offset().top;
			if(pageY>=200){
				$topBtn.css({visibility:"visible"}).stop().animate({opacity:1}, 300);
			}
			else{
				$topBtn.stop().animate({opacity:0}, 300, function(){
					$(this).css({visibility:"hidden"});
				});
			}

			if(pageY>=contentsFrontY){
				$header.addClass("scrolled");
			}
			else{
				$header.removeClass("scrolled");
			}
		}
		else{}
	});
	$(window).scroll();


	// 반응형 시
	$(window).resize(function(){
		/* mGnb_control */
		windowW = window.innerWidth;
		if(windowW<991){
			$("body").removeClass("scroll_fixed");
			black_bg_leave();
			$(".sitemap_wrap").stop().fadeOut(300);
		}
		else{
			if(mGnbReady){
				mGnbClose();
			}
		}
	});
	$(window).trigger("resize");

	$(window).resize(function(){
		/* contents */
		var footH = $("#footer").outerHeight();
		//$(".contents").css("padding-bottom", footH);
	});

	$(window).trigger("resize");


	// top 버튼 클릭 시
	$(".top_btn, .foot_top_btn").click(function(){
		$("html,body").animate({scrollTop:0}, 300);
	});

	// share 버튼 클릭 시
	$(".share_btn").click(function(){
		$(".q_share_menu").stop().fadeToggle(300);
	});

	// 첨부파일 이벤트
	$(".attach_vinput").click(function(){
		$(this).parent().siblings(".attach_input").trigger("click");
	});
	$(".attach_input").on("change",function(){
		var attText = $(this).val();
		var attTextIndex = attText.lastIndexOf("\\") + 1;
		attText = attText.slice(attTextIndex);
		$(this).next().find(".attach_vinput").val(attText);
	});

	// 기본 탭 on, off
	var basicTabIndex;
	$(".basic_tab.onoff li a").click(function(){
		basicTabIndex = $(this).parent().index();
		$(this).parent().addClass("on").siblings().removeClass("on");
		$(this).parent().parent().siblings(".basic_tab_con_box").children().hide().eq(basicTabIndex).show();

		return false;
	});
    
    // table 반응형 했을때 앞 타이틀 제공
	$(".sub_cont thead tr th").each(function(index){
		var thname = $(this).text()

		console.log(thname);

		$(".sub_cont tbody tr").each(function(i){
			$(".sub_cont tbody tr").eq(i).find('td').eq(index).attr("data-th", thname);
		});

		//$("tbody tr td").eq(index).attr("data-th", thname);
	});

	// 프린트버튼
	$(".bread_box .btn_list > li.print > a").click(function(){
		window.print();
		return false;
	});
    
});


$('.m_slt_cont .slt_tit').on('click', function(){
	$(this).closest('.m_slt_cont').toggleClass('on');
});


if($(".bread_box .breadcrumb > li").length > 3){
	$(".bread_box .breadcrumb").addClass("depth3");
}

$(function(){
	var speed = 500,
	easing = "easeOutQuint";

	// depth 열린 상태일 경우 안보이게
	$(document).click(function(){
		$(".bread_box .breadcrumb > li").removeClass("on");
		$(".bread_box .breadcrumb > li .depth_list:visible").slideUp();
		$(".bread_box .btn_list > li .sub_share_box:visible").hide();
		
	});

	// breadcrumb의 li 클릭 시
	$(".bread_box .breadcrumb > li > a").click(function(){
		if(!$(this).parent("li").hasClass("home")){
			if($(this).next(".depth_list").is(":hidden")){
				$(".bread_box .breadcrumb > li").removeClass("on");
				$(".depth_list:visible").slideUp(speed, easing);
				$(this).parent("li").addClass("on");
				$(this).next(".depth_list").slideDown(speed, easing);
			}
			else{
				$(this).parent("li").removeClass("on");
				$(this).next(".depth_list").slideUp(speed, easing);
			}
			return false;
		}
	});

	// 공유버튼
	$(".bread_box .btn_list > li.share > a").click(function(){
		if($(this).next(".sub_share_box").is(":hidden")){
			$(".sub_share_box:visible").hide();
			$(this).next(".sub_share_box").show();
		}
		else{
			$(this).next(".sub_share_box").hide();
		}
		return false;
	});

	// 프린트버튼
	$(".bread_box .btn_list > li.print > a").click(function(){
		window.print();
		return false;
	});
});
