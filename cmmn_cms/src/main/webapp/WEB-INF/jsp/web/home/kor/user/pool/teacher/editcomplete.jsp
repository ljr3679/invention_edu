<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<head>

<script> 
	function formSubmit(event) {
		$(event.target).prop('disabled', true);

		if (!$('#agree_true').is(':checked')) {
			alert('개인정보 수집 및 이용목적에 대한 동의가 필요합니다.');
			$(this.event.target).prop('disabled', false);
			$('#agree_true').focus();
			return;
		}
		$('#cmmnForm').attr('action', "${selfPath}edit.do");
		$('#cmmnForm').submit();
	}
</script>
<link rel="stylesheet" type="text/css" href="/css/home/kor/user/pool.css">
</head>
<body class="hold-transition register-page">
		<!-- done  -->
		<div class="done_wrap">
			<div class="done_mesg">
				<p class="txt_big">강사풀 정보등록/수정이 완료되었습니다.</p>
				<p class="txt_min">회원님의 관리코드는 <span>${code}</span> 입니다.</p>
			</div>
			<div class="btn_wrap txc">
				<button type="button" onclick="location.href='/';" class="btn btn-primary" title="이전화면">확인</button>
			</div>
		</div>&nbsp;&nbsp;

</body>
