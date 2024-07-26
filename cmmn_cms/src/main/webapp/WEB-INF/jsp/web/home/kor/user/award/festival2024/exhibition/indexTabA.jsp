<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- 대통령전시관일 때 시작-->
<div class="com_list_cont">
	<div class="com_list_box">
		<div class="title_area">
			<div class="title_box">
				<div class="sub_tit">대통령상</div>
				<div class="title"><c:out value="${resultData.title}"/></div>
				<div class="text"><c:out value="${resultData.winner}"/></div>
			</div>
		</div>
		<div class="con_area">
			<div class="video_box">
				<div class="video_inner">
					<iframe width="100%" height="100%" src="https://www.youtube.com/embed/${resultData.youtube}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
				</div>
			</div>
		</div>
		<div class="btn_wrap">
			<a href="javascript:void(0);" onclick="fn_edit('${resultData.no}');" class="view_btn">
				<span class="text">발명내용 상세보기</span>
			</a>
		</div>
	</div>
	<!-- //대통령전시관일 때 끝 -->
	<!-- 이외에 시작-->
	<div class="com_list_box2">
		<ul id="contentList" class="list">
		</ul>
	</div>
	<!-- //이외에 -->
</div>