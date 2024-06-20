<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>
	function fn_cancel() {
		$('#cmmnForm').attr('action', "${selfPath}index.do");
		$('#cmmnForm').submit();
	}
	
	function insert_education_survey() {
		if(fn_validation_check($('#cmmnForm'))) {
			if(confirm('제출하시겠습니까?')) {
				var html = '';
				var dumy = $('input[name=dumyList]');
				
				for(var i=1; i<=dumy.length; i++) {
					var type = $('input[name=typeList').eq(i-1).val();
					var idx = dumy.eq(i-1).val();
					
					var radioObjs = $('[name=examRadio'+idx+']:checked');  
					var textObjs = $('[name=examTx'+idx+']'); 
					var txt = '';
					
					switch (type) {
						case 'A':
							html += '<input type="hidden" name="paramKeyList2" value="'+radioObjs.val()+'" />';
							break;
						case 'B':
							html += '<input type="hidden" name="paramKeyList2" value="'+textObjs.val()+'" />';
							break;
							
					}
				}
				$('#addArea').append(html);
				$('#cmmnForm').attr('action', "${selfPath}survey_regist.act");
				$('#cmmnForm').submit();	
			}	
		}
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchKeyword"/>
<div id="addArea"></div>

<div class="survey_view">
		<div class="survey_info">
			<div class="survey_info_inner">
				<ul class="list">
					<li>
						<div class="box">
							<div class="title"><span class="tit">제목</span></div>
							<div class="text"><c:out value="${resultData.title}" escapeXml="false"/> </div>
						</div>
					</li>
					<li>
						<div class="box">
							<div class="title"><span class="tit">설문대상</span></div>
							<div class="text">
								<c:choose>
									<c:when test="${resultData.memberType eq 'A'}">회원</c:when>
									<c:when test="${resultData.memberType eq 'B'}">전체</c:when>
								</c:choose>
							</div>
						</div>
					</li>
					<li>
						<div class="box">
							<div class="title"><span class="tit">설문기간</span></div>
							<div class="text"><c:out value="${resultData.surveyStartDate}" /> ~ <c:out value="${resultData.surveyEndDate}" /></div>
						</div>
					</li>
					<li>
						<div class="box">
							<div class="title"><span class="tit">개요</span></div>
							<div class="text"><c:out value="${cFn:escapeXml(resultData.content)}" escapeXml="false"/></div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="survey_txt"><span class="red">*</span>표시는 필수 입력사항입니다.</div>

		<div class="qna_box">
			<ul class="list">
				<c:forEach items="${resultSubList}" var="list" varStatus="status">
					<input type="hidden" name="dumyList" value="${status.count}"/>
					<input type="hidden" name="paramKeyList1" value="${list.no}"/>
					<input type="hidden" name="typeList" value="${list.surveyType}"/>
					<li>
						<c:choose>
		                	<c:when test="${list.surveyType eq 'A'}">
		                		<input type="hidden" name="examTx${status.count}" value="-1"/>
								<c:set var="examText" value="${fn:split(list.surveyText,'[-g-]')}" />
								<div class="q_box"><c:out value="${status.count}. ${list.surveyTitle}"/> <span class="red">*</span></div>
								<div class="a_box">
									<ul class="list">
										<c:forEach items="${examText}" var="list2" varStatus="status2">
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp" id="radio${status.count}_${status2.count}" name="examRadio${status.count}" value="${status2.count}" vali-text="${status.count}번째 답을 선택해주세요.">
													<label for="radio${status.count}_${status2.count}"><span class="text"><c:out value="${list2}"/></span></label>
												</span>
											</li>
										</c:forEach>
									</ul>
								</div>
		                	</c:when>
		                	<c:when test="${list.surveyType eq 'B'}">
		                		<div class="q_box"><c:out value="${status.count}. ${list.surveyTitle}"/> <span class="red">*</span></div>
								<div class="a_box">
									<textarea id="inquery${status.count}" name="examTx${status.count}" cols="30" rows="10" placeholder="300자 이내로 작성해주세요." title="설문조사 주관식 답변을 입력해 주세요." style="resize: none" vali-text="${status.count}번째 설문을 입력해주세요." maxlength="300"></textarea>
									<input type="hidden" name="examRadio${status.count}" value="-1"/>
								</div>
		                	</c:when>
		                </c:choose>
	                </li>
				</c:forEach>
			</ul>
		</div>
	</div>
    <div class="board_btn_area">
		<button type="button" class="btn_blue" onclick="insert_education_survey();">제출</button>
		<button type="button" class="btn_base" onclick="fn_cancel();">취소</button>
	</div>
</form:form>
</body>
