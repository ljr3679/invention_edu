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
		<!-- 링크 -->
		<div class="flex_link">
			<ul class="item_list">
				<li class="item style01">
					<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=53740&searchValue1=0&searchKeyword=&pageIndex=1" class="box" target="_blank">
						<span class="icon"></span>
						<span class="title">[교재]세상을바꾼발명(교사용)</span>
						<span class="badge">바로가기</span>
					</a>
				</li>
				<li class="item style02">
					<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=53741&searchValue1=0&searchKeyword=&pageIndex=1" class="box" target="_blank">
						<span class="icon"></span>
						<span class="title">[교재]세상을바꾼발명(학생용)</span>
						<span class="badge">바로가기</span>
					</a>
				</li>
				<li class="item style03">
					<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=53742&searchValue1=0&searchKeyword=&pageIndex=1" class="box" target="_blank">
						<span class="icon"></span>
						<span class="title">[문제풀이]세상을바꾼발명</span>
						<span class="badge">바로가기</span>
					</a>
				</li>				
			</ul>
		</div>
		<!-- 탭 -->
		<div class="com_tab_wrap">

			<div id="tab_1" class="com_tab_info on">
				<div class="table_wrapper">

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