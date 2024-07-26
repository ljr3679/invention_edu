<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
function fn_view(type) {
	$("#tabPos2").val(type);
	$('#cmmnForm').attr('action', '${selfPath}view.do');
	$('#cmmnForm').submit();
}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
<div class="com_cont ft_c3">
	<div class="ft_c1">
		<div class="title_cont">
			<div class="box">
				<div class="img_box">
					<img src="/images/home/kor/user/award/festival2024/tit_area_bg_01.jpg" alt="">
				</div>
				<div class="title_area">
					<div class="title_inner">
						<div class="title"><span class="ft_c">청소년 발명가 프로그램(YIP)</span>란?</div>
					</div>
					<div class="text">
						발명기업인으로 성장할 잠재력이 높은 청소년 (3인으로 구성된)팀을 선발하여, <br>
						교육과 컨설팅을 통해 아이디어를 고도화 하고 특히 출원 및 등록을 지원해 주는<br>
						우수 발명인재를 양성하는 교육 프로그램입니다.<br>
						YIP를 통해 고도화된 아이디어는 종합적인 심사를 거쳐 우수작에 대한 시상도 이루어집니다.
					</div>
				</div>
			</div>
		</div>
		<div class="info_list_cont">
			<ul class="list">
				<!-- <li>
					<div class="box">
						<div class="title">YIP <span class="ft_c1">대상</span></div>
						<div class="text">전국 중·고등학생 또는 청소년(만13~18세) 누구나 신청 가능합니다.</div>
					</div>
				</li> -->
				<li>
					<div class="box">
						<div class="title">2024 YIP 교육과정</div>
						<div class="com_list_area">
							<div class="step_area sty2">
								<ul class="step_list">
									<li class="bg01">
										<div class="box">
											<div class="step">STEP1</div>	
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">교육생 선발</div>
													<div class="day">4~5월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg02">
										<div class="box">
											<div class="step">STEP2</div>	
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text"> 선발교육생 OT 1차 집체교육</div>
													<div class="day">6월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg01">
										<div class="box">
											<div class="step">STEP3</div>	
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">IP 창출·활용 찾아가는 컨설팅</div>
													<div class="day">7~10월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg02">
										<div class="box">
											<div class="step">STEP4</div>	
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">선발교육생 CAMP 2차 집체교육</div>
													<div class="day">7~9월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg01">
										<div class="box">
											<div class="step">STEP5</div>	
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">아이디어 경연 및 지재권 출원</div>
													<div class="day">10~11월</div>
												</div>
											</div>
										</div>
									</li>
									<li class="bg02">
										<div class="box">
											<div class="step">STEP6</div>	
											<div class="text_box">
												<div class="text_box_inner">
													<div class="text">우수 아이디어 시상 및 수료</div>
													<div class="day">11월</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>

	</div>
	<div class="info_list_cont">
		<ul class="list">
			<li>
				<div class="box">
				
					<div class="title">2021년 아이디어 경진대회 <span class="ft_c">결과</span></div>
					<div class="text">선발교육생 40팀 중 40건 특허출원</div>
					<div class="award-list-wrap">
						<!-- 대상 -->
						<a href="javascript:void(0);" onclick="fn_view('A');" class="award_block">
							<div class="emblem_area gold">
								<img src="/images/home/kor/user/award/festival2024/emblem_gold.png" alt="">
							</div>
							<div class="img_area">
								<span class="img_inner" style="background-image: url(/images/home/kor/user/award/festival2024/yip_img01.png);">이미지영역</span>
							</div>
							<div class="award_info_area">
								<div class="label">대상</div>
								<div class="team_title">[NOVELFLOW] 모듈형 캐리어</div>
								<div class="flex-area">
									<dl>
										<dt>아이디어명</dt>
										<dd>
											모듈형 캐리어
										</dd>
									</dl>
									<dl>
										<dt>출원인</dt>
										<dd>임현빈, 최준혁, 이상욱</dd>
									</dl>
									<dl>
										<dt>팀명</dt>
										<dd>NOVELFLOW</dd>
									</dl>
									<dl>
										<dt>출원번호</dt>
										<dd>10-2021-0170749</dd>
									</dl>
								</div>
							</div>
						</a>
						<!-- 최우수상 -->
						<a href="javascript:void(0);" onclick="fn_view('B');" class="award_block">
							<div class="emblem_area gold">
								<img src="/images/home/kor/user/award/festival2024/emblem_silver.png" alt="">
							</div>
							<div class="img_area">
								<span class="img_inner" style="background-image: url(/images/home/kor/user/award/festival2024/yip_img02.png);">이미지영역</span>
							</div>
							<div class="award_info_area">
								<div class="label">최우수상</div>
								<div class="team_title">[조강지처] 양면 사용 가능한 다용도 책상</div>
								<div class="flex-area">
									<dl>
										<dt>아이디어명</dt>
										<dd>
											양면 사용 가능한 다용도 책상
										</dd>
									</dl>
									<dl>
										<dt>출원인</dt>
										<dd>조은별, 강진서, 오윤정</dd>
									</dl>
									<dl>
										<dt>팀명</dt>
										<dd>조강지처</dd>
									</dl>
									<dl>
										<dt>출원번호</dt>
										<dd>10-2021-0168992</dd>
									</dl>
								</div>
							</div>
						</a>
						<!-- 최우수상 -->
						<a href="javascript:void(0);" onclick="fn_view('C');" class="award_block">
							<div class="emblem_area gold">
								<img src="/images/home/kor/user/award/festival2024/emblem_silver.png" alt="">
							</div>
							<div class="img_area">
								<span class="img_inner" style="background-image: url(/images/home/kor/user/award/festival2024/yip_img03.png);">이미지영역</span>
							</div>
							<div class="award_info_area">
								<div class="label">최우수상</div>
								<div class="team_title">[이박손전] 복층 구조 순환식 자전거 거치 시스템</div>
								<div class="flex-area">
									<dl>
										<dt>아이디어명</dt>
										<dd>
											복층 구조 순환식 자전거 거치 시스템
										</dd>
									</dl>
									<dl>
										<dt>출원인</dt>
										<dd>이재윤, 전서희, 손예준</dd>
									</dl>
									<dl>
										<dt>팀명</dt>
										<dd>이박손전</dd>
									</dl>
									<dl>
										<dt>출원번호</dt>
										<dd>10-2021-0169377</dd>
									</dl>
								</div>
							</div>
						</a>
						<!-- 최우수상 -->
						<a href="javascript:void(0);" onclick="fn_view('D');" class="award_block">
							<div class="emblem_area gold">
								<img src="/images/home/kor/user/award/festival2024/emblem_silver.png" alt="">
							</div>
							<div class="img_area">
								<span class="img_inner" style="background-image: url(/images/home/kor/user/award/festival2024/yip_img04.png);">이미지영역</span>
							</div>
							<div class="award_info_area">
								<div class="label">최우수상</div>
								<div class="team_title">[새얀] 학용품 고정 가능한 다용도 필통</div>
								<div class="flex-area">
									<dl>
										<dt>아이디어명</dt>
										<dd>
											학용품 고정 가능한 다용도 필통
										</dd>
									</dl>
									<dl>
										<dt>출원인</dt>
										<dd>이채린, 김령원, 이태희</dd>
									</dl>
									<dl>
										<dt>팀명</dt>
										<dd>새얀</dd>
									</dl>
									<dl>
										<dt>출원번호</dt>
										<dd>10-2021-0168751</dd>
									</dl>
								</div>
							</div>
						</a>
						<!-- 최우수상 -->
						<a href="javascript:void(0);" onclick="fn_view('E');" class="award_block">
							<div class="emblem_area gold">
								<img src="/images/home/kor/user/award/festival2024/emblem_silver.png" alt="">
							</div>
							<div class="img_area">
								<span class="img_inner" style="background-image: url(/images/home/kor/user/award/festival2024/yip_img05.png);">이미지영역</span>
							</div>
							<div class="award_info_area">
								<div class="label">최우수상</div>
								<div class="team_title">[신K2] 휴지 케이스</div>
								<div class="flex-area">
									<dl>
										<dt>아이디어명</dt>
										<dd>
											휴지 케이스
										</dd>
									</dl>
									<dl>
										<dt>출원인</dt>
										<dd>신세울, 김지함, 김하진</dd>
									</dl>
									<dl>
										<dt>팀명</dt>
										<dd>신K2</dd>
									</dl>
									<dl>
										<dt>출원번호</dt>
										<dd>10-2021-0167208</dd>
									</dl>
								</div>
							</div>
						</a>
					</div>
 					
				</div>
			</li>
		</ul>
	</div>
</div>
</form:form>
</body>