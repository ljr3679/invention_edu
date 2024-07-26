<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<script type="text/javascript">
	function fn_call_list(act) {
		if(act) $('#pageIndex').val(parseInt($('#pageIndex').val()) + 1);
		
		fn_cmmn_form_ajax('${vo.selfPath}inc/list.ajax', false, new FormData($('#cmmnForm')[0]), 'html', function(res) {
			if(res) $('#contentList').append(res);
		});
	}
	
	$(document).ready(function() {
		fn_call_list();
		$('#searchValue10').val('');
	});
</script>
<div class="sub_cont">
	<!-- awardCode01 : 02 -->
	<!-- awardCode2List : [Code(cdMngno=394, classMngno=51, cd=02, cd1=null, cd2=null, cdNm=국무총리상, cdNote=역대수상작 - 대한민국학생발명전시회(우수상) - 국무총리상, cdSort=2, etcSort=null, useYn=Y, inDt=Mon Aug 30 10:14:22 KST 2021, inId=admin, inName=null, inIdno=null), Code(cdMngno=395, classMngno=51, cd=03, cd1=null, cd2=null, cdNm=교육부장관상, cdNote=역대수상작 - 대한민국학생발명전시회(우수상) - 교육부장관상, cdSort=3, etcSort=null, useYn=Y, inDt=Mon Aug 30 10:14:52 KST 2021, inId=admin, inName=null, inIdno=null), Code(cdMngno=396, classMngno=51, cd=04, cd1=null, cd2=null, cdNm=과학기술정보통신부장관상, cdNote=역대수상작 - 대한민국학생발명전시회(우수상) - 과학기술정보통신부장관상, cdSort=4, etcSort=null, useYn=Y, inDt=Mon Aug 30 10:15:22 KST 2021, inId=admin, inName=null, inIdno=null), Code(cdMngno=397, classMngno=51, cd=05, cd1=null, cd2=null, cdNm=산업통상자원부장관상, cdNote=역대수상작 - 대한민국학생발명전시회(우수상) - 산업통상자원부장관상, cdSort=5, etcSort=null, useYn=Y, inDt=Mon Aug 30 10:15:53 KST 2021, inId=admin, inName=null, inIdno=null), Code(cdMngno=445, classMngno=51, cd=06, cd1=null, cd2=null, cdNm=특허청장상, cdNote=역대수상작 - 대한민국학생발명전시회(우수상) - 특허청장상, cdSort=6, etcSort=null, useYn=Y, inDt=Mon Sep 13 09:29:18 KST 2021, inId=admin, inName=null, inIdno=null), Code(cdMngno=446, classMngno=51, cd=07, cd1=null, cd2=null, cdNm=특별상, cdNote=역대수상작 - 대한민국학생발명전시회(우수상) - 특별상, cdSort=7, etcSort=null, useYn=Y, inDt=Mon Sep 13 09:30:01 KST 2021, inId=admin, inName=null, inIdno=null)] -->
	<div class="com_tab_cont tab-02 ">
		<style type="text/css">
		.tab_list div.on button {
		    color: #FFFFFF;
		    background-color: #004ea2;
		}
		.tab_list {width:1280px;margin:0 auto;overflow: auto;white-space:nowrap;}
		</style>
		<ul class="tab_container tab_list scroll-y">
		<!-- 우수상격 전시관 -->
			<li>
				<c:choose>
					<c:when test="${empty vo.searchValue3}">
						<div class="tab_btn_box on">
							<button type="button" class="tab_btn" onclick="fn_change_subTab('');">
								<span class="text">전체</span>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="tab_btn_box">
							<button type="button" class="tab_btn" onclick="fn_change_subTab('');">
								<span class="text">전체</span>
							</button>
						</div>
					</c:otherwise>
				</c:choose>
			</li>
			<c:forEach items="${categoryList2}" var="value" varStatus="status" >
				<li> 
					<c:choose>
						<c:when test="${vo.searchValue3 eq value.no}">
							<div class="tab_btn_box on">
								<button type="button" class="tab_btn" onclick="fn_change_subTab('${value.no}');">
									<span class="text"><c:out value="${value.dataName}"/></span>
								</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="tab_btn_box  ">
								<button type="button" class="tab_btn" onclick="fn_change_subTab('${value.no}');">
									<span class="text"><c:out value="${value.dataName}"/></span>
								</button>
							</div>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<div id="not_empty_box" class="com_list_cont" style="display: nonoe;">
		<div class="com_list_box2">
			<ul id="contentList" class="list">
			</ul>
		</div>
	</div>
	
	<div id="empty_box" class="btn_box" style="display: nonoe;">
		<p class="btn_com sty2">등록된 게시물이 없습니다.</p>
	</div>
	
	<div id="not_empty_paging" class="btn_box" style="display: nonoe;">
		<button type="button" id="listAppendTrigger" class="btn_com sty2" onclick="fn_call_list('act')">
			<i class="xi-plus-min"></i> 더보기
		</button>
	</div>
	
	<form:hidden path="pageIndex" />
</div>