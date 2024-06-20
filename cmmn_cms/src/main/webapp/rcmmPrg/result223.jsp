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
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">YIP (중고등학생)</h5>
							<div>미래 융·복합 시대에 필요한 창의적 사고력, 비판적 능력, 소통과 협업을 겸비한 창의적 인재, 더불어 기업가 정신과 창업역량까지 갖춘 창의 발명 인재를 양성하는 교육 프로그램입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go1();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">마이스터 (고등학생)</h5>
							<div>특성화고·마이스터고 학생들이 팀을 구성하여 기업이 제안한 과제, 또는 학생들이 자유롭게 선택한 과제에 대하여 새로운 아이디어를 제안하고, 선정된 아이디어에 대해 변리·기술전문가 멘토와 함께 지식재산 권리화 등으로 연결될 수 있도록 교육과 컨설팅을 지원하는 프로그램입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go2();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">직업계고 발명특허교육 (고등학생)</h5>
							<div>기업과  MOU 체결로 기업은 과제를 출제하고 학생은 아이디어를 제안하여 이를 선정하고 제작, 컨설팅까지 연결하여 주는 프로그램입니다. </div>
							<div>
								<button id="up" type="button" class="txt_link" onclick="go3();">
									자세히 보기...
								</button>
							</div>
						</div>
						
						<div class="resultbox">
							<h5 class="resultcontent" id="workexplain" name="추천 프로그램">차세대 영재기업인 (중고등학생)</h5>
							<div>빌 게이츠(MS), 세르게이 브린과 래리 페이지(구글) 등과 같이 지식재산에 기반을 둔 창의적인 기업가로 성장할 잠재력이 풍부한 학생 발굴 프로그램 </div>
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
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=58');
		}

		function go2() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=63');
		}

		function go3() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=76');
		}

		function go4() {
			window.open('https://ip-edu.net/home/kor/contents.do?menuPos=82');
		}
		
		function reset() {
			location.href = './index.jsp';
		}

	</script>
</body>

</html>
