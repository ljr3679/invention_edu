<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
	
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<div class="cont_wrap">
	<div class="cont_each">
		<div class="search_wrap slt3">
			<div class="base flex">
				<label for="searchValue2">구분</label>
				<select name="searchValue2" id="searchValue2">
					<option value="">전체</option>
					<c:forEach items="${type}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue2 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
				<label for="searchValue3">년도</label>
				<select name="searchValue3" id="searchValue3">
					<option value="">전체</option> 
					<c:forEach items="${year}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue3 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>
				<label for="searchValue4">지역</label>
				<select name="searchValue4" id="searchValue4">
					<option value="">전체</option> 
					<c:forEach items="${region}" var="list" varStatus="status">
						<option value="${list.no}"<c:if test="${vo.searchValue4 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
					</c:forEach>
				</select>

				<input type="text" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}" placeholder="검색어를 입력하세요." class="search_word">
				<button type="button" onClick="fn_cmmn_search();" class="btn_search">검색 <i class="xi-search"></i></button>
			</div>
		</div>
		<ul class="cont_dot_list">
			<li>
				미래의 발명 CEO 탐색
				<ul class="dash_list">
					<li>창의경제시대를 주도할 최고의 미래 CEO 양성 프로그램으로 신기술(3D 프린팅, IoT 기술) 습득 및 활용을 통한 창의적 문제 해결 관련 학생 활동</li>
				</ul>
			</li>
		</ul>
		<!-- 링크 -->
	<div class="flex_link">
		<ul class="item_list">
			<li class="item style03">
				<!-- <a href="http://iped.kr/a1905" target="_blank" class="box"> -->
				<!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52485&searchValue1=0&searchKeyword=&pageIndex=3 -->
				<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52485&searchValue1=0&searchKeyword=&pageIndex=3" class="box">
					<span class="icon"></span>
					<span class="title">교재</span>
					<span class="badge">바로가기</span>
				</a>
			</li>
			<li class="item style04">
				<!-- <a href="https://band.us/@ceo1" target="_blank" class="box"> -->
				<a href="https://band.us/@scinvent1" target="_blank" class="box">
					<span class="icon"></span>
					<span class="title">연구회 SNS</span>
					<span class="badge">바로가기</span>
				</a>
			</li>
		</ul>
	</div>
	<ul class="cont_dot_list">
		<li>
			과학교과 연계
			<ul class="dash_list">
				<li>정규 과학수업과 연계하여 사용할 수 있는 발명 교육 활동을 모은 프로그램으로 과학교육의 성과물이 발명으로 발전할 수 있도록 안내</li>
			</ul>
		</li>
	</ul>
	<!-- 링크 -->
	<div class="flex_link">
		<ul class="item_list">
			<li class="item style05">
				<!-- <a href="http://iped.kr/a1703" target="_blank" class="box"> -->
				<!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52478&searchValue1=0&searchKeyword=&pageIndex=4 -->
				<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52478&searchValue1=0&searchKeyword=&pageIndex=4" class="box">
					<span class="icon"></span>
					<span class="title">초등학교 교재</span>
					<span class="badge">바로가기</span>
				</a>
			</li>
			<li class="item style06">
				<!-- <a href="http://iped.kr/a1501" target="_blank" class="box"> -->
				<!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52470&searchValue1=0&searchKeyword=&pageIndex=5 -->
				<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52470&searchValue1=0&searchKeyword=&pageIndex=5" class="box">
					<span class="icon"></span>
					<span class="title">중학교 교재</span>
					<span class="badge">바로가기</span>
				</a>
			</li>
			<li class="item style07">
				<!-- <a href="http://iped.kr/a1704" target="_blank" class="box"> -->
				<!-- http://103.171.230.217/home/kor/board.do?menuPos=72&act=detail&idx=52479&searchValue1=0&searchKeyword=&pageIndex=3 -->
				<a href="/${vo.siteCode}/${vo.langCode}/board.do?menuPos=${cFn:arrIndexOf(menuIdxList, 'menu124')}&act=detail&idx=52479&searchValue1=0&searchKeyword=&pageIndex=3" class="box">
					<span class="icon"></span>
					<span class="title">고등학교 교재</span>
					<span class="badge">바로가기</span>
				</a>
			</li>
		</ul>
	</div>
	
	<div class="board_wrap web">
		<table>
			<colgroup>
				<col style="width: 15%;">
				<col style="width: 7%;">
				<col style="width: 8%;">
				<col style="width: 15%;">
				<col style="width: 7%;">
				<col style="width: 8%;">
				<col style="width: 12%;">
				<col style="width: 18%;">
			</colgroup>
			<thead>
				<tr>
					<th>구분</th>
					<th>년도</th>
					<th>지역명</th>
					<th>협력기관</th>
					<th>교원수</th>
					<th>학생수</th>
					<th>우수사례</th>
					<th>보고서 다운로드</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td><c:out value="${list.typeName}" /></td>
						<td><c:out value="${list.yearName}" /></td>
						<td><c:out value="${list.regionName}" /></td>
						<td><c:out value="${list.title}"  escapeXml="false"/></td>
						<td><c:out value="${list.teacherCnt}" /></td>
						<td><c:out value="${list.studentCnt}" /></td>
						<td><c:out value="${list.content}" escapeXml="false"/></td>
						<td>
							<c:choose>
								<c:when test="${not empty list.attachName}">
									<a style="cursor: pointer;" href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')" class="attach_file">
										<c:out value="${list.attachName}" />
									</a>
								</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- board mobile -->
	<div class="board_wrap mobile" style="margin: 40px 0 0;">
		<ul>
			<!-- 교사연구회 활동사항 -->
			<c:forEach items="${resultList}" var="list" varStatus="status">
				<li>
					<div class="teg">
						<span class="teg_new"><c:out value="${list.yearName}" /></span> <!-- 년 / 호 -->
						<span class="teg_area"><c:out value="${list.regionName}" /></span> <!-- 지역 -->
					</div>
					<div class="title">
						<div class="tit"><c:out value="${list.typeName}" /></div>
						<c:choose>
							<c:when test="${not empty list.attachName}">
								<a style="cursor: pointer;" href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')" class="attach_file">
									<c:out value="${list.attachName}" />
								</a>
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</div>
	
					<!-- 조회,작성일 등 -->
					<div class="order_list">
						<dl>
							<dt>협력기관</dt>
							<dd><c:out value="${list.title}" escapeXml="false"/></dd>
						</dl>
						<dl>
							<dt>교원수</dt>
							<dd><c:out value="${list.teacherCnt}" /></dd>
						</dl>
						<dl>
							<dt>학생수</dt>
							<dd><c:out value="${list.studentCnt}" /></dd>
						</dl>
						<dl>
							<dt>우수사례</dt>
							<dd><c:out value="${list.content}" escapeXml="false"/></dd>
						</dl>
					</div>
				</li>
			</c:forEach>
			</ul>
	</div>
	<!-- <div class="table_pagging">
		<ul>
			<li class="arrow"><a href="#" class="page_first">맨처음으로</a></li>
			<li class="arrow"><a href="#" class="page_prev">이전으로</a></li>
			<li><a href="#" class="active">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li class="arrow"><a href="#" class="page_next">다음으로</a></li>
			<li class="arrow"><a href="#" class="page_last">맨끝으로</a></li>
		</ul>
	</div> -->
	<div class="table_pagging">
		<span class="num">
			<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_cmmn_page" />
		</span>
		<form:hidden path="pageIndex" />
	</div>
	</div>
</div>
</form:form>
</body>