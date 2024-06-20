<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@globals['gbls.kakao.key']" />&libraries=services,clusterer"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng("${resultList[0].latitute}", "${resultList[0].longitute}"), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	<c:forEach items="${resultList}" var="list" varStatus="status">
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: new kakao.maps.LatLng("${list.latitute}", "${list.longitute}")
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: "${list.title}" // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	</c:forEach>

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}

	function panTo(lat,lon) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(lat,lon);
	    map.setLevel(6);
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	} 	
	
	
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
	<div class="cont_wrap">
		<div class="cont_each">
			<div class="search_wrap">
				<div class="base flex">
					<label for="categori">지역</label>
					<select name="searchValue1" id="searchValue1">
						<option value="">전체</option>
						<c:forEach items="${areaList}" var="list" varStatus="status">
							<option value="${list.no}" <c:if test="${vo.searchValue1 eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
						</c:forEach>
					</select>
					<input type="text" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}" placeholder="검색어를 입력하세요." class="search_word">
					<button type="button" class="btn_search" onclick="fn_cmmn_search();">검색 <i class="xi-search"></i></button>
				</div>
				<div class="base flex">
					<div class="search_txt">* 검색하고자 하는 지역 선택 및 지도 확대 시, 정확한 위치 조회가 가능합니다.</div>
				</div>
			</div>
			<div class="map" id="map" style="width: 100%;">
<!-- 				<img src="/images/home/kor/user/common/test_map.jpg"> -->
			</div>
			<div class="table_top_nav">
				<div class="left_area page_num">
					<i class="xi-file-text-o"></i> 
					총 <span class="point_blue"><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###"/></span>개</div>
				<div class="right_area">
					<select name="searchValue2" id="searchValue2" onchange="fn_cmmn_search();">
						<option value="10" <c:if test="${vo.searchValue2 eq '10'}">selected="selected"</c:if>>10개씩보기</option>
						<option value="20" <c:if test="${vo.searchValue2 eq '20'}">selected="selected"</c:if>>20개씩보기</option>
						<option value="30" <c:if test="${vo.searchValue2 eq '30'}">selected="selected"</c:if>>30개씩보기</option>
					</select>
				</div>
			</div>
			<div class="board_wrap mobile">
				<ul>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<li>
							<div class="order_list" onClick="panTo('${list.latitute}','${list.longitute}');">
								<dl>
									<dt>지역</dt>
									<dd><c:out value="${list.regionName}"/></dd>
								</dl>
								<dl>
									<dt>발명교육센터명</dt>
									<dd><c:out value="${list.title}" escapeXml="false"/></dd>
								</dl>
								<dl>
									<dt>소속지원청</dt>
									<dd><c:out value="${list.agency}"/></dd>
								</dl>
								<dl>
									<dt>주소</dt>
									<dd>(${list.zipcode})&nbsp;${list.address}&nbsp;${list.addressDetail}</dd>
								</dl>
								<dl>
									<dt>전화번호</dt>
									<dd><c:out value="${cFn:decrypt(list.phone)}"/></dd>
								</dl>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="board_wrap web">
				<table>
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="20%">
						<col width="auto">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>지역</th>
							<th>발명교육센터명</th>
							<th>소속지원청</th>
							<th>주소</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr>
								<td><c:out value="${list.regionName}"/></td>
								<td><a href="javascript:void(0);" onClick="panTo('${list.latitute}','${list.longitute}');"><c:out value="${list.title}" escapeXml="false"/></a></td>
								<td><c:out value="${list.agency}"/></td>
								<td>(${list.zipcode})&nbsp;${list.address}&nbsp;${list.addressDetail}</td>
								<td><c:out value="${cFn:decrypt(list.phone)}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="table_pagging">
					<span class="num">
						<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_cmmn_page" />
					</span>
					<form:hidden path="pageIndex" />
				</div>
			</div>
		</div>
	</div>
</form:form>
</body>
