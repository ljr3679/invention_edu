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
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">청소년발명패스티벌</h5>
							<div>발명교육의 핵심인 체험(실습) 중심의 교수·학습방법 연수를 실시하며 발명교육센터, 발명영재교육기관 등의 교사에게 필요한 교수·학습방법을 맞춤형 프로그램에 의한 연수 및 컨텐츠 제공 </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">대한민국학생발명전시회</h5>
							<div>우수 학생 발명품을 발굴·시상하고 전시하여 학생들의 발명의식 고취 및 창의력 계발에 기여하는 전시회입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">대한민국학생창의력챔피언대회</h5>
							<div>학생들이 팀을 이루어 시도 예선대회(표현, 즉석과제)와 본선대회(표현, 제작, 즉석과제)를 참가하여 창의력과 문제해결능력을 함양하고, 우수팀 시상을 통해 창의 인재를 육성하는 대회입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go3();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">대한민국 발명교육대상</h5>
							<div>발명교육 및 발명문화 확산 등에 공헌한 교원을 발굴·시상함으로써 발명교원의 사기 진작 및 자긍심 고취, 선정된 교원의 우수사례 확산을 통해 발명교육 및 교원의 역할 모델을 제시하여 발명교육 및 발명문화 확산 </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go4();">
									자세히 보기...
								</button>
							</div>
						</div>		
												
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">전국교원발명교육연구대회</h5>
							<div>발명교육 현장의 교수·학습·교육행정 등에 관한 연구를 발굴하여 발명교육 지도교원 연구능력 제고, 발명교육 자료, 교재 및 교수법 등 새로운 발명교육 콘텐츠 개발 및 확산을 통한 발명교육 저변 확대 </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go5();">
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
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=50');
		}

		function go2() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=14');
		}

		function go3() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=26');
		}

		function go4() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=37');
		}

		function go5() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=43');
		}
		
		function reset() {
			location.href = './index.jsp';
		}

	</script>
</body>

</html>
