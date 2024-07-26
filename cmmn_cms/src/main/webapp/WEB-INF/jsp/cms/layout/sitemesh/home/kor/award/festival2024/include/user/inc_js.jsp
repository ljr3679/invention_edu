<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- common -->
<script type="text/javascript" src="/js/cmmn/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery-ui.custom.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery.PrintArea.js"></script>
<script type="text/javascript" src="/js/cmmn/jquery/jquery.timepicker.js"></script>
<script type="text/javascript" src="/js/cmmn/select2.min.js"></script>
<script type="text/javascript" src="/js/cmmn/common_datepicker.js"></script>
<script type="text/javascript" src="/js/cmmn/common_util.js"></script>
<!-- common -->

<!-- editor -->
<!-- <script type="text/javascript" src="/resources/editor/SmartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<!-- editor -->

<!-- user -->

<!-- <script src="/js/home/kor/user/award/jquery-1.11.1.min.js"></script> -->
<script src="/js/home/kor/user/award/common.js"></script>
<script type="text/javascript" src="/js/home/kor/user/slick.min.js"></script>
	
<script type="text/javascript">
	/* 브라우저 체크 (IE) */
	var ua = navigator.userAgent.toLowerCase();
	if( ua.indexOf( 'msie' ) != -1 || ua.indexOf( 'trident' ) != -1 ) {
		var version = 11;
		ua = /msie ([0-9]{1,}[\.0-9]{0,})/.exec( ua );
		if( ua )
		{
			version = parseInt( ua[ 1 ] );
		}
		var classNames = '';
		classNames += ' is-ie';
		classNames += ' ie' + version;
		for( var i = version + 1; i <= 11; i++ ) {
			classNames +=  ' lt-ie' + i;
		}
		document.getElementsByTagName( 'html' )[ 0 ].className += classNames;
	}
	
	$(document).ready(function() {
		$('form').on('submit', function(event) {
			show_loader();
			
			if($(this).attr('id') != 'cmmnFileDownForm' && $(this).attr('action').indexOf('.do') != -1) $(this).attr('method', 'get');
			
			var menuPosIdObj = $(this).find('#menuPos').length;
			var menuPosNameObj = $(this).find('input[name="menuPos"]').length;
			if(!menuPosIdObj && !menuPosNameObj) $(this).prepend('<input type="hidden" id="menuPos" name="menuPos" value="${menuPos}"/>');
		});
	});
	
	function fn_menu_move(url,menuPos) {
		$('#userMenuForm').find('#menuPos').val(menuPos);
		$('#userMenuForm').attr('action', url);
		$('#userMenuForm').submit();
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
<!-- user -->