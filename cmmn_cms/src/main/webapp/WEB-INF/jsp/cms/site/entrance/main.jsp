<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<body>
	<!-- gapia start -->
	<div class="gapia-cms">
		<div>
			<p>문의사항 : 031-247-9711</p>
			<p>오류사항 : <a href="http://www.gapia.net/pms/login.asp" target="_blank" class="btn-pms">PMS (프로젝트 게시판) 바로가기 </a></p>
		</div>
	</div>
	<!-- // gapia end -->

	<script type="text/javascript">
		$(document).ready(function() {
			$('.gnb').find('li').removeClass('on');
		});
	</script>
</body>