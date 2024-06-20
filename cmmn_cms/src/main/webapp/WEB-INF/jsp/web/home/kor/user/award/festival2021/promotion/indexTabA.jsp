<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
	<div class="promotion_cont">
		<div class="title">발명체험교육관은 체험·심화형 발명교육을 통한<br> 지역의 <span class="ft_c">혁신 잠재력이 있는 학생을 조기에 발굴·육성하고자 설치</span> 되었으며<br> 발명교육 거점센터로 아래의 역할을 할 것 입니다.</div>
		<div class="info_list_area">
			<ul class="list">
				<li class="icon1">
					<div class="box">
						<div class="img_box">
						</div>
						<div class="txt_box">
							<div class="txt">발명 놀이를 중심으로 한</div>
							<div class="tit">'발명놀이터'</div>
						</div>
					</div>
				</li>
				<li class="icon2">
					<div class="box">
						<div class="img_box">
						</div>
						<div class="txt_box">
							<div class="txt">발명품의 체험과 전시</div>
							<div class="tit">중심의 공간</div>
						</div>
					</div>
				</li>
				<li class="icon3">
					<div class="box">
						<div class="img_box">
						</div>
						<div class="txt_box">
							<div class="txt">발명교육이 이루어지는</div>
							<div class="tit">전문 교육 공간</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="design_img_list_area">
			<div class="title">발명체험교육관 실사설계도</div>
			<div class="list_box box1">
				<ul class="list">
					<li>
						<div class="img_box">
							<img src="/images/home/kor/user/award/festival2021/pro_list_img_01.jpg" alt="">
						</div>
					</li>
				</ul>
			</div>
			<div class="list_box box2">
				<ul class="list">
					<li>
						<div class="img_box">
							<img src="/images/home/kor/user/award/festival2021/pro_list_img_02.jpg" alt="">
						</div>
					</li>
					<li>
						<div class="img_box">
							<img src="/images/home/kor/user/award/festival2021/pro_list_img_03.jpg" alt="">
						</div>
					</li>
					<li>
						<div class="img_box">
							<img src="/images/home/kor/user/award/festival2021/pro_list_img_04.jpg" alt="">
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</form:form>
</body>