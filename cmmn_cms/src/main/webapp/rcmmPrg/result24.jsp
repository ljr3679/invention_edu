<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>발명 추천 프로그램 테스트</title>
	<meta name="description" content="나랑 꼭 맞는 발명 프로그램 추천해주는 사이트" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="발명 추천 프로그램 테스트" />
	<meta property="og:description" content="나는 어떤 프로그램이 좋을까?" />
	<link rel="stylesheet" href="./bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
	<link rel="stylesheet" href="style.css" />
   	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<!-- 폰트 추가 -->
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet" />
</head>

<body class="container">
	<div class="phone_body">
		<div class="top_area">
			<div class="logo"><img src="https://www.ip-edu.net/images/home/kor/user/common/logo.png" alt=""></div>
			<button class="xxx"><i class="xi-close"><span class="hide">닫기</span></i></button>
		</div>
		<div class="view">
			<div>

				<article class="result" style="display:block;">
					<h3 id="subTitle" class="subtitle">추천 프로그램</h3>

					<div class="scroll_box">
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">협력교원 POOL 소개</h5>
							<div>발명교육과 발명교사의 수요 증가에 따른 발명교육의 체계적 질 관리를 위해 도입된 교원의 협력·교육 이력 관리 시스템입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>

						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">협력교원 POOL 등록</h5>
							<div> 협력교원의 협력·교육 이력 관리 시스템 등록 (로그인 회원만 가능)</div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>
					</div>
					<div class="back">
						<div class="btn btn_base b03_skewed_slide_in">
							<div onclick="reset();">다시 테스트 하기!</div>
						</div>
					</div>

					<!-- Go to www.addthis.com/dashboard to customize your tools -->
					<div class="share addthis_inline_share_toolbox"></div>
				</article>
				<article class="kakao_ad ">
					<ins class="kakao_ad_area" style="display: none" data-ad-unit="DAN-PwXjskx5WFbEMAMI" data-ad-width="320" data-ad-height="100"></ins>
				</article>

			</div>
		</div>
	</div>
	<div class="body_bg">
		<div class="bg_character1"><img src="/images/test/character1.png" alt=""></div>
		<div class="bg_character2"><img src="/images/test/character2.png" alt=""></div>
	</div>


	<script>
		function go1() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=124');
		}

		function go2() {
			window.open('https://ip-edu.net/home/kor/pool/contact/join.act');
		}


		function reset() {
			location.href = './index.jsp';
		}

	</script>
</body>

</html>
