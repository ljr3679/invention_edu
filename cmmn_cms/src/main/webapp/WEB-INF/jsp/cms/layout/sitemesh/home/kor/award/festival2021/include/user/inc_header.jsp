<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->

<div class="header">
	<!-- skip_navi -->
	<dl class="skip_navi">
		<dt class="hide"><strong>바로가기 메뉴</strong></dt>
		<dd><a href="#real_contents">본문 바로가기</a></dd>
		<dd><a href="#gnb">주메뉴 바로가기</a></dd>
	</dl>
	<!-- // skip_navi -->
	<!-- gnb_header -->
	<div class="gnb_header">
		<div class="container2">
			<div class="logo"><a href="/home/kor/award/festival2021/main.do"><img src="/images/home/kor/user/award/common/logo.png"
						alt="자체발광 2021 청소년 발명 페스티벌"></a></div>
			<!-- gnb -->
			<ul id="gnb" class="gnb">
				<li><a href="/home/kor/award/festival2021/exhibition/index.do?menuPos=1&tabPos=1"><span class="text">대한민국학생발명전시회 수상작 전시관</span></a></li>
				<li><a href="/home/kor/award/festival2021/promotion/index.do?menuPos=1&tabPos=2"><span class="text">창의발명교육사업 홍보관</span></a></li>
				<li><a href="/home/kor/award/festival2021/champion/index.do?menuPos=1&tabPos=3"><span class="text">대한민국학생 창의력챔피언대회</span></a></li>
				<li><a href="/home/kor/award/festival2021/competition/index.do?menuPos=1&tabPos=4"><span class="text">YIP(청소년발명가프로그램) 아이디어 경진대회</span></a></li>
				<li><a href="/home/kor/award/festival2021/program/index.do?menuPos=1&tabPos=5"><span class="text">창의체험프로그램</span></a></li>
			</ul>
			<!-- // gnb -->
	
	
			<button type="button" class="sitemap_btn"><img src="/images/home/kor/user/award/common/sitemap_btn_icon.png"
					alt=""></button>
			<button type="button" class="m_gnb_btn">
				<span class="hide">모바일 주 메뉴 열기</span>
				<span class="top"></span>
				<span class="mid"></span>
				<span class="btm"></span>
			</button>
		</div>
	
		<div class="gnb_bg"></div>
	</div>
	<!-- // gnb_header -->
	<!-- m_gnb_wrap -->
	<div class="m_gnb_wrap">
		<!-- m_gnb_top -->
		<div class="m_gnb_top">
			<h2 class="m_logo"><a href="award2021" title="홈으로"><img src="/images/home/kor/user/award/common/logo.png"
						alt=""></a>
			</h2>
			<span class="mid_helper"></span>
		</div>
		<!-- // m_gnb_top -->
	
		<!-- m_gnb 내부 태그는 쿼리로 들어감. -->
		<ul class="m_gnb">
			<li><a href="/home/kor/award/festival2021/exhibition/index.do?menuPos=1&tabPos=1"><span class="text">대한민국학생발명전시회 수상작 전시관</span></a></li>
			<li><a href="/home/kor/award/festival2021/promotion/index.do?menuPos=1&tabPos=2"><span class="text">창의발명교육사업 홍보관</span></a></li>
			<li><a href="/home/kor/award/festival2021/champion/index.do?menuPos=1&tabPos=3"><span class="text">대한민국학생 창의력챔피언대회</span></a></li>
			<li><a href="/home/kor/award/festival2021/competition/index.do?menuPos=1&tabPos=4"><span class="text">YIP(청소년발명가프로그램) 아이디어 경진대회</span></a></li>
			<li><a href="/home/kor/award/festival2021/program/index.do?menuPos=1&tabPos=5"><span class="text">창의체험프로그램</span></a></li>
		</ul>
		<!-- // m_gnb -->
	
		<button type="button" class="m_gnb_close"><i class="xi-close"></i><span class="hide">모바일 주 메뉴
				닫기</span></button>
	</div>
	<!-- // m_gnb_wrap -->
	<div class="m_gnb_bg"></div>
	
	<!-- sitemap_wrap -->
	<div class="sitemap_wrap" >
		<div class="container">
			<div class="table_layout">
				<div class="logo_box">
					<div class="logo"><a href="award2021"><img src="award2021/images/common/logo.png" alt=""></a>
					</div>
					<div class="title_box">
						<div class="date">2021. 11. 11(목) ~ 13(토) / 3일간</div>
						<div class="text"><span class="ft_c">킨텍스</span>에서 만나요~!</div>
					</div>
				</div>
				<!-- sitemap -->
				<ul class="sitemap clearfix">
					<li><a href="/home/kor/award/festival2021/exhibition/index.do?menuPos=1&tabPos=1"><span class="text">대한민국학생발명전시회 수상작 전시관</span></a></li>
					<li><a href="/home/kor/award/festival2021/promotion/index.do?menuPos=1&tabPos=2"><span class="text">창의발명교육사업 홍보관</span></a></li>
					<li><a href="/home/kor/award/festival2021/champion/index.do?menuPos=1&tabPos=3"><span class="text">대한민국학생 창의력챔피언대회</span></a></li>
					<li><a href="/home/kor/award/festival2021/competition/index.do?menuPos=1&tabPos=4"><span class="text">YIP(청소년발명가프로그램) 아이디어 경진대회</span></a></li>
					<li><a href="/home/kor/award/festival2021/program/index.do?menuPos=1&tabPos=5"><span class="text">창의체험프로그램</span></a></li>
				</ul>
			</div>
			<!-- // sitemap -->
	
		</div>
		<button type="button" class="sitemap_close"><i class="xi-close"></i><span class="hide">닫기</span></button>
	</div>
</div>