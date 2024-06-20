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
			    <article class="question" style="display:block;">
			
			      <h2 id="title" class="questionMain">어떤 프로그램의 정보를 원하시나요?</h2>
			
			      <input id="type" type="hidden" value="EI" />
			
			      <div>
			      	<button id="up" class="btn btn_select" type="button" onclick="answer1();">
			      	  발명교육센터
			      	</button>
			      </div>
			      <div>
			      	<button id="down"  class="btn btn_select" type="button" onclick="answer2();">
			      	  대회/전시/행사
			      	</button>
			      </div>
			      <div>
			      	<button id="down"  class="btn btn_select" type="button" onclick="answer3();">
			      	  창의발명인재양성 프로그램
			      	</button>
			      </div>      
			      
			    </article>
			</div>
		</div>
	</div>
	<div class="body_bg">
		<div class="bg_character1"><img src="/images/test/character1.png" alt=""></div>
		<div class="bg_character2"><img src="/images/test/character2.png" alt=""></div>
	</div>


    <script>
    
      function answer1() {
        location.href='./result221.jsp';
      }    
      function answer2() {
        location.href='./result222.jsp';
      }
      function answer3() {
        location.href='./result223.jsp';
      }        
    </script> 

  </body>
</html>
