<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript">
	function fn_cancel() {
		/* $('#idx2').remove(); */
		$('#act2').remove();
		$('#cmmnForm').attr('action', '${vo.selfPath}servey_list.do');
		$('#cmmnForm').submit();
	}
	
	function fn_view(keyArr) {
		$('#addBody').html('');
		fn_cmmn_ajax('${vo.selfPath}survey_text.ajax', false, {'keyArr':keyArr}, 'json', function(res) {
			if(res) {
				var result = res.result;
				
				switch (result) {
					case '200':
						var list = res.list;
						var txt = '';
						for(var i=0; i<list.length; i++) {
							var data = list[i];
							
							txt += '<tr>';
							txt += '	<td>'+(i+1)+'</td>';
							txt += '	<td>';
							txt += '		'+data.answer;
							txt += '	</td>';
							txt += '<tr/>';
						}
						
						$('#addBody').html(txt);
						fn_layer_open();
						break;
					case '400': alert(res.msg); break;
					case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
				}
			} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
		});
	}
	
	function fn_print() {
		window.print();
	}
	
	function fn_excel_download() {
		$('#cmmnForm').unbind();
		$('#cmmnForm').attr('action', '${vo.selfPath}survey_total_excel.do');
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="idx2"/>
<form:hidden path="act"/>
<form:hidden path="act2"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchKeyword"/>
<div class="clearfix">
	<div class="fr">
		<a href="javascript:void(0);" onclick="fn_excel_download();" class="fr_btn">엑셀저장</a>
		<a href="javascript:void(0);" onClick="fn_print();" class="fr_btn">인쇄하기</a>
	</div>
</div>
	<div class="caption_title">·설문내용</div>
	<table class="board_write basic">
		<colgroup>
			<col style="width:100%;">
		</colgroup>
		<tbody>
		<c:forEach items="${resultList}" var="list" varStatus="status">
		<tr>
			<th scope="row"><c:out value="${status.count}. ${list.surveyTitle}"/></th>
		</tr>
		<tr>
			<td>
				<c:choose>
					<c:when test="${list.surveyType.trim() eq 'A'}">
						<c:set var="surveyTextArr" value="${cFn:textSplitor2(list.surveyText, 'g')}"/>
						<c:forEach items="${surveyTextArr}" var="item" varStatus="status2">
							<c:set var="data" value="answer${status2.count}"/>
							<input type="radio" <c:if test="${list.answerTypeA eq status2.count}">checked="checked"</c:if> disabled="disabled"/><span style="margin: 0 10px 0 5px;"><c:out value="${item}"/></span><span style="margin: 0 10px 0 0; color: red;"><c:out value="[${list[data]}]"/></span>
						</c:forEach>
					</c:when>
					<c:when test="${list.surveyType.trim() eq 'B'}">
						<a href="javascript:void(0);" onclick="fn_view('${list.noArr}');" class="fr_btn">답변보기</a>
					</c:when>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="btn_wrap">
		<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">이전</a>
	</div>
	
	<!-- Start : layer-popup content -->
	<div id="layer" class="layer-wrap">
	    <div class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts" style="width: 800px;">
	                <!--content //-->
	                <h1 class="pop-layer-title">- 설문조사  -</h1>
	                <div>
	                	<table class="board_list th_bgc">
							<colgroup>
								<col style="width:10%;">
								<col style="width:90%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">답변</th>
								</tr>
							</thead>
							<tbody id="addBody">
							</tbody>
						</table>
	                </div>
	                <div class="btn-r">
	                    <a href="javascript:void(0);" onClick="fn_layer_close();" class="btn-layerClose">닫기</a>
	                </div>
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
</form:form>
</body>