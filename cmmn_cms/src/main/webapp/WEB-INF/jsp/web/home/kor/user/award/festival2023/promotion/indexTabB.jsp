<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<div class="com_cont">
	<div class="title_cont">
		<div class="box">
			<div class="img_box">
				<img src="images/tit_area_bg_05.png" alt="">
			</div>
			<div class="title_area">
				<div class="title_inner">
					<div class="title"><span class="ft_c">IP Meister Program</span> 소개</div>
				</div>
				<div class="text">특성화고·마이스터고 학생들이 팀을 구성하여 <br>
				기업이 제안한 과제, 또는 학생들이 자유롭게 선택한 과제에 대하여 새로운 아이디어를 제안하고,<br>
				선정된 아이디어에 대해 변리·기술전문가 멘토와 함께<br>
				지식재산 권리화 등으로 연결될 수 있도록 교육과 컨설팅을 지원하는 프로그램입니다.</div>
			</div>
		</div>
	</div>
	<style>
	.bulit li {padding: 0 0 0 14px;background-image: url(/award2021/images/sub/tit_icon01.png);background-position: left center;background-repeat: no-repeat;font-weight: 400;font-size: 17px;line-height: 24px;color: #000000;text-align: left;}
	.com_cont .title_cont .box .title_area .title_inner .title span, 
	.com_cont .info_list_cont > .list > li .box > .title .ft_c1 {color:#fa8100;}
	.table {margin-top: 20px;font-family: 'CoreDream';}
	.table table  {width: 100%; border-collapse: collapse; border-spacing: 0;border-top: 2px solid #fa8100; }
	.table table tr {}
	.table table tr td, .table table tr th {text-align: center;padding:20px 10px;font-size: 17px;}
	.table table tr td {border: 1px solid #ddd;}
	.table table tr th {background-color: #f6f6f6;border: 1px solid #ddd;}
	.com_cont .info_list_cont > .list > li .box .com_list_area .step_area .list li {width:25%;}
	.table table tfoot tr:first-child td {border-top: 1px double #999;}
	.table table tfoot tr td {background-color: #fcfcfc;}
	.col_orange {color:#f9423e;}
	.mt20 {margin-top: 20px;}
	.com_cont .info_list_cont > .list > li .box .com_list_area .step_area .step_list li.bg01 .box .text_box,
	.com_cont .info_list_cont > .list > li .box .com_list_area .step_area .step_list li.bg02 .box .text_box {background-color: #f4f4f4;}
	</style>
	<div class="info_list_cont">
		<ul class="list">
			<li>
				<div class="box">
					<div class="title">추진<span class="ft_c1">기관</span></div>
					<div class="com_list_area sty2">
						<ul class="bulit">
							<li>주최 : 교육부, 중소벤처기업부, 특허청</li>
							<li>주관 : 한국발명진흥회</li>
						</ul>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<div class="title">참가<span class="ft_c1"> 자격</span></div>
					<div class="com_list_area sty2">
						<p>특성화고·마이스터고 재학생 2~3명으로 팀을 구성하여 참가합니다. <br>
						* 팀 구성 시 지도교사 1명 포함(단, 학생으로만 팀을 구성할 경우 최종 선발 후 주관기관을 통한 매칭 예정)</p>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<div class="title">신청<span class="ft_c1"> 과제</span></div>
					<div class="com_list_area sty2">
						<p>아래 과제 중 자유롭게 선택하여 발명 아이디어를 제시합니다.</p>
					</div>
					<div class="table">
						<table>
							<thead>
								<tr>
									<th rowspan="2">자유과제</th>
									<th colspan="2">현장연계과제</th>
									<th rowspan="2">테마과제</th>
								</tr>
								<tr>
									<th>전문교과과제</th>
									<th>협력기업과제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td data-th="자유과제">국내외 존재하는 제품‧기술에 대한 <br>개선 아이디어</td>
									<td data-th="현장연계과제">전문교과(전공) 관련된 아이디어</td>
									<td data-th="테마과제">신청학교의 협력기업에서 해결하고자 하는 <br>	문제에 대한 개선 아이디어</td>
									<td data-th="전문교과과제">참여기업의 산업현장에서 해결하고자 하는 <br>	문제에 대한 개선 아이디어 </td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<div class="title">선발<span class="ft_c1"> 절차</span></div>
					<div class="com_list_area sty2">
						<p>서류심사와 발표심사를 통해 IP Meister Program을 함께할 선발팀을 선정합니다.</p>
					</div>
					<div class="com_list_area">
						<div class="step_area">
							<ul class="list">
								<li class="step01">
									<div class="step_box">
										<div class="box">
											<div class="txt"><span class="step">STEP 1</span>아이디어 접수 <br>(4월~5월)
											</div>
										</div>
									</div>
									<div class="txt_box">
										<div class="txt">팀단위 신청</div>
									</div>
								</li>
								<li class="step02">
									<div class="step_box">
										<div class="box">
											<div class="txt"><span class="step">STEP 2</span>1차·2차 서류심사<br>(6~7월)
											</div>
										</div>
									</div>
									<div class="txt_box">
										<div class="txt">신청팀 → 140팀
										</div>
									</div>
								</li><li class="step03">
									<div class="step_box">
										<div class="box">
											<div class="txt"><span class="step">STEP 3</span>발표심사 <br>(7월)
											</div>
										</div>
									</div>
									<div class="txt_box">
										<div class="txt">140팀→100팀</div>
									</div>
								</li><li class="step04">
									<div class="step_box">
										<div class="box">
											<div class="txt"><span class="step">STEP 4</span>최종 선발팀 선정 <br>(7월)
											</div>
										</div>
									</div>
									<div class="txt_box">
										<div class="txt">100팀</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<div class="title">교육과정<span class="ft_c1"> 운영 절차</span></div>
					<div class="com_list_area sty2">
						<p>선발된 팀은 변리·기술전문가 멘토와 함께 교육과 컨설팅을 지원받습니다.
						교육과 컨설팅을 통해 개선된 최종 아이디어는 발표심사를 통해 상격이 결정됩니다.</p>
					</div>
					<div class="com_list_area">
						<div class="step_area sty2">
							<ul class="step_list">
								<li class="bg01">
									<div class="box">
										<div class="step">STEP1</div>
										<div class="text_box">
											<div class="text_box_inner">
												<div class="text">온라인 지식재산 <br>
												창의교육</div>
												<div class="day">7월~10월</div>
											</div>
										</div>
									</div>
								</li>
								<li class="bg02">
									<div class="box">
										<div class="step">STEP2</div>
										<div class="text_box">
											<div class="text_box_inner">
												<div class="text">찾아가는 컨설팅 <br>
												(팀당 3회)</div>
												<div class="day">7월~10월</div>
											</div>
										</div>
									</div>
								</li>
								<li class="bg01">
									<div class="box">
										<div class="step">STEP3</div>
										<div class="text_box">
											<div class="text_box_inner">
												<div class="text">소양캠프</div>
												<div class="day">10월</div>
											</div>
										</div>
									</div>
								</li>
								<li class="bg02">
									<div class="box">
										<div class="step">STEP4</div>
										<div class="text_box">
											<div class="text_box_inner">
												<div class="text">최종 아이디어 발표</div>
												<div class="day">10월</div>
											</div>
										</div>
									</div>
								</li>
								<li class="bg01">
									<div class="box">
										<div class="step">STEP5</div>
										<div class="text_box">
											<div class="text_box_inner">
												<div class="text">아이디어 <br>
												지식재산 권리화</div>
												<div class="day">10~12월</div>
											</div>
										</div>
									</div>
								</li>
								<li class="bg02">
									<div class="box">
										<div class="step">STEP6</div>
										<div class="text_box">
											<div class="text_box_inner">
												<div class="text">수료 및 시상식</div>
												<div class="day">12월</div>
											</div>
										</div>
									</div>
								</li>
								<li class="bg02">
									<div class="box">
										<div class="step">STEP7</div>
										<div class="text_box">
											<div class="text_box_inner">
												<div class="text">최우수팀 국외연수</div>
												<div class="day">‘22년 1월</div>
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
					<div class="title">선발팀<span class="ft_c1"> 혜택</span></div>
				
					<div class="com_list_area">
						<div class="step_area sty2">
							<ul class="benefit_list">
								<li>
									<div class="benefit1">발명·지식재산권 <br>교육</div>
								</li>
								<li>
									<div class="benefit2">지식재산권(특허) <br> 출원 지원</div>
								</li>
								<li>
									<div class="benefit3">아이디어 <br>시상 및 포상</div>
								</li>
								<li>
									<div class="benefit4">직무발명 아이디어 <br>컨설팅</div>
								</li>
								<li>
									<div class="benefit5">교육부·중소벤처기업부·특허청 <br>명의 수료증</div>
								</li>
								<li>
									<div class="benefit6">최우수팀 <br>선진 국외연수</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<ul class="bulit">
						<li>아이디어 시상(안)</li>
					</ul>
					<div class="table">
						<table>
							<thead>
								<tr>
									<th rowspan="2">상격</th>
									<th colspan="2">상장수(안)</th>
									<th rowspan="2">비고</th>
								</tr>
								<tr>
									<th>학생팀</th>
									<th>지도교사</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td data-th="자유과제">부총리겸교육부장관상</td>
									<td data-th="현장연계과제">2팀</td>
									<td data-th="테마과제">2개</td>
									<td data-th="전문교과과제">상장/국외연수</td>
								</tr>
								<tr>
									<td data-th="자유과제">중소벤처기업부장관상</td>
									<td data-th="현장연계과제">3팀</td>
									<td data-th="테마과제">3개</td>
									<td data-th="전문교과과제">상장/부상</td>
								</tr>
								<tr>
									<td data-th="자유과제">특허청장상</td>
									<td data-th="현장연계과제">3팀</td>
									<td data-th="테마과제">3개</td>
									<td data-th="전문교과과제">상장/부상</td>
								</tr>
								<tr>
									<td data-th="자유과제">중소벤처기업진흥공단이사장상</td>
									<td data-th="현장연계과제">5팀</td>
									<td data-th="테마과제">5개</td>
									<td data-th="전문교과과제">상장/부상</td>
								</tr>
								<tr>
									<td data-th="자유과제">한국발명진흥회장상</td>
									<td data-th="현장연계과제">5팀</td>
									<td data-th="테마과제">5개</td>
									<td data-th="전문교과과제">상장/부상</td>
								</tr>
								<tr>
									<td data-th="자유과제">한국특허정보원장상</td>
									<td data-th="현장연계과제">8팀</td>
									<td data-th="테마과제">-</td>
									<td data-th="전문교과과제">상장</td>
								</tr>
								<tr>
									<td data-th="자유과제">한국특허전략개발원장상</td>
									<td data-th="현장연계과제">8팀</td>
									<td data-th="테마과제">-</td>
									<td data-th="전문교과과제">상장</td>
								</tr>
								<tr>
									<td data-th="자유과제">한국지식재산보호원장상</td>
									<td data-th="현장연계과제">8팀</td>
									<td data-th="테마과제">-</td>
									<td data-th="전문교과과제">상장</td>
								</tr>
								<tr>
									<td data-th="자유과제">한국여성발명협회장상</td>
									<td data-th="현장연계과제">8팀</td>
									<td data-th="테마과제">-</td>
									<td data-th="전문교과과제">상장</td>
								</tr>
								
							</tbody>
							<tfoot>
								<tr>
									<td>합계</td>
									<td>50팀</td>
									<td>-</td>
									<td>-</td>
								</tr>
								<tr>
									<td>(단체상) 한국발명진흥회장상</td>
									<td colspan="2">3개교</td>
									<td>상장</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</li>
		</ul>
		<p class="col_orange mt20">* 상기 시상내역은 관계기관 협의에 따라 변경될 수 있음</p>
	</div>
	<div class="img_view">
		<ul>
			<li><img src="images/ip_meister_2019.JPG" alt=""></li>
			<li><img src="images/ip_meister_2023_1.jpg" alt=""></li>
			<li><img src="images/ip_meister_2023_2.jpg" alt=""></li>
		</ul>
	</div>
</div>
