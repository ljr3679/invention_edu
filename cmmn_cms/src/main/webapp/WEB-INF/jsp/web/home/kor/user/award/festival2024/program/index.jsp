<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script type="text/javascript">
function fn_tab_menu(type) {
	$("#tabPos2").val(type);
	$('#cmmnForm').attr('action', '${selfPath}indexTab'+type+'.do');
	$('#cmmnForm').submit();
}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
	<div class="program_box">
		<ul class="list">
			<li class="bg01">
				<a href="javascript:void(0);" onclick="fn_tab_menu('A');" class="box">
					<div class="info_text">
						<div class="title">가상현실콘텐츠</div>
						<div class="text"> (VR Attracion)</div>
					</div>
				</a>
			</li>
			<li class="bg02">
				<a href="javascript:void(0);" onclick="fn_tab_menu('B');" class="box">
					<div class="img_box">
					</div>
					<div class="info_text">
						<div class="title">동작인식 커넥트</div>
						<div class="text">(Complete the Inventions!)</div>
					</div>
				</a>
			</li>
			<li class="bg03">
				<a href="javascript:void(0);" onclick="fn_tab_menu('C');" class="box">
					<div class="info_text">
						<div class="title">증강현실 콘텐츠</div>
						<div class="text">(AR 보물찾기)</div>
					</div>
				</a>
			</li>
			<li class="bg04">
				<a href="javascript:void(0);" onclick="fn_tab_menu('D');" class="box">
					<div class="info_text">
						<div class="title">기타 체험프로그램</div>
						<div class="text">(가상터치, 코딩체험 등)</div>
					</div>
				</a>
			</li>
		</ul>
	</div>
</form:form>
</body>