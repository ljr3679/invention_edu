<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<c:forEach items="${resultList}" var="list" varStatus="status" >
	<li>
		<div class="box">
			<div class="img_wrap">
				<div class="img_box">
					<div class="inner_box"><img src="/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do" alt="${list.attachName}" onerror="this.src='/images/home/kor/user/judge/noimg.jpg'"></div>
				</div>
			</div>
			<div class="text_box">
				<div class="title"><c:out value="${list.title}"  escapeXml="false"/></div>
				<div class="info_list">
					<ul class="list">
						<li>
							<c:out value="${list.typeName}" />
							<c:if test="${not empty list.winner}"><c:out value=" - ${list.winner}"/></c:if>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="btn_wrap">
			<a href="javascript:void(0);" onclick="fn_edit('${list.no}');" class="view_btn">
				<span class="text">발명내용 상세보기</span>
			</a>
		</div>
	</li>
</c:forEach>

<c:choose>
	<c:when test="${not empty resultList}">
		<script type="text/javascript">
			$('#not_empty_box').show();
			$('#empty_box').hide();
			
			<c:choose>
				<c:when test="${paginationInfo.currentPageNo eq paginationInfo.lastPageNo}">
					$('#not_empty_paging').hide();
				</c:when>
				<c:otherwise>
					$('#not_empty_paging').show();
				</c:otherwise>
			</c:choose>
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$('#empty_box').show();
			$('#not_empty_box').hide();
			$('#not_empty_paging').hide();
		</script>
	</c:otherwise>
</c:choose>
