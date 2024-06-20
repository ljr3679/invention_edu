<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>
	function fn_cancel(){
	    $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
	    $('#cmmnForm').submit();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<div class="cont_wrap">
		<div class="cont_each">
			<div class="step_box1">
				<ul class="step_list">
					<li>
						<div class="step_inner">
							<span class="step_img icon1"></span>
							<span class="step_txt">1. 개인정보 수집 동의</span>
						</div>
					</li>
					<li>
						<div class="step_inner">
							<span class="step_img icon2"></span>
							<span class="step_txt">2. 신청정보 입력</span>
						</div>
					</li>
					<li class="on">
						<div class="step_inner">
							<span class="step_img icon3"></span>
							<span class="step_txt">3. 신청 완료</span>
						</div>
					</li>
				</ul>
			</div>
			<div class="cont_wrap">
				<div class="cont_each">
					<div class="completed_block">
						<p class="tit">대회 참가 신청이 완료 되었습니다.</p>
						<p class="memo">접수번호: ${resultData.applyNumber}</p>
						<p class="memo red">※ 접수번호와 신청 시 입력한 비밀번호로 신청내역을 조회하실 수 있습니다.</p>
						<div class="btn_center_area">
							<button class="btn_blue big" type="button" onclick="fn_cancel();">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form:form>
</body>
