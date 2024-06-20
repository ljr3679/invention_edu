<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="author" content="<spring:eval expression="@globals['gbls.site.name']" />">
	<meta name="description" content="발명교육 활성화를 위한 발명교육포털사이트">
	<meta name="keywords" content="한국발명진흥회, 발명교육, 발명, 교육, 학생발명전시회, 학생창의력 챔피언대회, YIP, 청소년발명가 프로그램, IP Meister Program, 발명교육대상, 전국교원 발명 연구대회, 차세대 영재 기업인 선발, 발명 영재 교육 연구원, 발명교사 교육센터, ">
    <meta property="og:title" content="<spring:eval expression="@globals['gbls.site.name']" />">
    <meta property="og:description" content="<spring:eval expression="@globals['gbls.site.name']" />">
    <meta property="og:image" content="/images/home/kor/user/home/kor/user/common/head_logo.png">
    <meta property="og:url" content="url">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="No-Cache">
	<title><spring:eval expression="@globals['gbls.site.name']" /><c:if test="${empty layout_option}"> [<c:out value="${menuSession.menu.menuTitle}" escapeXml="false"/>]</c:if></title>
    
	<link href="/images/cmmn/favicon.ico" rel="shortcut icon" type="image/x-icon" >   <!-- FAVICON -->
	
<%-- 	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_css.jsp" %> --%>
<%-- 	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_js.jsp" %> --%>
	
	<script type="text/javascript" src="/js/home/kor/user/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/js/home/kor/user/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/cmmn/common_util.js"></script>
	<link rel="stylesheet" href="/css/home/kor/user/CoreDream.css">
	<link rel="stylesheet" type="text/css" href="/css/home/kor/user/common.css">
	<link rel="stylesheet" type="text/css" href="/css/home/kor/user/comm_respond.css">
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" type="text/css" href="/css/home/kor/user/judge.css">
</head>
<body>

<script type="text/javascript">
	function fn_tab(tab) {
		$("#tabPos").val(tab);
		$('#cmmnForm').attr('action', '${selfPath}index.do');
		$('#cmmnForm').submit();
	}
	function fn_orderby(order) {
		console.log("order:::" + order);
		$('#searchValue5').val(order);
		$('#pageIndex').val('1');
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}
	function fn_download() {
		$('#excelDownForm').unbind();
		$('#excelDownForm').attr('action', "${vo.selfPath}excelDownload.do");
		$('#excelDownForm').submit();
	}
</script>

<header>
	<div class="top_wrap">
		<div class="center_box">
			<img src="/images/home/kor/user/judge/top_img.png" usemap="#Map" alt="대한민국학생발명전시회 공중심사">
			<map name="Map" id="Map">
				<area shape="rect" coords="1,26,420,90" href="/${vo.siteCode}/${vo.langCode}/judge/main/index.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu257')}" alt="logo">
				<area shape="rect" coords="472,95,570,120" href="/${vo.siteCode}/${vo.langCode}/judge/main/index.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu257')}&tabPos=G" alt="공중 심사안내">
			</map>
			<span class="pull-right">
				<b>※공중심사 대상작 명단</b>
				<a href="javascript:void(0);" onClick="fn_download();"><img src="/images/home/kor/user/judge/btn_down.gif" alt="다운로드"></a>
			</span>
		</div>
	</div>
	<div class="menu_bar">
		<div class="center_box">
			<div class="menu_pac">
				<ul>
					
					<li <c:if test="${vo.tabPos eq 'A'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('A');">출품작 전체보기</a></li>
					<li <c:if test="${vo.tabPos eq 'B'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('B');">초등</a></li>
					<li <c:if test="${vo.tabPos eq 'C'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('C');">중등</a></li>
					<li <c:if test="${vo.tabPos eq 'D'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('D');">고등</a></li>
					<li <c:if test="${vo.tabPos eq 'E'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('E');">청소년</a></li>
					<li <c:if test="${vo.tabPos eq 'F'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('F');">교원</a></li>
					<li class="special"><a href="javascript:void(0);" onclick="fn_tab('G');">공중심사안내</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>

