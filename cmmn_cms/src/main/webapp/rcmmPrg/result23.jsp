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
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">종합교육연수원</h5>
							<div>정규 교육과정 개편내용에 맞춰 발명교육 관련 교사 수요 대비 및 교수능력 향상을 위해 발명교사 연수체계 구축 </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">발명교사 인증제</h5>
							<div>「발명교육의 활성화 및 지원에 관한 법률」 제9조제4항 및 「동법 시행령」 제6조의2에 따라, 우수한 발명교육 역량을 갖춘 자를 발명교사로 인증하는 제도 </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">발명교사교육센터</h5>
							<div>우수 발명(영재)교원의 육성을 위해 전국의 교육대학·사범대학 중 3개 대학을 발명 교원 육성 거점 대학으로 선정하여 발명교사교육센터를 운영 </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go3();">
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
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=116');
		}

		function go2() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=120');
		}

		function go3() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=126');
		}

		function reset() {
			location.href = './index.jsp';
		}

	</script>
</body>

</html>
