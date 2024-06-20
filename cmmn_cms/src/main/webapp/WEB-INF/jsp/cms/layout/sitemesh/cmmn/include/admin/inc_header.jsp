<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<div class="admin_header clearfix">
	<!-- admin_logo -->
	<h1 class="admin_logo">
		<span class="g_logo">
			<img src="/images/cmmn/admin/admin_g_logo1.png" alt="GAPIA CMS" class="admin_logo1">
			<img src="/images/cmmn/admin/admin_g_logo2.png" alt="GAPIA CMS" class="admin_logo2">
		</span>
		<span class="txt_logo"><spring:eval expression="@globals['gbls.site.name']" /></span>
	</h1>	
	<!-- // admin_logo -->
	
	<!-- admin_head_util -->
	<div class="admin_head_util">
		<p class="login_log_txt">공통서비스 테스트 사이트(업무사용자용)<br><span style="float: right;">[남은시간 : <span id="sessionTime"></span>]</span></p>
		<div class="slt_box" id="slt_box">
			<button type="button" id="admin_head_util_btn2" class="slt_btn">
				<c:set var="mSiteInfo" value="${admSession.siteInfo.get(admSession.mSiteCode)}"/>
				<c:set var="mLangInfo" value="${admSession.siteInfo.get(admSession.mSiteCode).langCode.get(admSession.mLangCode)}"/>
				<c:out value="${mSiteInfo.siteTxt} - ${mLangInfo.langTxt}"/>
			</button>
			<ul class="slt_option" id="slt_option2" style="display: none;">
			<c:forEach items="${admSession.siteInfo}" var="site">
				<c:forEach items="${site.value.langCode}" var="lang">
					<li class="li02"><a href="javascript:void(0);" onClick="fn_global_site_info('${site.value.siteCode}|${lang.value.langCode}');" class="logout"><c:out value="${site.value.siteTxt} - ${lang.value.langTxt}"/></a></li>
				</c:forEach>
			</c:forEach>
			</ul>
		</div>
		<div class="slt_box" id="slt_box">
			<button type="button" id="admin_head_util_btn" class="slt_btn"><img src="/images/cmmn/admin/member_ico.png" alt="">
				<c:choose>
					<c:when test="${admSession.account eq 'S'}">시스템 슈퍼 관리자</c:when>
					<c:when test="${admSession.account eq 'A'}">시스템 관리자</c:when>
				</c:choose>
			</button>
			<ul class="slt_option" id="slt_option" style="display: none;">
				<li class="li02"><a href="javascript:void(0);" onClick="fn_adm_logout();" class="logout">로그아웃</a></li>
			</ul>
		</div>
		<ul class="menu_box">
			<li class="li01"><a href="/" target="_blank" title="사용자 메인 새 창 열림"><span class="hide">사용자 메인 바로가기</span></a></li>
			<li class="li02"><a href="#" id="cc_layer_open"><span class="hide">저작관 정보 보기</span></a></li>
		</ul>
	</div>
	<!-- // admin_head_util -->

	<!-- cc_layer_box -->
	<div class="cc_layer_box">
		<!-- cc_layer -->
		<div class="cc_layer bounceIn animated">
			<div class="cc_layer_contents">
				<div class="cc_layer_top">
					<strong class="cc_strong_tit"><img src="/images/cmmn/admin/admin_g_logo3.png" alt="GAPIA CMS"></strong>
					<p class="date">2018. 03. 05</p>
				</div>
				<div class="cc_layer_mid">
					<p class="txt_each">GAPIA CMS 사용시 유의사항은 다음과 같습니다.</p>
					<p class="txt_each">
						당사에서 제공하는 이미지 중 초상권, 상표권, 재산권, 특허권 등의 권리를 보유하지 않은 이미지가 일부 포함되어있습니다. 
						해당 이미지를 상업적으로 이용하시려는 고객님께서는 각 권리자에게 별도로 사용에 대한 허락을 받으셔야 합니다. 
						권리자의 사전허락 없이 무단으로 사용된 이미지로 인해 발생된 모든 문제에 대한 책임은 회원에게 있습니다.
					</p>
				</div>
				<div class="cc_layer_btm">
					<p class="mb_5">http://www.gapia.net</p>
					<p>Copyright© GAPIA. ALL Rights Reserved.</p>
				</div>
			</div>
			
			<button type="button" class="cc_layer_close"><i class="xi-close"></i><span class="hide">레이어 창 닫기</span></button>
		</div>
		<!-- // cc_layer -->
	</div>
	<!-- // cc_layer_box -->
	
	<div class="gnb">
		<ul>
			<li class="home"><a href="/cmsManager/cms/main.do">HOME</a></li>
			<c:if test="${not empty depthTree}">
				<c:forEach begin="0" end="${depthTree.size()-1}" step="1" var="index" varStatus="status">
					<c:set var="menu" value="${depthTree[index][0]}"/>
					<c:set var="menuAuth" value="auth_${menu.no}"/>
					<c:set var="folderPath" value="/cmsManager/${admSession.mSiteCode}/${admSession.mLangCode}/folder.act"/>
					
					<c:choose>
						<c:when test="${menu.menuType eq 'L'}">
							<li <c:if test="${menu.no eq menuTree[admSession.topMenuList[admSession.topMenuCnt-1].menuPos].no}">class="on"</c:if> <c:if test="${menu.useAt eq 'N' or admSession.menuList.indexOf(menuAuth) eq -1}">menu_delete="Y" style="display: none;"</c:if>><a href="${menu.linkUrl}" <c:if test="${menu.linkType eq 'Y'}">target="_blank"</c:if> style="cursor:pointer;"><c:out value='${menu.menuTitle}'/></a></li>
						</c:when>
						<c:otherwise>
							<li <c:if test="${menu.no eq menuTree[admSession.topMenuList[admSession.topMenuCnt-1].menuPos].no}">class="on"</c:if> <c:if test="${menu.useAt eq 'N' or admSession.menuList.indexOf(menuAuth) eq -1}">menu_delete="Y" style="display: none;"</c:if>><a onClick="fn_menu_move('${menu.children gt 0 ?folderPath :menu.uri}', '${menu.menuPos}');" style="cursor:pointer;"><c:out value='${menu.menuTitle}'/></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
		</ul>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var sessionTime = parseInt('${admSessionTime}') / 1000;
	function sessionRunning() {
		if(sessionTime > 0) {
			setTimeout(function() {
				--sessionTime;
				var min = parseInt(sessionTime / 60);
				var sec = sessionTime % 60;
				$('#sessionTime').html((min > 9 ?''+min :'0'+min)+'분 '+(sec > 9 ?''+sec :'0'+sec)+'초');
				sessionRunning();
			}, 1000);	
		} else {
			alert('세션이 만료되어 로그아웃 처리됩니다.');
			fn_cmmn_ajax('/cmsManager/cms/site_out.ajax', true, null, 'text', function(result) {});
			location.href = '/cmsManager/';
		} 
	}

	var min = parseInt(sessionTime / 60);
	var sec = sessionTime % 60;
	$('#sessionTime').html((min > 9 ?''+min :'0'+min)+'분 '+(sec > 9 ?''+sec :'0'+sec)+'초');
	sessionRunning();	
});
</script>
