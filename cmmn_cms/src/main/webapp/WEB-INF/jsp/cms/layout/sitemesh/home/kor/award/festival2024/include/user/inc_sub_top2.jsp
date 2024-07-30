<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->

<div class="bread_box bg04">
	<div class="container">
		<div class="title_area">
			<div class="title">
				<span class="text">YIP(청소년 발명가 프로그램) </br>IP 마이스터 프로그램 </span>
			</div>
		</div>
		<ul class="breadcrumb clearfix">
			<li class="home"><a href="/home/kor/award/festival2024/main.do?menuPos=1"><img src="/images/home/kor/user/award/common/home.png?t=20220907160719" alt="홈으로"></a></li>
			<li>
				청소년 발명가 프로그램 <span>(YIP)</span>
			</li>
			
		</ul>
		<ul class="btn_list">
			<li class="share">
			    <a href="#">SNS</a>
				<ul class="sub_share_box">
					<li class="facebook"><a href="#" onclick="SnsShare.fbShare(document.location.href); return false;"><i class="xi-facebook"></i><span class="hide">페이스북으로 공유</span></a></li>
					<li class="twitter"><a href="#" onclick="SnsShare.twShare(document.title, document.location.href); return false;"><i class="xi-twitter"></i><span class="hide">트위터로 공유</span></a></li>
					<li class="blog"><a href="#" onclick="SnsShare.blogShare(document.title, document.location.href); return false;"><i class="xi-naver-square"></i><span class="hide">네이버블로그로 공유</span></a></li>
				</ul>
			</li>
			<li class="print"><a href="#">프린트</a></li>
		</ul>
	</div>
</div>