<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<input type="hidden" id="searchValue5" name="searchValue5" value="${vo.searchValue5}" />
	<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
	<form:hidden path="tabPos"/>
	<div class="content-wrapper" style="min-height: 438px;">
		<div class="center_box">
			<c:choose>
				<c:when test="${vo.tabPos eq 'A'}">
					<div class="list_wrap">
						<%@ include file="/WEB-INF/jsp/web/home/kor/user/judge/main/indexTabA.jsp" %>	
					</div>
				</c:when>
				<c:when test="${vo.tabPos eq 'B'}">
					<div class="list_wrap">
						<%@ include file="/WEB-INF/jsp/web/home/kor/user/judge/main/indexTabA.jsp" %>	
					</div>
				</c:when>
				<c:when test="${vo.tabPos eq 'C'}">
					<div class="list_wrap">
						<%@ include file="/WEB-INF/jsp/web/home/kor/user/judge/main/indexTabA.jsp" %>	
					</div>
				</c:when>
				<c:when test="${vo.tabPos eq 'D'}">
					<div class="list_wrap">
						<%@ include file="/WEB-INF/jsp/web/home/kor/user/judge/main/indexTabA.jsp" %>	
					</div>
				</c:when>
				<c:when test="${vo.tabPos eq 'E'}">
					<div class="list_wrap">
						<%@ include file="/WEB-INF/jsp/web/home/kor/user/judge/main/indexTabA.jsp" %>	
					</div>
				</c:when>
				<c:when test="${vo.tabPos eq 'F'}">
					<div class="list_wrap">
						<%@ include file="/WEB-INF/jsp/web/home/kor/user/judge/main/indexTabA.jsp" %>	
					</div>
				</c:when>
				<c:when test="${vo.tabPos eq 'G'}">
					<%@ include file="/WEB-INF/jsp/web/home/kor/user/judge/main/guide.jsp" %>
				</c:when>
			</c:choose>
		</div>
	</div>
</form:form>
<form:form commandName="commonVO" name="excelDownForm" id="excelDownForm" method="post">
	<input type="hidden" id="searchValue3" name="searchValue3" value="${vo.searchValue3}"/>
	<input type="hidden" id="searchValue4" name="searchValue4" value="${vo.searchValue4}"/>
	<input type="hidden" id="searchValue5" name="searchValue5" value="${vo.searchValue5}"/>
	<input type="hidden" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}"/>
</form:form>
<%-- <footer class="main-footer">
	<div class="center_box">
		<div class="div_select" data-role="selectBox">
			<span date-value="optValue" class="selected-option">
				<!-- 관련기관 및 단체 -->
			</span>
			<!-- 옵션 영역 -->
			<ul class="hidden">
				<li><a href="javascript:void(0);" title="관련기관 및 단체">관련기관 및 단체</a></li>
				<li><a href="http://www.kipo.go.kr/kpo/user.tdf?a=user.main.MainApp" target="_blank" title="특허청">특허청</a></li>
				<li><a href="http://iipti.kipo.go.kr/index.jsp?sd=KR" target="_blank" title="국제지식재산연수원">국제지식재산연수원</a></li>
				<li><a href="https://www.kiip.re.kr/index.do" target="_blank" title="새창:한국지식재산연구원">한국지식재산연구원</a></li>
				<li><a href="http://www.kipra.or.kr/" target="_blank" title="한국지식재산보호협회">한국지식재산보호협회</a></li>
				<li><a href="http://www.kasi.org/" target="_blank" title="한국학교발명협회">한국학교발명협회</a></li>
				<li><a href="http://www.kipi.or.kr/main.do" target="_blank" title="한국특허정보원">한국특허정보원</a></li>
				<li><a href="http://www.rndip.re.kr" target="_blank" title="한국지식재산전략원">한국지식재산전략원</a></li>
				<li><a href="http://www.pipc.or.kr" target="_blank" title="특허정보진흥센터">특허정보진흥센터</a></li>
				<li><a href="http://ipschool.ipacademy.net/servlet/SchoolController" target="_blank" title="발명교육센터">발명교육센터</a></li>
				<li><a href="http://www.designmap.or.kr/" target="_blank" title="디자인맵">디자인맵</a></li>
				<li><a href="http://www.pcc.or.kr/pcc/index.php" target="_blank" title="공익변리사">공익변리사 특허상담센터</a></li>
				<li><a href="http://www.inventor.or.kr/" target="_blank" title="한국여성 발명협회">한국여성 발명협회</a></li>
			</ul>
		</div>

		<div class="footer-counting">
			<span>
				<span class="title">Total</span>
				<span class="cnt">10,290,823</span>
			</span>
			<span>
				<span class="title">Today</span>
				<span class="cnt">3</span>
			</span>
		</div>

		<ul class="btm_sideMenu">
			<li class="first-child"><a href="/main/notice/bbs/36" title="공지사항">공지사항</a></li>
			<li><a href="/main/qna" title="문의사항">문의사항</a></li>
			<li><a href="http://kipa.org/kipa/kw_060101.jsp" title="이용약관" target="_blank">이용약관</a></li>
			<li><a href="http://www.kipa.org/kipa/kw_060200.jsp" title="사이트이용안내" target="_blank">사이트 이용안내</a></li>
			<li><a href="http://www.kipa.org/kipa/kw_060601.jsp" title="개인정보처리방침" class="link_orange" target="_blank">개인정보 처리방침</a></li>
		</ul>

		<div>
			(06133) 서울특별시 강남구 테헤란로 131 (역삼동, 발명진흥회)&nbsp;
		</div>

		<div class="relevant-site">
			<span><a href="http://www.kipo.go.kr" target="_blank"><img src="/images/home/kor/user/judge/re2016-common-btm-logo_01.png" width="70" height="30" alt="특허청"></a></span>
			<span><a href="http://www.kipa.org" target="_blank"><img src="/images/home/kor/user/judge/re2016-common-btm-logo_02.png" width="106" height="30" alt="한국발명진흥회"></a></span>
		</div>
	</div>
