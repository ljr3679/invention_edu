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
	<div class="com_cont ft_c2">
		<div class="title_cont">
			<div class="box">
				<div class="img_box">
					<img src="/images/home/kor/user/award/festival2021/tit_area_bg_03.jpg?t=20220907094741" alt="">
				</div>
				<div class="title_area">
					<div class="title_inner">
						<div class="title"><span class="ft_c">상상</span>과 <span class="ft_c2">도전</span>으로 미래를 주도하라!</div>
					</div>
					<div class="text">청소년들이 팀을 이루어 주어진 과제를 해결하는 과정에서 도전정신,<br> 비판적사고력, 의사소통능력 등을 기를 수 있는 대회</div>
				</div>
			</div>
		</div>
		<div class="info_list_cont">
			<ul class="list">
				<li>
					<div class="box">
						<div class="title"><span class="ft_c">과제</span>의 종류</div>
						<div class="com_list_area">
							<ul class="list">
								<li class="icon1">
									<div class="area">
										<div class="img_box"></div>
										<div class="tit">표현과제</div>
										<div class="txt">과제의 요구사항을 반영한 창작 공연을<br> 통해 각 팀의 창의성을 표현하는 과제</div>
										<a href="https://ip-edu.net/home/kor/board.do?menuPos=25&act=detail&idx=148" class="link" target="_blank"><span class="text">2021년 표현과제 예시 보기</span></a>
									</div>
								</li>
								<li class="icon2">
									<div class="area">
										<div class="img_box"></div>
										<div class="tit">제작과제</div>
										<div class="txt">과학원리를 이용하여 구조물을 제작하고<br> 제작한 구조물로 미션을 수행하는 과제</div>
										<a href="https://ip-edu.net/home/kor/board.do?menuPos=25&act=detail&idx=147" class="link" target="_blank"><span class="text">2021년 제작과제 설명영상</span></a>
									</div>
								</li>
								<li class="icon3">
									<div class="area">
										<div class="img_box"></div>
										<div class="tit">즉석과제</div>
										<div class="txt">즉석에서 주어진 과제를 빠르게 해결하는<br> 과정에서 문제해결능력을 평가하는 과제</div>
										<a href="https://ip-edu.net/home/kor/board.do?menuPos=25&act=detail&idx=146" class="link" target="_blank"><span class="text">역대 즉석과제 문제 훑어보기</span></a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title"><span class="ft_c">수상팀</span> 공연 보기</div>
						<div class="com_list_area sty2">
							<ul class="list">
								<li>
									<div class="area">
										<div class="text">2020년 본선대회 대상 수상팀 - 고등부 Escapers</div>
										<div class="video_box">
											<iframe width="100%" height="353" src="https://www.youtube.com/embed/A2gUXByjuXc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
										</div>
									</div>
								</li>
								<li>
									<div class="area">
										<div class="text">2020년 본선대회 대상 수상팀 - 초등부 쟤네식스</div>
										<div class="video_box">
											<iframe width="100%" height="353" src="https://www.youtube.com/embed/Omowh6ll6_E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
											
										</div>
									</div>
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