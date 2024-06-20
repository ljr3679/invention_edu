<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
	var w = screen.width;
	var h = screen.height;
	var alignX = w / 2 - (800 / 2);
	var alignY = h / 2 - (600 / 2);
	
	function popup(urls) {
		pop_status = window.open(urls, 'popup', 'width=800,height=450,resizable=yes,scrollbars=no,toolbars=yes,menubars=0,top=' + alignY + ',left=' + alignX);
		pop_status.focus();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<div class="cont_wrap">
	<div class="cont_each">
		<div class="desc_container">
			<dl class="desc_box">
				<dt>‘TRIZ’란?</dt>
				<dd>러시아어인 ‘Teoriya Resheniya Izobreatatelskikh Zadatch’의 줄임말로 창의적으로 문제를 해결하기 위한 혁신적인 아이디어 발상기법</dd>
			</dl>
			<div class="desc_text">
				영어로는 ‘Theory of solving inventive problems’ 혹은 ‘Theory of inventive problems solving<span class="color">(TIPS)</span>’으로 풀이합니다.
				이는 러시아의 겐리히 알츠슐러(Genrich Altshuller)에 의해 제창된 발명문제 혹은 창의문제의 해결을 위한 체계적 방법론입니다.
				창의적 문제해결 방법 중 트리즈<span class="color">(TIPS)</span>는 전 세계적으로 입지를 굳혀가며 여러 분야에 걸쳐 활용되고 있는데 이는 40가지의 발명원리, 과학적
				효과, 표준해결책 등 문제해결을 위한 구체적인 방법을 제시하기 때문입니다.
				현재 창의적 과학·기술·콘텐츠 등 지식재산 집약 산업이 새로운 성장 패러다임으로 부각하는 가운데, 트리즈를 초·중·고에서뿐만 아니라
				기업체에서 활용하는 등 실제 활용 면에서는 한국이 세계를 선도하고 있습니다.
			</div>
		</div>
		<!-- 링크 -->
		<div class="flex_link">
			<ul class="item_list">
				<li class="item style01">
					<!-- <a href="https://ip-edu.net/contents/data/bbs/1/12233" class="box" target="_blank"> -->
					<!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52463&searchValue1=0&searchKeyword=&pageIndex=5 -->
					<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52463&searchValue1=0&searchKeyword=&pageIndex=5" class="box" target="_blank">
						<span class="icon"></span>
						<span class="title">교사용 TRIZ 기법 교재</span>
						<span class="badge">바로가기</span>
					</a>
				</li>
				<li class="item style02">
					<!-- <a href="https://ip-edu.net/contents/data/bbs/1/12234" target="_blank" class="box"> -->
					<!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52464&searchValue1=0&searchKeyword=&pageIndex=5 -->
					<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52464&searchValue1=0&searchKeyword=&pageIndex=5" class="box" target="_blank">
						<span class="icon"></span>
						<span class="title">학생용 TRIZ 기법 교재</span>
						<span class="badge">바로가기</span>
					</a>
				</li>
			</ul>
		</div>
		<!-- 탭 -->
		<div class="com_tab_wrap">

			<div id="tab_1" class="com_tab_info on">
				<div class="table_wrapper">
					<!-- <div class="table_top_nav">
                             <div class="left_area page_num"><i class="xi-file-text-o"></i> 총 <span class="point_blue">3</span>개 (<span class="point_blue">1</span> / 1 페이지)</div>
                             <div class="right_area">
                                 <select name="" id="">
                                     <option value="">10개씩보기</option>
                                     <option value="">20개씩보기</option>
                                     <option value="">30개씩보기</option>
                                 </select>
                             </div>
                         </div> -->
					<div class="table_top_text">
						<span class="exclam">리스트를 클릭하시면 동영상을 보실 수 있습니다.</span>
					</div>
                         <div class="board_wrap mobile">
                             <ul>
                                 <!-- 기본공지 list -->
                                 <c:forEach items="${resultList}" var="list" varStatus="status">
                                 	<li>
	                                     <div class="teg">
	                                     	<c:choose>
												<c:when test="${list.newAt eq 'Y'}">
													<span class="teg_new">new</span> <!-- 년 / 호 -->
												</c:when>
											</c:choose>
	                                         <!-- <span class="teg_notice">공지</span> --> <!-- 카테고리 -->
	                                     </div>
	                                     <div class="title">
	                                         <a href="${list.url}"><c:out value="${list.title}" escapeXml="false"/></a>
	                                         <!-- <i class="file xi-paperclip"><span class="hide">파일</span></i> -->
	                                     </div>
	                                     <!-- 조회,작성일, 글쓴이 -->
	                                     <div class="order_list">
	                                         <dl>
	                                             <dt>조회수</dt>
	                                             <dd>70</dd>
	                                         </dl>
	                                         <dl>
	                                             <dt>글쓴이</dt>
	                                             <dd><c:out value="${list.registerName}"/></dd>
	                                         </dl>
	                                         <dl>
	                                             <dt>작성일</dt>
	                                             <dd><c:out value="${list.regDate}" /></dd>
	                                         </dl>
	                                     </div>
	                                 </li>
                                 </c:forEach>
                             </ul>
                         </div>
					<div class="board_wrap web">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultList}" var="list" varStatus="status">
									<tr>
										<td>${((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
										<td class="subject">
											<c:choose>
												<c:when test="${list.newAt eq 'Y'}">
													<span class="teg_new">new</span>
												</c:when>
											</c:choose>
											<!-- <span class="teg_notice">공지</span> -->
											<a href="javascript:popup('${list.url}');"><c:out value="${list.title}"/></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="table_pagging">
						<span class="num">
							<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_cmmn_page" />
						</span>
						<form:hidden path="pageIndex" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form:form>
</body>