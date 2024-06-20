<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>발명교육 포털 서비스 개편을 위한 설문조사</title>
	<meta name="description" content="발명교육 포털 서비스 개편을 위한 설문조사" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="발명교육 포털 서비스 개편을 위한 설문조사" />
	<meta property="og:description" content="발명교육 포털 서비스 개편을 위한 설문조사" />
	<!-- <link rel="stylesheet" href="./bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" /> -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="style.css" />
	<!-- 폰트 추가 -->
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet" />
</head>

<body>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

		@font-face {
			font-family: 'GongGothicMedium';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}

		* {
			margin: 0;
			padding: 0;
			list-style: none;
			box-sizing: border-box;
		}

		body {
			background-color: #0068A3;
			letter-spacing: -1px;
			font-family: 'Noto Sans KR', sans-serif;
		}

		.poll {
/*			padding: 0 30px;*/
		}

		.poll_layer_wrap {
			padding: 60px 40px;
			background: #fff;
			width: 955px;
			max-width: 95%;
			position: absolute;
			top: 50%;
			left: 50%;
			display: flex;
			flex-direction: column;
			gap: 40px;
			border-radius: 40px;
			box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
			word-break: keep-all;
			transform: translate(-50%, -50%);
		}

		.poll_layer_wrap .cont_center {
			text-align: center;
			display: flex;
			flex-direction: column;
			gap: 20px;
		}

		.poll_layer_wrap .cont_center .title {
			font-size: 32px;
			font-family: 'GongGothicMedium';
			width: 100%;
			color: #1C409B;
			text-align: center;
		}

		.poll_layer_wrap .cont_center .desc {
			font-size: 21px;
		}

		.poll_layer_wrap .cont_center .desc .date {
			display: inline-block;
			padding: 5px 15px;
			word-break: keep-all;
			border-radius: 30px;
			background-color: #43C0C0;
			color: #fff;
			width: 500px;
			max-width: 100%;
		}

		.poll_layer_wrap .cont_center .exp {
			font-size: 17px;
			color: #777;
			word-break: keep-all;
		}

		.poll_layer_wrap .btn_wrap {
			display: flex;
			justify-content: center;
			gap: 30px;
			flex-wrap: wrap
		}

		.poll_layer_wrap .btn_wrap a {
			display: flex;
			align-items: center;
			justify-content: center;
			background-color: #1C409B;
			color: #fff;
			font-weight: 500;
			text-decoration: none;
			width: 170px;
			text-align: center;
			word-break: keep-all;
			height: 90px;
			font-size: 19px;
			border-radius: 20px;
		}

		.poll_layer_wrap .btn_wrap a:hover {
			background-color: #3964d1;
		}

		.poll_layer_wrap .btn_wrap .desc {}

		@media all and (max-width:500px) {
			.poll_layer_wrap {
				transform: none;
				padding: 25px;
				max-width: 100%;
				border-radius: 0;
				position: static;
				width: 100%;
			}

			.poll_layer_wrap .btn_wrap {
				gap: 10px;
			}

			.poll_layer_wrap .btn_wrap a {
				width: 100%;
				height: auto;
				padding: 10px 0;
			}
		}

	</style>
	<div class="poll">
		<div class="poll_layer_wrap">
			<div class="logo_area"><a href="#"><img src="https://dev.gapia.co.kr:8026/images/home/kor/user/common/logo.png" alt="로고"></a></div>
			<div class="cont_center">
				<div class="title">발명교육 포털 서비스 개편을 위한 설문조사</div>
				<div class="desc">발명교육담당자 교사, 초,중,고 학생, 일반인, 학부모들의 많은 참여 바랍니다.</div>
				<div class="desc">
					<span class="date">설문조사기간 : 2023.11.16(목) ~ 19일(일)</span>
				</div>
				<div class="exp">설문완료 시 1만원 상당의 문화상품권을 지급합니다.</div>
			</div>
			<div class="btn_wrap">
				<a href="#" onClick="alert('종료되었습니다.');" title="새창">발명교육 <br>담당교사</a>
				<a href="#" onClick="alert('종료되었습니다.');" title="새창">초,중,고 학생</a>
				<a href="#" onClick="alert('종료되었습니다.');" title="새창">학부모</a>
				<a href="#" onClick="alert('종료되었습니다.');" title="새창">일반인</a>
			</div>
		</div>
	</div>

</body>

</html>
