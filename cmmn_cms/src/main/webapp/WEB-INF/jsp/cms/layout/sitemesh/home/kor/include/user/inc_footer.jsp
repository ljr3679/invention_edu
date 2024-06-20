<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->

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
                                <li><a href="/home/kor/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu70')}">공지사항</a></li>
                                <li><a href="/home/kor/archive/question/index.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu73')}">문의사항</a></li>
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
                            	<c:forEach items="${footerList}" var="list" varStatus="status">
                            		<c:choose>
                            			<c:when test="${list.openAt eq 'A'}">
                            				<li><a href="${list.url}" title="${list.title}">
                            					<c:out value="${list.title}" />
											</a></li>
                            			</c:when>
                            			<c:otherwise>
                            				<li><a href="${list.url}" target="_blank" title="${list.title}">
                            					<c:out value="${list.title}" />
											</a></li>
                            			</c:otherwise>
                            		</c:choose>
                            	</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<script>

	// 등록팝업
	$('.enroll_btn').on('click', function(){
		$('.pop_enroll').show();
		return false;
	});


	// 등록팝업, 미리보기팝업
	$('.close').on('click', function(){
		$('.pop_enroll').hide();

		return false;
	});

	</script>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-9GYCNNGCTX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-9GYCNNGCTX');
</script>

</div>