<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!--[if lt IE 9]>
		<script src="/js/css3-mediaqueries.js"></script>
	<![endif]-->
<meta charset="euc-kr">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<script src="//ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js"></script>
<!-- <script type="text/javascript">
	WebFont.load({
		// For google fonts
		google: {
		  families: ['Open+Sans']
		},
		// For early access or custom font
		custom: {
			families: ['Noto Sans Korean'],//'Nanum Gothic'
			urls: ['/css/notosans.css']
			//'http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
		}
	});
</script> -->

<!-- <title>Cyber Tips</title><link rel='stylesheet' href='/css/notosans.css' type='text/css'> -->
<!-- <link rel='stylesheet' href='/css/reset.css' type='text/css'> -->
<!-- <link rel='stylesheet' href='/css/often.css' type='text/css'> -->
<!-- <link rel='stylesheet' href='/css/common.css' type='text/css'> -->
<!-- <link rel='stylesheet' href='/css/print.css' type='text/css' media='print'> -->
<!-- <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script> -->
<!-- <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script> -->
<!-- <script type="text/javascript" src="/js/jquery.easing.1.3.js"></script> -->
<!--<script type="text/javascript" src="/js/jquery.cookie.js"></script>-->
<!-- <script type="text/javascript" src="/js/snsShare.js"></script> -->
<!-- <script type="text/javascript" src="/js/placeholders.min.js"></script> -->
<!-- <script type="text/javascript" src="/js/common.js"></script> -->
<!-- <script type="text/javascript" src="/js/jquery.PrintArea.js"></script> -->

	<!--[if lt IE 9]>
		<script src="/js/html5shiv.js"></script>
		<script src="/js/respond.js"></script>
	<![endif]-->

	<style type="text/css">
		.error_wrap .inner_box {max-width:600px; margin:0 auto; padding-top:100px;}
		.error_wrap .top {height:150px; padding:60px 0 30px 200px; border-bottom:1px solid #ccc; background: url('/images/sub/error_page.png') 10% center no-repeat;}
		.error_wrap h1 {font-size:1.51em;}
		.error_wrap .middle {padding:20px 40px;}
		.error_page_btn {display:inline-block; width:90px; height:35px; line-height:35px; margin: 0 3px; color:#fff; text-align:center; background-color:#775757;}
		.error_page_btn.back {background-color:#999;}
		
		@media all and (max-width:480px){
			.error_wrap .top {height:auto; padding:20px 5px; background:none; text-align:center;`}
		}
	</style>

</head>
<body>
	<div class="error_wrap">
		<div class="inner_box">
			<div class="top">
				<h1>페이지 오류 안내</h1>
			</div>
			<div class="middle">
				<p>홈페이지 이용에 불편을 드려 죄송합니다.<br>
				새로고침(F5키)을 누르시거나, 잠시 후에 이용해 주십시요.222<br>
				동일한 문제가 지속적으로 발생할 경우 관리자에게 문의해주시기 바랍니다.<br><br>
				연락처 : 031)724-0072, 031)704-6623</p>
				
				<%
// 				String hostURL = request.getRequestURL().toString().replace(request.getRequestURI(),"");
				String hostURL = request.getRequestURL().toString();
				
				out.write(hostURL);
				
				boolean sss = hostURL.contains("ict-admin");
				out.write(hostURL + ": " + sss);
				%>
			</div>
			<div class="btn_wrap ta_c">
				<a href="/" class="error_page_btn">홈으로</a>
				<a href="#" class="error_page_btn back" onclick="page_back(); return;">뒤로가기</a>
			</div>
		</div>
	
		<script type="text/javascript">
			/* page_back  */
			function page_back(){
				history.go(-1)();
			}
		</script>
	</div>

</body>
</html>