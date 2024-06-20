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
		<div class="left_tit">
			월간 발명특허
			<span class="left_subtit">월간 발명특허 관련<br> 상세설명입니다.</span>
			<div class="past_play_btn_box slide1">
				<div class="control_panel">
					<button type="button" class="slick-prev slick-arrow prev">Previous</button>
					<span class="slick_bar"></span>
					<button type="button" class="slick-next slick-arrow next">Next</button>
				</div>
	        </div>
		</div>
		<div class="right_cont">
			<div class="slide_wrap">
				<ul class="past_silde_list" id="past_silde_list1">
					<c:forEach items="${resultList1}" var="list" varStatus="status">
						<li>
							<a style="cursor: pointer;" href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')" class="slide_pdf_link">
								<div class="img_box">
									<img src="/images/site/${fn:substring(list.imgReName, 0, fn:indexOf(list.imgReName, list.imgExtension)-1)}/${list.imgExtension}/loader.do" alt="${list.imgName}">
									<span class="icon_dwload"></span>
								</div>
								<div class="img_tit"><c:out value="${list.title}"  escapeXml="false"/></div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="cont_each">
		<div class="left_tit">
			잎세
			<span class="left_subtit">잎세 관련<br> 상세설명입니다.</span>
			<div class="past_play_btn_box slide2">
				<div class="control_panel">
					<button type="button" class="slick-prev slick-arrow prev">Previous</button>
					<span class="slick_bar"></span>
					<button type="button" class="slick-next slick-arrow next">Next</button>
				</div>
	        </div>
		</div>
		<div class="right_cont">
			<div class="slide_wrap">
				<ul class="past_silde_list" id="past_silde_list2">
					<c:forEach items="${resultList2}" var="list" varStatus="status">
						<li>
							<a style="cursor: pointer;" href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')" class="slide_pdf_link">
								<div class="img_box">
									<img src="/images/site/${fn:substring(list.imgReName, 0, fn:indexOf(list.imgReName, list.imgExtension)-1)}/${list.imgExtension}/loader.do" alt="${list.imgName}">
									<span class="icon_dwload"></span>
								</div>
								<div class="img_tit"><c:out value="${list.title}"  escapeXml="false"/></div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="cont_each">
		<div class="left_tit">
			두드림
			<span class="left_subtit">두드림 관련<br> 상세설명입니다.</span>
			<div class="past_play_btn_box slide3">
				<div class="control_panel">
					<button type="button" class="slick-prev slick-arrow prev">Previous</button>
					<span class="slick_bar"></span>
					<button type="button" class="slick-next slick-arrow next">Next</button>
				</div>
	        </div>
		</div>
		<div class="right_cont">
			<div class="slide_wrap">
				<ul class="past_silde_list" id="past_silde_list3">
					<c:forEach items="${resultList3}" var="list" varStatus="status">
						<li>
							<a style="cursor: pointer;" href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')" class="slide_pdf_link">
								<div class="img_box">
									<img src="/images/site/${fn:substring(list.imgReName, 0, fn:indexOf(list.imgReName, list.imgExtension)-1)}/${list.imgExtension}/loader.do" alt="${list.imgName}">
									<span class="icon_dwload"></span>
								</div>
								<div class="img_tit"><c:out value="${list.title}"  escapeXml="false"/></div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>

</form:form>
</body>