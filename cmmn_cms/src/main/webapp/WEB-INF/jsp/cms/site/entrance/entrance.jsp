<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	
	<title><spring:eval expression="@globals['gbls.site.name']" /> 관리자  <sitemesh:write property="title" /></title>
	
	<link href="/images/cmmn/favicon.ico" rel="shortcut icon" type="image/x-icon" >   <!-- FAVICON -->
	
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_css.jsp" %>
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_js.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#paramKey1, #paramKey2').keyup(function(e) {
				if(e.keyCode == 13) fn_login();
			});
			$(".join_select1").select2();
		});
		
		var act = true;
		function fn_login() {
			if(act) {
				act = false;
				
				if ($("#paramKey1").val() == "") {
					alert("아이디를 입력해주세요.");
					$("#paramKey1").focus();
					act = true;
					return;
				}
				
				if ($("#paramKey2").val() == "") {
					alert("패스워드를 입력해주세요.");
					$("#paramKey2").focus();
					act = true;
					return;
				}
				
				fn_cmmn_ajax('/cmsManager/cms/session_check.ajax', true, {'key':$('#paramKey1').val()}, 'json', function(result) {
					act = true;
					
					if(result) {
						var code = result.resultCode;
						if(code == 1) {
							$('#cmmnForm').attr('action', '/cmsManager/cms/login.act');
							$('#cmmnForm').submit();		
						} else if(code == -1) {
							var respId = result.respId;
							var respIp = result.respIp;
							var respTime = result.respTime;
							
							if(confirm('요청하신 '+respId+'는 '+respIp+'에서 '+respTime+'부터 접속중입니다.\n강제 로그인 하시겠습니까?')) {
								$('#cmmnForm').attr('action', '/cmsManager/cms/login.act');
								$('#cmmnForm').submit();
							}
						}
						else alert('서버 오류가 발생했습니다\n관리자에게 문의해주세요.');  
					}
				});
			}
		}
		
		function fn_site_change(siteCode) {
			fn_cmmn_ajax('/common/lang/info.ajax', true, {'siteCode':siteCode}, 'json', function(res) {
				if(res.data) {
					var dataList = res.data;
					var size = res.data.length;
					var html = '';
					
					for(var i=0; i<size; i++) {
						var data = dataList[i];
						var langCode = data.langCode;
						var langTxt = data.langTxt;
						
						html += '<option value="'+langCode+'">'+langTxt+'</option>';
					}
					
					$('#langCode').html(html);
					if(size > 1) {
						$('#langCode').select2();
						$('.langZone').show();
					} else {
						$('#langCode').select2('destroy');
						$('.langZone').hide();
					}
				}
			});
		}
	</script>
	<style>
	.login-form .btn-login-admin {
		top: 26px;
	}
	.languageSet, .siteSet {
		width: 200px;
	}
	</style>
</head>
<body>
	<div id="wrap" class="main_wrap">
		<!-- login start -->
		<div class="login">
			<h1><spring:eval expression="@globals['gbls.site.name']" /> 관리자시스템</h1>
			
			<form:form commandName="commonVO" id="cmmnForm" name="cmmnForm" cssClass="login_box" method="post">
			<input type="hidden" id="paramKey3" name="paramKey3" value="${ipStatus}"/>
			<div class="login-wrap">
				<h2 class="logo">
					<c:choose>
						<c:when test="${fn:length(siteCode) gt 1}">
							<span>사이트 : </span>
							<select id="siteCode" name=siteCode class="join_select1 siteSet" onChange="fn_site_change(this.value);">
								<c:forEach items="${siteCode}" var="site" varStatus="status">
									<option value="${site.siteCode}"><c:out value="${site.siteTxt}"/></option>
								</c:forEach>
							</select>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="siteCode" name="siteCode" value="${siteCode[0].siteCode}"/>
						</c:otherwise>
					</c:choose>
					
					<span class="langZone" <c:if test="${fn:length(langCode) eq 1}">style="display: none;"</c:if>>언어 : </span>
					<select id="langCode" name="langCode" class="<c:if test="${fn:length(langCode) ne 1}">join_select1</c:if> languageSet langZone" <c:if test="${fn:length(langCode) eq 1}">style="display: none;"</c:if>>
						<c:forEach items="${langCode}" var="lang" varStatus="status">
							<option value="${lang.langCode}"><c:out value="${lang.langTxt}"/></option>
						</c:forEach>
					</select>
				</h2>
				<div class="login-form">
					<p class="id">
						<label for="t1">아이디</label>
						<input type="text" id="paramKey1" name="paramKey1" placeholder="아이디"/>
					</p>
					<p class="pass">
						<label for="t2">비밀번호</label>
						<input type="password" id="paramKey2" name="paramKey2" placeholder="비밀번호"/>
					</p>
					<p class="btn-login-admin" style="background: none; border: none; cursor: pointer;" onClick="fn_login();"><img src="<c:url value='/images/cmmn/admin/btn_login.png'/>" alt="" /></p>
				</div>				
			</div>
			</form:form>
		</div>
		<!-- login end -->
	</div>
</body>
</html>