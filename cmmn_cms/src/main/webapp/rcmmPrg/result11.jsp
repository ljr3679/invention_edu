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
				<article class="result">
					<h3 id="subTitle" class="subtitle">추천 프로그램</h3>

					<div class="scroll_box">
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">지역별 발명교육센터 안내</h5>
							<div>도서벽지 학교, 지역아동센터 등 교육취약계층 대상으로 현장에서 직접 소통하는 ‘찾아가는 창의 창의발명교육’을 제공하여 사회적 교육격차 해소 및 창의발명인재 육성하는 센터입니다.</div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">학생발명 전시회 안내</h5>
							<div>우수 학생 발명품을 발굴·시상하고 전시하여학생들의 발명의식 고취 및 창의력 계발에 기여하는 전시회입니다.</div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">창의력 챔피언 대회 안내</h5>
							<div>학생들이 팀을 이루어 시도 예선대회(표현, 즉석과제)와 본선대회(표현, 제작, 즉석과제)를 참가하여 창의력과 문제해결능력을 함양하고, 우수팀 시상을 통해 창의 인재를 육성하는 대회입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go3();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">YIP 안내</h5>
							<div>미래 융·복합 시대에 필요한 창의적 사고력, 비판적 능력, 소통과 협업을 겸비한 창의적 인재, 더불어 기업가 정신과 창업역량까지 갖춘 창의 발명 인재를 양성하는 교육 프로그램입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go4();">
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
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=4');
		}

		function go2() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=10');
		}

		function go3() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=22');
		}

		function go4() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=54');
		}

		function reset() {
			location.href = './index.jsp';
		}

	</script>
</body>

</html>