</footer> --%>
<div id="footer" class="footer">
        <div class="container2">
            <div class="ft_btm">
                <div class="ft_btm_left">
                    <div class="ft_logo_box">
                        <a href="/"><img src="/images/home/kor/user/common/ft_logo.jpg" alt=""></a>
                    </div>
                    <div class="ft_txt_box">
                        <div class="ft_txt_top">
                            <ul class="list">
                                <li><a href="/home/kor/board.do?menuPos=103">공지사항</a></li>
                                <li><a href="/home/kor/archive/question/index.do?menuPos=106">문의사항</a></li>
                                <li><a href="https://www.kipa.org/kipa/service/kw_0701.jsp" target="_blank">이용약관</a></li>
                                <li><a href="https://www.kipa.org/kipa/service/kw_0704_01.jsp" target="_blank">사이트 이용안내</a></li>
                                <li><a href="https://www.kipa.org/kipa/service/kw_0703_01.jsp" class="fw" target="_blank">개인정보처리방침</a></li>
                            </ul>
                        </div>
                        <div class="copyright_box">
                            <p>(06133) 서울특별시 강남구 테헤란로 131 (역삼동, 발명진흥회)</p>
                        </div>
                    </div>
                </div>
                <div class="ft_btm_right">
                    <div class="site_box">
                        <div class="baro_box">
                            <button type="button" class="site_btn">관련기관 및 단체 바로가기
                                <i class="xi-caret-up arr"></i>
                            </button>
                            <ul class="site_link">
	                            <li><a href="http://www.kipo.go.kr/kpo/user.tdf?a=user.main.MainApp" target="_blank" title="특허청">특허청</a></li>
								<li><a href="http://iipti.kipo.go.kr/index.jsp?sd=KR" target="_blank" title="국제지식재산연수원">국제지식재산연수원</a></li>
								<li><a href="https://www.kiip.re.kr/index.do" target="_blank" title="한국지식재산연구원">한국지식재산연구원</a></li>
								<li><a href="http://www.kipra.or.kr/" target="_blank" title="한국지식재산보호원">한국지식재산보호원</a></li>
								<li><a href="http://www.kasi.org/" title="한국학교발명협회">한국학교발명협회</a></li>
								<li><a href="http://www.kipi.or.kr/main.do" target="_blank" title="한국특허정보원">한국특허정보원</a></li>
								<li><a href="https://www.kista.re.kr/" target="_blank" title="한국특허전략개발원">한국특허전략개발원</a></li>
								<li><a href="http://www.pipc.or.kr" target="_blank" title="특허정보진흥센터">특허정보진흥센터</a></li>
								<li><a href="http://ipschool.ipacademy.net/servlet/SchoolController" target="_blank" title="발명교육센터">발명교육센터</a></li>
								<li><a href="http://www.designmap.or.kr/" target="_blank" title="디자인맵">디자인맵</a></li>
								<li><a href="http://www.pcc.or.kr/pcc/index.php" target="_blank" title="공익변리사 특허상담센터">공익변리사 특허상담센터</a></li>
								<li><a href="http://www.inventor.or.kr/" target="_blank" title="한국여성 발명협회">한국여성 발명협회</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<script>
		$(function(){
			var foot_site_speed = 300,
				foot_site_easing = "easeOutQuint";
			$(".site_btn").click(function(e) {
				if ($(this).siblings(".site_link").is(":hidden")) {
					$(".site_link:visible").slideUp(foot_site_speed, foot_site_easing);
					$(this).addClass("on").siblings(".site_link").slideDown(foot_site_speed, foot_site_easing);
				} else {
					$(this).removeClass("on").siblings(".site_link").slideUp(foot_site_speed, foot_site_easing);
				}
				e.stopPropagation();
			});

			$(document).click(function() {
				$(".site_btn").removeClass("on");
				$(".site_link:visible").slideUp(foot_site_speed, foot_site_easing);
			});
		})
	</script>
