<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
	$(document).ready(function(){
	    /* fn_move_tab(1); */
	    console.log('SEARCHVALUE:::' + $('#searchValue2').val());
	}); 
	
	var w = screen.width;
	var h = screen.height;
	var alignX = w / 2 - (800 / 2);
	var alignY = h / 2 - (600 / 2);
	
	function popup(urls) {
		pop_status = window.open(urls, 'popup', 'width=800,height=450,resizable=yes,scrollbars=no,toolbars=yes,menubars=0,top=' + alignY + ',left=' + alignX);
		pop_status.focus();
	}
	
	function fn_move_tab(move){
		console.log('move::' + move);
	    $('.tab').removeClass('on');
	    $('.viewArea').attr('style', "display:none;");
	    $('#view'+move).attr('style', "display:inline;");
	    $('#tab'+move).addClass('on');
	}
	function fn_change_tab(searchValue2) {
		$('#searchValue2').val(searchValue2);
		$("#pageIndex").val("1");
		fn_cmmn_search();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="searchValue2" name="searchValue2" value="${vo.searchValue2}" />
<div class="cont_wrap">
    <div class="cont_each">
            <!-- 링크 -->
            <div class="flex_link">
                <ul class="item_list">
                    <li class="item style01">
                        <a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52489&searchValue1=0&searchKeyword=&pageIndex=2" target="_blank" class="box">
                        <!-- <a href="http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52489&searchValue1=0&searchKeyword=&pageIndex=2" target="_blank" class="box"> -->
                        <!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52489&searchValue1=0&searchKeyword=&pageIndex=2 -->
                            <span class="icon"></span>
                            <span class="title">교사용 지도서</span>
                            <span class="badge">바로가기</span> 
                        </a>
                    </li>
                    <li class="item style02">
                        <a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52490&searchValue1=0&searchKeyword=&pageIndex=2" target="_blank" class="box">
                        <!-- <a href="https://ip-edu.net/contents/data/bbs/1/25758" target="_blank" class="box"> -->
                        <!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52490&searchValue1=0&searchKeyword=&pageIndex=2 -->
                            <span class="icon"></span>
                            <span class="title">학생용 교재</span>
                            <span class="badge">바로가기</span>  
                        </a>
                    </li>
                </ul>
            </div>
            <!-- 탭 -->
            <div class="com_tab_wrap">
                <div class="com_tab_cont sty1">
                    <div class="tab_slt_box">
                    	<c:forEach items="${type}" var="list" varStatus="status">
                    		<c:choose>
                    			<c:when test="${vo.searchValue2 eq list.no}">
                    				<button type="button"><c:out value="${list.dataName}"/></button>
                    			</c:when>
                    		</c:choose>
                    	</c:forEach>
                    </div>
                    <ul class="list">
                    	<c:forEach items="${type}" var="list" varStatus="status">
                    		<c:choose>
                    			<c:when test="${vo.searchValue2 eq list.no}">
                    				<li data-tab="tab_${status.count}" class="on">
                    					<button type="button" onClick="fn_change_tab('${list.no}');">${list.dataName}</button>
                    				</li>
                    			</c:when>
                    			<c:otherwise>
                    				<li data-tab="tab_${status.count}"><button type="button" onClick="fn_change_tab('${list.no}');">${list.dataName}</button></li>
                    			</c:otherwise>
                    		</c:choose>
						</c:forEach>
                    </ul>
                </div>
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
	                                    		<c:when test="${list.newAt eq 'Y' }">
	                                    			<span class="teg_new">new</span> <!-- 년 / 호 -->
	                                    		</c:when>
	                                    	</c:choose>
	                                        <span class="teg_notice"><c:out value="${list.typeName}" /></span> <!-- 카테고리 -->
	                                    </div>
	                                    <div class="title">
	                                        <a href="javascript:popup('${list.url}');"><c:out value="${list.title}"  escapeXml="false"/></a>
	                                        <!-- <i class="file xi-paperclip"><span class="hide">파일</span></i> -->
	                                    </div>
	                                    <!-- 조회,작성일, 글쓴이 -->
	                                    <div class="order_list">
	                                        <dl>
	                                            <dt>글쓴이</dt>
	                                            <dd><c:out value="${list.registerName}"></c:out></dd>
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
<%-- 		                                <td>${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}</td> --%>
		                                <td>${((vo.pageIndex-1) * vo.pageUnit + status.count)}</td>
		                                <td class="subject">
		                                	<c:choose>
	                                    		<c:when test="${list.newAt eq 'Y' }">
	                                    			<span class="teg_new">new</span> <!-- 년 / 호 -->
	                                    		</c:when>
	                                    	</c:choose>
		                                	<span class="teg_notice"><c:out value="${list.typeName}" /></span> 
		                                	<a href="javascript:popup('${list.url}');"><c:out value="${list.title}" escapeXml="false"/></a>
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