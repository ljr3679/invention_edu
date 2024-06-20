<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- common -->
<script type="text/javascript" src="/js/cmmn/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery-ui.custom.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery.PrintArea.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery.timepicker.js"></script>
<script type="text/javascript" src="/js/cmmn/common_datepicker.js"></script>
<script type="text/javascript" src="/js/cmmn/select2.min.js"></script>
<script type="text/javascript" src="/js/cmmn/common_util.js"></script>
<!-- common -->

<!-- editor -->
<!-- script type="text/javascript" src="/resources/editor/SmartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script -->
<script type="text/javascript" src="/resources/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<!-- editor -->

<!-- admin -->
<script type="text/javascript" src="/js/cmmn/webfont.js"></script>
<script type="text/javascript">
	WebFont.load({
		// For google fonts
		google: {
			families: ['Open Sans']
		},
		// For early access or custom font
		custom: {
			families: ['Noto Sans KR', 'NanumSquare', 'Spoqa Han Sans'],
			urls: ['/css/cmmn/admin/notosans.css', '/css/cmmn/admin/nanumsquare.css', '/css/cmmn/admin/SpoqaHanSans.css']
		}
	});
	
	$(function(){
		/* header height */
		var headH = $(".admin_header").outerHeight();
		$(".admin_contents_left").css("top", headH);

		$(window).resize(function(){
			headH = $(".admin_header").outerHeight();
			$(".admin_contents_left").css("top", headH);
		});
		
		
		/* head_util select */
		var $headUtilBtn = $("#admin_head_util_btn");
		var $headUtilBtn2 = $("#admin_head_util_btn2");
		
		$headUtilBtn.click(function(e){
			$("#slt_option2").hide();
			$headUtilBtn2.removeClass("on");
			
			e.stopPropagation();
			$(this).toggleClass("on");
			$("#slt_option").stop(true,true).slideToggle(200);
		});
		
		$(document).click(function(){
			$("#slt_option").hide();
			$headUtilBtn.removeClass("on");
		});
		
		
		$headUtilBtn2.click(function(e){
			$("#slt_option").hide();
			$headUtilBtn.removeClass("on");
			
			e.stopPropagation();
			$(this).toggleClass("on");
			$("#slt_option2").stop(true,true).slideToggle(200);
		});
		
		$(document).click(function(){
			$("#slt_option2").hide();
			$headUtilBtn2.removeClass("on");
		});
		
		/* cc_layer */
		$("#cc_layer_open").click(function(){
			$(".cc_layer_box").stop(true,true).fadeIn();
			$(".cc_layer").addClass("animated");
		});
								
		$(".cc_layer_close").click(function(){
			$(".cc_layer_box").stop(true,true).fadeOut();
		});
	});
	
	function fn_adm_logout() {
		if(confirm('로그아웃 하시겠습니까?')) {
			$('#adminLoginForm').attr('action',"/cmsManager/cms/logout.act");
			$('#adminLoginForm').submit();
		}
	}
	
	function fn_global_site_info(info) {
		fn_cmmn_ajax('/cmsManager/cms/site_info_set.ajax', true, {'info':info}, 'text', function(result) {
			if(result == 'T') location.href = '/cmsManager/cms/main.do';
		});
	}
	
	function fn_menu_move(url,menuPos) {
		$('#adminMenuForm').find('#menuPos').val(menuPos);
		$('#adminMenuForm').attr('action', url);
		$('#adminMenuForm').submit();
	}
	
	function fn_cmmn_page(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}

	function fn_cmmn_search() {
		$('#pageIndex').val('1');
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}
	
	function fn_cmmn_page2(pageNo) {
		$('#pageIndex2').val(pageNo);
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}

	function fn_cmmn_search2() {
		$('#pageIndex2').val('1');
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}
</script>
<!-- admin -->