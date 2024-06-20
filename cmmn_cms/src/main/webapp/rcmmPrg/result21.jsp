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
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">발명교육역량별 학습자료</h5>
							<div>발명교육의 핵심인 체험(실습) 중심의 교수·학습방법 연수를 실시하며 발명교육센터, 발명영재교육기관 등의 교사에게 필요한 교수·학습방법을 맞춤형 프로그램에 의한 연수 및 컨텐츠 제공 </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">교수자료 및 발간 콘텐츠</h5>
							<div>미래의 발명 ceo 탐색, 창의경제시대를 주도할 최고의 미래 ceo 양성 프로그램으로 신기술(3d 프린팅, iot 기술) 습득 및 활용을 통한 창의적 문제 해결 관련 학생 활동을 지원하는 연구회입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">발명교육 영상콘텐츠</h5>
							<div>테마별 영상을 교제와 함께 제공하는 컨텐츠</div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">발명교육센터 교육콘텐츠 공유</h5>
							<div>발명교육센터의 교육컨텐츠 공유자료입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>

						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">웹진</h5>
							<div>발명교육 웹진 '잎새 플러스' 뉴스레터</div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">교사연구회</h5>
							<div>미래의 발명 ceo 탐색, 창의경제시대를 주도할 최고의 미래 ceo 양성 프로그램으로 신기술(3d 프린팅, iot 기술) 습득 및 활용을 통한 창의적 문제 해결 관련 학생 활동을 지원하는 연구회입니다. </div>
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
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=89');
		}
		function go2() {
			window.open('https://ip-edu.net/home/kor/board.do?menuPos=93');
		}
		function go3() {
			window.open('https://ip-edu.net/home/kor/education/theme/invention/index.do?menuPos=100');
		}
		function go4() {
			window.open('https://ip-edu.net/home/kor/board.do?menuPos=106');
		}
		function go5() {
			window.open('https://ip-edu.net/home/kor/board.do?menuPos=108');
		}
		function go6() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=111');
		}		

		function reset() {
			location.href = './index.jsp';
		}

	</script>
</body>

</html>
