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
		<div class="title_cont">
			<div class="box">
				<div class="img_box">
					<img src="/images/home/kor/user/award/festival2021/tit_area_bg_04.jpg?t=20220907100315" alt="">
				</div>
				<div class="title_area">
					<div class="title_inner">
						<div class="title"><span class="ft_c">YIP 아이디어</span> 경진대회란?</div>
					</div>
					<div class="text">집중교육 및 변리기관의 찾아가는 컨설팅을 통해 구체화 고도화된 최종 출원 단계<br> 아이디어의 우수성 완성도, 선발교육생의 참여도, 성실도 등을 종합적으로 심사하여<br> 상격을 결정하는 대회입니다.</div>
				</div>
			</div>
		</div>
			
		<div class="info_list_cont">
			<ul class="list">
				<li>
					<div class="box">
						<div class="title"><span class="ft_c">심사</span>방법</div>
						<div class="text">발명 창의, 기술이전 사업화, 지식재산 등 관련 분야별 외부전문가로 구성된 심사위원회 운영</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title">2020년 경진대회 <span class="ft_c">결과</span></div>
						<div class="text">선발교육생 40팀 중 40건 특허출원</div>
						<div class="award_area">
							<ul class="list">
								<li class="bg01">
									<a href="javascript:void(0);" onclick="fn_view('A');" class="box">
										<div class="sort">대상</div>
										<div class="info_box">
											<div class="img_box">
												<div class="img_inner">
													<img src="/images/home/kor/user/award/festival2021/yip_img01.png?t=20220907100315" alt="">
												</div>
											</div>
											<div class="text_box">
												<div class="title">[세바삼] 자음체계의 이해를 돕는 구강모형 교구</div>
												<div class="name"><span class="name_tit">출원인 :</span> 이호영, 한재원, 김혜주</div>
											</div>
										</div>
									</a>
								</li>
								<li class="bg02">
									<a href="javascript:void(0);" onclick="fn_view('B');" class="box">
										<div class="sort">최우수상</div>
										<div class="info_box">
											<div class="img_box">
												<div class="img_inner">
													<img src="/images/home/kor/user/award/festival2021/yip_img02.png?t=20220907100315" alt="">
												</div>
											</div>
											<div class="text_box">
												<div class="title">[우지안] 블록형 구조물을 포함하는 와이어 내진 보강시스템</div>
												<div class="name"><span class="name_tit">출원인 :</span> 하서현, 오지민, 이현서</div>
											</div>
										</div>
									</a>
								</li>
								<li class="bg02">
									<a href="javascript:void(0);" onclick="fn_view('C');" class="box">
										<div class="sort">최우수상</div>
										<div class="info_box">
											<div class="img_box">
												<div class="img_inner">
													<img src="/images/home/kor/user/award/festival2021/yip_img03.png?t=20220907100315" alt="">
												</div>
											</div>
											<div class="text_box">
												<div class="title">[토글] 버튼식 절단 기능을 구비하는 케이블 타이</div>
												<div class="name"><span class="name_tit">출원인 :</span> 박세진, 박찬주, 현승혁</div>
											</div>
										</div>
									</a>
								</li>
								<li class="bg02">
									<a href="javascript:void(0);" onclick="fn_view('D');" class="box">
										<div class="sort">최우수상</div>
										<div class="info_box">
											<div class="img_box">
												<div class="img_inner">
													<img src="/images/home/kor/user/award/festival2021/yip_img04.png?t=20220907100315" alt="">
												</div>
											</div>
											<div class="text_box">
												<div class="title">[인두기의 변신] 펜형 원터치 모듈 납땜기</div>
												<div class="name"><span class="name_tit">출원인 :</span> 정주원, 조현우, 육심호</div>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form:form>
</body>