</div>
<div class="view_detail" style="display:none">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" onclick="popupClose();"><i class="xi-close"><span class="hide">닫기</span></i></button>
				<span class="view_cate" id="judge_type">초등</span>
				<span class="view_num" id="judge_reqno">123456</span>
			</div>
			<div class="modal-body">
				<div class="view_table_pac">
					<table class="view_table" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<th>발명의 명칭</th>
								<td id="invent_nm">신기한체험</td>
							</tr>
							<tr>
								<th>발명의 내용 및 특징</th>
								<td id="invent_cont">기분이 우울할때 거꾸로 돌려 보세요 </td>
							</tr>
							<tr>
								<td colspan="2" class="view_img">
									<ul id="cm_listFile1" class="rsFileList" style="width: 100%;">
										<li id="image_text"></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function fn_like(code, usrCode, obj) {
		if(usrCode == "") {
			alert("로그인 후 이용가능합니다.");
			return;
		}
		fn_cmmn_ajax("${vo.selfPath}like.ajax", false, {'code':code, 'usrCode':usrCode }, 'json', function(res) {
			if(res) {
				var result = res.result;
				var likeCnt = res.likeCnt;
				var msg = res.msg;
				switch (result) {
				case '400': alert(msg); break;
				case '200' : 
				/* $('#like_'+idx).addClass('active'); */
				/* $('#like_count_'+code).text( $('#like_count_'+code).val()+1 ); */
				console.log('code::'+code );
				$('#heart_'+code).attr("xlink:href", "data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAbCAMAAABcI88jAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA7VBMVEX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX6RUX///8J5uuKAAAATXRSTlMABGCz4fLkt2YIAmG04rVlCUnf405F2+VRaFNMcz9L7fcHXmzI5+v17/DXpLlfaw35EYyb/RBPXI+cq7ivl6FyfT7prBP0+2cbusQko8kppQwAAAABYktHRE4ZYXHfAAAAB3RJTUUH5gUMCjIpLKorPAAAAL9JREFUKM990tUSwjAQheGDa3HX4u7u7uT9X4d2ihWa/e92votMNgGkdHqD0WS2WG3yYHc4BZPgcnvwzOtjSv4AEAw9h3BE0Sj7FIt/DQlZk4xbSjo3zWcxgywjysFFcR4FiosQKS6hTHEFVYp9qFFcR4PiJlptgjtAl689aece7tX6A/lNhjweKS861tbJ6z9MtXSGd3NSgcWvLqFqpdY1ftoIH9wG8Vfrvf3dHlrpDzIeT+B0vjB2vYHf5K6eH9I2q2fguKR9AAAAAElFTkSuQmCC");
				return; break;
				case '201' :
				/* $('#like_count_'+code).text(likeCnt); */
				console.log('code::'+code );
				$('#heart_'+code).attr("xlink:href", "data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAbCAQAAADB9PeaAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQfmBQsSBiP4t/ukAAABcUlEQVQ4y53SwWvPcRzH8Ue/pvxirTgqLsRBkuSidjFaK6L4B+YgKy7sTI4cxclBNCuR1EQO1q9WDruIYhaHnSyK02QLL4evn/389vtt39/vefr0en2e9en9/lCnxxmvRMRb563/11Sc9fpv88Y5VU0M+SliyrhJSyKOgyMWxW8142p+iTjRqI6Iz441JId8EKccFfMGG5pBc2J0+WJMWsl9EU9bNBP1d1Us+ao1C9KmmRM9nBb9ba7ssb9Ns1dcYMaibvjiG/G4K3lMKnjflTxPBb1dydVCPtCVvANqbdexOt99rLiLfR2ru1TdYIN42bH8RPTBLbG7I3WbeFAc14lPHcmzsryjk+JOafW6GG4OLpdSR8Xt5vCRuLSmelG8aFVMiJurqlfbqRRzn7KpZbfRc3FvrWfFwIr8oIUyU+n3Q1z7L7si4nCZefZ6KGbsBFtNi2c2l1ELhkUMGRAxUl4s2GJaxDvbO1ULxuo/uDV/AMrggXZrDQ8vAAAAAElFTkSuQmCC");
				return; break;
				case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
				}
			}
		});
	}
	function menu(e) {
		$('.menu_pac ul li').removeClass('on').addClass('off');
		$('.menu_pac ul li:nth-child(' + e +')').removeClass('off').addClass('on');
	}
	
	function popupOpen(key) {
		fn_cmmn_ajax('${vo.selfPath}detail.ajax', false, {'key':key}, 'json', function(res) {
			if(res) {
				var result = res.result;
				var resultData = res.resultData;
				switch (result) {
					case '200':
						var typeName = resultData.typeName;
						var regNo = resultData.regNo;
						var title = resultData.title;
						var content = resultData.content;
						var attachName = resultData.attachName;
						var attachReName = resultData.attachReName;
						var attachExtension = resultData.attachExtension;
						
						var images = "";
						if(attachReName != null) {
							images = attachReName.substring(0,attachReName.indexOf(attachExtension)-1);   
							$("#image_text").html("<img src=\"/images/site/"+images+"/"+attachExtension+"/loader.do\" alt=\"\">");
	                  	}
						
						$('#judge_type').text(typeName);
						$('#judge_reqno').text(regNo);
						$('#invent_nm').text(title);
						$('#invent_cont').text(content);
						break;
					case '400': alert(res.msg); break;
					case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
				}
			} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
		});
		$(".view_detail").slideDown();
		$(".view_detail").after("<span class='layer_bg'></span>");
		$('body').css('overflow','hidden');
	}
	
	function popupClose() {
		$(".view_detail").hide();
		$("span.layer_bg").remove();
		
		$('body').removeAttr('style');
	}
	
	const body = document.querySelector('body');
	const select = document.querySelector(`[data-role="selectBox"]`);
	const values = select.querySelector(`[date-value="optValue"]`);
	const option = select.querySelector('ul');
	const opts = option.querySelectorAll('li');

	/* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
	function selects(e) {
		e.stopPropagation();
		option.setAttribute('style', `bottom:${select.offsetHeight}px`)
		if (option.classList.contains('hidden')) {
			option.classList.remove('hidden');
			option.classList.add('show');
		} else {
			option.classList.add('hidden');
			option.classList.remove('show');
		}
		selectOpt();
	}

	/* 옵션선택 */
	function selectOpt() {
		opts.forEach(opt => {
			const innerValue = opt.innerHTML;

			function changeValue() {
				values.innerHTML = innerValue;
			}
			opt.addEventListener('click', changeValue)
		});
	}

	/* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
	function selectFirst() {
		const firstValue = opts[0].innerHTML;
		values.innerHTML = '<li><a href="javascript:void(0);" title="관련기관 및 단체">관련기관 및 단체</a></li>'
	}

	/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
	function hideSelect() {
		if (option.classList.contains('show')) {
			option.classList.add('hidden');
			option.classList.remove('show');
		}
	}
	
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		if (scroll >= 220) {
			$(".menu_bar").addClass("scroll");
		} else {
			$(".menu_bar").removeClass("scroll");
		}
	});
	
	$(document).ready(function(){
		selectFirst();
		select.addEventListener('click', selects);
		body.addEventListener('click', hideSelect);
	});
</script>
</body>
</html>