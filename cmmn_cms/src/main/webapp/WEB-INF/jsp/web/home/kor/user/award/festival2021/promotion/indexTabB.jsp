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
					<img src="/images/home/kor/user/award/festival2021/tit_area_bg_01.jpg" alt="">
				</div>
				<div class="title_area">
					<div class="title_inner">
						<div class="title"><span class="ft_c">YIP</span>(청소년발명가프로그램)란?</div>
					</div>
					<div class="text">3명으로 구성된 팀이 함께 제안한 발명 아이디어를 바탕으로 IP교육 및 컨설팅을 <br>이수하고 ‘권리화’까지 진행하는 발명 교육 프로그램입니다.</div>
				</div>
			</div>
		</div>
		<div class="info_list_cont">
			<ul class="list">
				<li>
					<div class="box">
						<div class="title">YIP <span class="ft_c1">대상은?</span></div>
						<div class="text">전국 중·고등학생 또는 청소년(만13~18세) 누구나 신청 가능합니다.</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title">YIP 프로그램 <span class="ft_c1">과정은?</span></div>
						<div class="com_list_area">
							<div class="step_area sty2">
								<ul class="step_list">
									<li class="bg01">
										<div class="box">
											<div class="step">STEP1</div>	
											<div class="tit_area">
												<div class="tit">모집 및 선발</div>
											</div>
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">선발교육생 모집 및 선발(40팀)</div>
													<div class="day">2~5월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg02">
										<div class="box">
											<div class="step">STEP2</div>	
											<div class="tit_area">
												<div class="tit">오리엔테이션 1차 집체교육</div>
											</div>
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">선발교육생 OT 및 교육</div>
													<div class="day">6월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg01">
										<div class="box">
											<div class="step">STEP3</div>	
											<div class="tit_area">
												<div class="tit">찾아가는 특허 창업 컨설팅</div>
											</div>
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">IP창출·활용컨설팅</div>
													<div class="day">7~10월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg02">
										<div class="box">
											<div class="step">STEP4</div>	
											<div class="tit_area">
												<div class="tit">2차 집체교육 (소규모 캠프)</div>
											</div>
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">IP창출· 활용심화교육</div>
													<div class="day">7~9월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg01">
										<div class="box">
											<div class="step">STEP5</div>	
											<div class="tit_area">
												<div class="tit">아이디어 경진대회</div>
											</div>
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">사업계획서 기반 아이디어 (창업)경진대회</div>
													<div class="day">10월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg02">
										<div class="box">
											<div class="step">STEP6</div>	
											<div class="tit_area">
												<div class="tit">시상식·수료식</div>
											</div>
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">경진대회 결과 시상 및 교육생 수료</div>
													<div class="day">11월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg01">
										<div class="box">
											<div class="step">STEP7</div>	
											<div class="tit_area">
												<div class="tit">지식재산권 출원 및 관리</div>
											</div>
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">최종 아이디어 지재권 출원 및 등록을 위한 지속 관리</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title">YIP에 <span class="ft_c1">참여하면?</span></div>
						<div class="text">수료하게 되면 내 이름의 특허를 갖게 됩니다! <br> 또한 학교 수업에서는 받기 힘든 IP 교육 뿐만 아니라 창업 교육까지 진행되기 때문에 사업계획을 경험해 볼 수 있습니다.</div>
						<div class="img_list_box">
							<ul class="list">
								<li>
									<div class="img_box">
										<img src="/images/home/kor/user/award/festival2021/yip_img01.jpg" alt="">
									</div>
									<div class="text">2019년 YIP 캠프</div>
								</li>
								<li>
									<div class="img_box">
										<img src="/images/home/kor/user/award/festival2021/yip_img02.jpg" alt="">
									</div>
									<div class="text">2019년 YIP 수료식 및 시상식</div>
								</li>
								<li>
									<div class="img_box">
										<img src="/images/home/kor/user/award/festival2021/yip_img03.jpg" alt="">
									</div>
									<div class="text">2019년 YIP  대상 발표</div>
								</li>
							</ul>
						</div>
						<div class="video_box">
							<iframe src="https://www.youtube.com/embed/2oeGATPy388" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
						</div>
					</div>
				</li>
			</ul>
		</div>

	</div>
</form:form>
</body>