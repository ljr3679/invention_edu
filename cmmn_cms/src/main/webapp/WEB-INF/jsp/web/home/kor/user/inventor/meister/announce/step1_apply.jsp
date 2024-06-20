<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>
	function fn_next(){
		if($('input[name=paramKey40]:checked').val() != "Y") {
			alert("개인정보 수집 및 이용목적 동의를 선택해주세요.");
			return;
		}
		if($('input[name=paramKey41]:checked').val() != "Y") {
			alert("개인정보 제공 동의를 선택해주세요.");
			return;
		}
		if($('input[name=paramKey42]:checked').val() != "Y") {
			alert("개인정보보유 및 이용기간 동의를 선택해주세요.");
			return;
		}
		$('#cmmnForm').attr('action', '${vo.selfPath}step2_apply.do');
	    $('#cmmnForm').submit();
	}
	
	function fn_cancel(){
	    $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
	    $('#cmmnForm').submit();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchKeyword"/>
	<div class="cont_wrap">
		<div class="cont_each">
			<div class="step_box1">
				<ul class="step_list">
					<li class="on">
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
					<li>
						<div class="step_inner">
							<span class="step_img icon3"></span>
							<span class="step_txt">3. 신청 완료</span>
						</div>
					</li>
				</ul>
			</div>
			<div class="center_tit">개인정보 수집 및 이용목적 <span class="r">*</span></div>
			<div class="agree_textarea">
				<div class="scroll">
					<c:out value="${content1.contents}" escapeXml="false"/>
				</div>
				<div class="agree_chk_wrap">
					<span>개인정보 수집 및 이용 목적에 동의합니다.</span>
					<span class="radio_form"><input type="radio" id="agree_true1" name="paramKey40" value="Y"><label for="agree_true1">동의</label></span>
					<span class="radio_form"><input type="radio" id="agree_false1" name="paramKey40" value="N"><label for="agree_false1">미동의</label></span>
			</div>
			<div class="center_tit">개인정보 제공 <span class="r">*</span></div>
			<div class="agree_textarea">
				<div class="scroll">
					<c:out value="${content2.contents}" escapeXml="false"/>
				</div>
				<div class="agree_chk_wrap">
					<span>개인정보 수집 및 이용 목적에 동의합니다.</span>
					<span class="radio_form"><input type="radio" id="agree_true2" name="paramKey41" value="Y"><label for="agree_true2">동의</label></span>
					<span class="radio_form"><input type="radio" id="agree_false2" name="paramKey41" value="N"><label for="agree_false2">미동의</label></span>
				</div>
			</div>
			<div class="center_tit">개인정보보유 및 이용기간 <span class="r">*</span></div>
			<div class="agree_textarea">
				<div class="scroll">
					<c:out value="${content3.contents}" escapeXml="false"/>
				</div>
				<div class="agree_chk_wrap">
					<span>개인정보 수집 및 이용 목적에 동의합니다.</span>
					<span class="radio_form"><input type="radio" id="agree_true3" name="paramKey42" value="Y"><label for="agree_true3">동의</label></span>
					<span class="radio_form"><input type="radio" id="agree_false3" name="paramKey42" value="N"><label for="agree_false3">미동의</label></span>
				</div>
			</div>
			<div class="center_txt_wrap">귀하는 개인정보 제공 동의를 거부할 권리가 있으며, 동의 거부 시 해당 사업 참여가 불가함을 알려드립니다.</div>
			<div class="board_btn_area">
				<button type="button" class="btn_blue" onclick="fn_next();">다음</button>
				<button type="button" class="btn_base" onclick="fn_cancel();">취소</button>
			</div>
		</div>
	</div>
</form:form>
</body>
