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
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">발명교육센터 소개</h5>
							<div>발명교육센터 운영·지원을 통해 지역의 균형 잡힌 발명교육 저변 구축 및 확대하고, 창의발명교육프로그램 현장 적용을 통해 발명분야에 흥미와 창의적 잠재력을 갖춘 창의인재 조기 육성 및 발굴합니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">발명교육센터 찾기</h5>
							<div>전국에 총 207개 운영되고 있는 발명교육센터의 위치를 지도로 보여줍니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">온라인발명교육지원센터</h5>
							<div>현장 중심의 발명교육에서 디지털 매체를 활용한 실시간 온라인 발명교육으로 전환하여 고품질 발명교육을 지원합니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go3();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">찾아가는 발명체험교실</h5>
							<div>도서벽지 학교, 지역아동센터 등 교육취약계층 대상으로 현장에서 직접 소통하는 ‘찾아가는 창의 창의발명교육’을 제공하여 사회적 교육격차 해소 및 창의발명인재 육성하는 센터입니다. </div>
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
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=1');
		}

		function go2() {
			window.open('https://ip-edu.net/home/kor/center/find/index.do?menuPos=2');
		}

		function go3() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=4');
		}

		function go4() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=9');
		}
		
		function reset() {
			location.href = './index.jsp';
		}

	</script>
</body>

</html>