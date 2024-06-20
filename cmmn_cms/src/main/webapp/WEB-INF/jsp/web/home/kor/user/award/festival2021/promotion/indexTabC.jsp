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
	<div class="com_cont ft_c1">
		<div class="title_cont">
			<div class="box">
				<div class="img_box">
					<img src="/images/home/kor/user/award/festival2021/tit_area_bg_02.jpg" alt="">
				</div>
				<div class="title_area">
					<div class="title_inner">
						<div class="title"><span class="ft_c">'발명교육센터'</span>를 소개합니다!</div>
					</div>
					<div class="text">다양한 재능과 호기심을 가진 학생들이 발명·창작활동을 통해<br> 협업능력, 창의력, 문제해결력 등을 함양하는 창의교육의 장입니다.</div>
				</div>
			</div>
		</div>
		<div class="info_list_cont">
			<ul class="list">
				<li>
					<div class="box">
						<div class="title"><span class="ft_c1">어디</span>에 있나요?</div>
						<div class="text">특허청, 시·도교육청, 한국발명진흥회가 협력하여 운영하며,전국 학교, 교육지원청, 과학관 등에 총 207개소가 설치되어 있습니다.</div>
						<div class="com_list_area sty2">
							<ul class="list">
								<li>
									<div class="area">
										<div class="text">전국 발명교육센터 설치도</div>
										<div class="box_img">
											<div class="inner_img">
												<img src="/images/home/kor/user/award/festival2021/promotion_img01.jpg" alt="">
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="area">
										<div class="text">홍보영상</div>
										<div class="video_box">
											<iframe width="100%" height="353" src="https://www.youtube.com/embed/mhScOs-m0yM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
										</div>
									</div>
								</li>

							</ul>
						</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title"><span class="ft_c1">‘찾아가는 발명체험교실’</span>이란?</div>
						<div class="text">도서·벽지 소재 학교, 지역아동센터, 보육원 등 평소에 발명교육을 접하기 어려운 청소년을 위하여 발명교육 전문 강사가 직접 학교나 신청 기관으로 방문하여 창의·발명교육을 지원하는 프로그램입니다.</div>
						<div class="com_list_area">
							<div class="step_area">
								<ul class="list">
									<li class="step01">
										<div class="step_box">
											<div class="box">
												<div class="txt"><span class="step">STEP 1</span>신청·접수<br>(12월 ~ 1월)</div>
											</div>
										</div>
										<div class="txt_box">
											<div class="txt">도서·벽지, 지역아동센터 등 교육소외청소년 대상 찾아가는 발명체험교실 신청·접수</div>
										</div>
									</li>
									<li class="step02">
										<div class="step_box">
											<div class="box">
												<div class="txt"><span class="step">STEP 2</span>선정·매칭<br>(2~3월)</div>
											</div>
										</div>
										<div class="txt_box">
											<div class="txt">신청기관의 운영형태 및 교육환경 등을 고려하여 선정 후, 발명교육전문강사와 매칭</div>
										</div>
									</li>
									<li class="step03">
										<div class="step_box">
											<div class="box">
												<div class="txt"><span class="step">STEP 3</span>교육확정<br>(3월)</div>
											</div>
										</div>
										<div class="txt_box">
											<div class="txt">매칭된 발명교육전문강사와 세부일정, 운영형태, 프로그램 등 협의·확정</div>
										</div>
									</li>
									<li class="step04">
										<div class="step_box">
											<div class="box">
												<div class="txt"><span class="step">STEP 4</span>교육<br>(3월 ~ 12월)</div>
											</div>
										</div>
										<div class="txt_box">
											<div class="txt">방문형 발명교육운영</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title"><span class="ft_c1">누구나</span> 신청할 수 있나요?</div>
						<div class="text">도서·벽지 및 농·어촌 학교, 지역아동센터, 보육원 등 평소에 발명교육을 접하기 어려운 기관을 우선으로 지원합니다. 또한 인근에 발명교육센터가 없어 발명교육 참여가 어려운 곳에서도 찾아가는 발명체험교실 신청이 가능합니다.</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title"><span class="ft_c1">찾아가는 발명체험교실</span> 우수사례</div>
						
						<div class="video_box">
							<iframe src="https://www.youtube.com/embed/Z5Vp__RPZ4Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form:form>
</body>