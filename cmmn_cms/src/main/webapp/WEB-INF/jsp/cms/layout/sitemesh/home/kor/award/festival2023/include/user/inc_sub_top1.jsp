<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->

<div class="bread_box bg01">
	<div class="container">
		<div class="title_area">
			<div class="title">
				<span class="text">대한민국학생발명전시회 수상작 전시관</span>
			</div>
		</div>
		<ul class="breadcrumb clearfix depth3">
			<li class="home"><a href="/home/kor/award/festival2023/main.do?menuPos=1"><img src="/images/home/kor/user/award/common/home.png?t=20220902174507" alt="홈으로"></a></li>
			<li>
				대한민국학생발명전시회 수상작 전시관
			</li>
<!-- 			<li>역대대통령상 전시관</li> -->
<!-- 			<li>2022년</li> -->
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
	<script type="text/javascript" language="javascript">
		$("document").ready(function() {

			// depth 열린 상태일 경우 안보이게
			$(document).click(function() {
				$(".bread_box .breadcrumb > li").removeClass("on");
				$(".bread_box .breadcrumb > li .depth_list:visible").slideUp();
				$(".bread_box .btn_list > li .sub_share_box:visible").hide();
			});

			$(".bread_box .btn_list > li.share > a").click(function() {
				if ($(this).next(".sub_share_box").is(":hidden")) {
					$(".sub_share_box:visible").hide();
					$(this).next(".sub_share_box").show();
				} else {
					$(this).next(".sub_share_box").hide();
				}
				return false;
			});
		});

	</script>
</div>