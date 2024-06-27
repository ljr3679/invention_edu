<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<head>


<style>
    body {
        display: none;
    }
</style>

<script> 


$(document).ready(function () {
	
	if (${empty usrSession}) {
        alert('로그인 후 이용해주세요.');
        location.href = '/home/kor/contents.do?menuPos=120';
    } else {
        $('body').css('display', 'block');  // Show the page if the user is logged in
    }
});

	function formSubmit(event) {
		$(event.target).prop('disabled', true);

		if (!$('#agree_true').is(':checked')) {
			alert('개인정보 수집 및 이용목적에 대한 동의가 필요합니다.');
			$(this.event.target).prop('disabled', false);
			$('#agree_true').focus();
			return;
		}
		if (!$('#agree2_true').is(':checked')) {
			alert('아동·청소년 대상 범죄 전력 관련 서약 동의가 필요합니다.');
			$(this.event.target).prop('disabled', false);
			$('#agree2_true').focus();
			return;
		}		
		$('#cmmnForm').attr('action', "${selfPath}edit.do");
		$('#cmmnForm').submit();
	}
</script>
<link rel="stylesheet" type="text/css" href="/css/home/kor/user/pool.css">
</head>
<body class="hold-transition register-page">

	<div class="register-box-body" >
		<div class="title">
			협력교원POOL 등록
		</div>
		<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
			<div class="form_block box1">
				<div class="form-group instructor">
					한국발명진흥회에서는 【온라인 발명교육지원센터】를 운영하면서 원격 강의를 담당할 “온라인 전문교원”을 확보하고 다양한 교육사업의 협력을 활성화하기 위해
					협력교원POOL을 운영하고 있습니다. <br><br>
					향후 발명교사의 역량 제고, 활용 강화, 네트워크 구축 등의 각종 교육 사업에 참여를 희망하는 분들은 협력교원POOL에 등록해주시기 바랍니다.
				</div>
			</div>
			<div class="form-group">
			</div>
			<div class="form-group">
				<h4 class="person-title">
					개인정보 수집 및 이용목적에 관한 동의 내용
				</h4>
	
				<div class="person-contents"><b>1. 개인정보의 수집 및 이용 목적 </b>
					- 한국발명진흥회와 온라인 발명교육센터의 원격 강의, 개발, 자문 등의 목적으로 개인정보를 처리(수집·이용)합니다.
	
					<b>2. 수집·이용하려는 개인정보의 항목 </b>
					- 기초정보(아이디, 성명, 생년월일, 성별, 휴대폰 번호, 이메일 주소, 소속, 직위, 학력)
					- 자격이력(발명교사인증제 취득 여부, 발명교사 인증제 번호, 교사연구회 참여 이력, 직무 연수 참여 이력)
					- 강의이력(KIPA 교육 플랫폼 활용 교육 경력, 발명교육 콘텐츠 개발 경력, 기타 관련 경력, 강의 가능 학교급, 희망 활동 분야) 등 총 18개 항목
	
					<b>3. 개인정보의 보유 및 이용기간 </b>
					- 개인정보파일명 : 온라인 발명교육지원센터 협력교원POOL 지원
					- 정보보유 및 이용기간 : 5년
	
					<b>4. 개인정보보호</b>
					- 수집된 개인정보는 암호화되어 처리됩니다.
	
					<b>5. 이용자는 개인정보 수집 및 이용 동의에 대한 거부 권리가 있습니다.</b>
					- 개인정보 수집·이용에 대한 동의를 하지 않으실 경우 사업 협력 참여 등에서 불이익이 발생하게 됩니다.
				</div>
			</div>
			<div class="agree_chk_wrap">
				<span>개인정보 수집 및 이용목적에 대해 동의하십니까?</span>
				<span class="radio_form"><input type="radio"  id="agree_true" name="paramKey40" value="Y" vali-text="개인정보보유 및 이용기간 동의를 선택해주세요."/><label for="agree_true">동의함</label></span>
				<span class="radio_form"><input type="radio"  id="agree_false" name="paramKey40" value="N" vali-text="개인정보보유 및 이용기간 동의를 선택해주세요."/><label for="agree_false">동의하지 않음</label></span>
			</div>
			<div class="form-group">
				<h4 class="person-title">
					아동·청소년 대상 범죄 전력 관련 서약
				</h4>
				<div class="person-contents"><b>1. 본인은 관련 법률에 의거하여 아래의 사안에 해당되지 않음을 확인하고, 만일 사실과 다를 경우 등록 취소 등의 조치에 이의가 없음을 서약합니다.</b>
					- 아동·청소년의 성보호에 관한 법률(제56조, 아동·청소년 관련기관등에의 취업제한 등)에 의한 범죄경력 조회결과 취업이 제한되는 자
					- 아동복지법 (제29조의3, 아동관련기관의 취업제한 등)에 의한 범죄경력 조회결과 취업이 제한되는 자
				</div>
			</div>
			<div class="agree_chk_wrap">
			<span>아동·청소년 대상 범죄 전력 관련 서약에 동의하십니까?</span>
				<span class="radio_form"><input type="radio"  id="agree2_true" name="paramKey41" value="Y" vali-text="개인정보보유 및 이용기간 동의를 선택해주세요."/><label for="agree2_true">동의함</label></span>
				<span class="radio_form"><input type="radio"  id="agree2_false" name="paramKey41" value="N" vali-text="개인정보보유 및 이용기간 동의를 선택해주세요."/><label for="agree2_false">동의하지 않음</label></span>
			</div>			
			
			
			
			<div class="form-group text-center box-footer">
				<button type="button" onclick="location.href='/';" class="btn btn_base" title="이전화면">이전화면</button>
				<button type="button" class="btn btn_blue" onclick="formSubmit(event);">동의하기</button>
			</div>
		</form:form>
	</div>
	<!-- /.form-box -->
	

	
	<!-- /.register-box -->
</body>
