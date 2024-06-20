<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
	function fn_cancel() {
		$('#searchValue10').val('BACK');
        $('#idx').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
        $('#cmmnForm').submit();
    }
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="idx"/>
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue3"/>
<form:hidden path="searchValue10"/>
<div class="main_title"></div>
<div class="view_cont">
	<!-- 대통령상일 경우에만 .award 붙여주세요 (타이틀 앞 아이콘 유무 표시) -->
	<div class="title_box<c:if test="${resultData.parentRef eq 118}"> award</c:if>">
		<div class="title">
			<span class="ft_c"><c:out value="${resultData.parentName}"/></span>
			<span><c:out value="${resultData.title}"/></span>
		</div>
	</div>
	<div class="view_top">
		<div class="img_slide" id="youtubeBox"><iframe style="width: 100%;height: 100%;" src="https://www.youtube.com/embed/${resultData.youtube}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe></div>
		<div class="info_box">
			<div class="info_list">
				<ul class="list">
					<li class="icon01"><span class="tit">상격</span> 
						<c:choose>
							<c:when test="${not empty resultData.typeName }">
								<c:out value="${resultData.typeName}"/>
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</li>  
					<li class="icon02"><span class="tit">수상자</span> <c:out value="${resultData.winner}"/></li>
					<li class="icon03"><span class="tit">학교구분</span>
						<c:choose>
							<c:when test="${not empty resultData.schoolTypeName}">
								<c:out value="${resultData.schoolTypeName}"/>
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose> 
					</li>
					<li class="icon04"><span class="tit">학교</span> <c:out value="${resultData.schoolName}"/></li>
					<li class="icon05"><span class="tit">기술구분</span>
						<c:choose>
							<c:when test="${not empty resultData.techName}">
								<c:out value="${resultData.techName}"/>
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose> 
					</li>
					<li class="icon06"><span class="tit">지도교사</span> <c:out value="${resultData.teacher}"/></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="view_btm">
		<div class="text_list">
			<ul class="list">
				<li>
					<div class="box">
						<div class="title">발명동기</div>
						<div class="text">
							<c:out value="${resultData.intention}" escapeXml="false" />
						</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title">발명내용</div>
						<div class="text">
							<c:out value="${resultData.content}" escapeXml="false" />
						</div>
					</div>
				</li>
				<li>
					<div class="box">
						<div class="title">용도 및 효과</div>
						<div class="text">
							<c:out value="${resultData.purpose}" escapeXml="false" />
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="btn_wrap">
	<div class="btn_box fr">
		<a href="javascript:void(0);" onClick="fn_cancel();" class="btn_com">목록</a>
	</div>
</div>



</form:form>
</body>