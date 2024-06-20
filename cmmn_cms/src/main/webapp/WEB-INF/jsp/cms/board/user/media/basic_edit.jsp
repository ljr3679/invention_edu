<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_secret_change(obj) {
		if($(obj).prev().val() == 'Y') {
			$(obj).prev().prev().hide();
			$(obj).prev().val('N');
			$(obj).html('변경하기');
		} else {
			$(obj).prev().prev().show();
			$(obj).prev().val('Y');
			$(obj).html('취소');	
		}
	}
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
		});
		
		if(fn_validation_check($('#cmmnForm'), fn_custom_vali)) {
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg+' 하시겠습니까?')) {
				$('#cmmnForm').attr('method', 'post');
				$('#cmmnForm').attr('action', '${vo.selfPath}board_edit.act');
				$('#cmmnForm').submit();
			}	
		}
	}
	
	function fn_custom_vali(obj, index) {
		if($(obj).attr('name') == 'fileVali') {
			if($('#fileTable').find('tr').length == 0) {
				return false;
			}
		}
		return true;
	}
	
	function fn_cancel() {
		if($('#act2').val() == 'detail') {
			$('#act').val('detail');
		} else {
			$('#idx').remove();	
			$('#act').remove();
			$('#act2').remove();
		}
		$('#cmmnForm').attr('action', '${vo.selfPath}board.do');
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>
<script>
function fn_cate_select(id1, id2, select) {
	var data = {'value': $('#'+id1).val(), 'select':select};
	fn_cmmn_ajax('/cmsManager/cms/board/cate.ajax', true, data, 'text', function(result) {
		if(result) {
			$('#'+id2).css('display', '');
			$('#'+id2).html(result);
			$('#'+id2).select2();
		} else {
			$('#'+id2).html('');
			if($('#'+id2).css('display') != 'none') {
				$('#'+id2).select2('destroy');
				$('#'+id2).css('display', 'none');
			}
		}
	}, true);
}
</script>

<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="get" enctype="multipart/form-data">
<input type="hidden" name="menuPos" value="${menuPos}"/>
<form:hidden path="act"/>
<form:hidden path="act2"/>
<form:hidden path="idx"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchDate1"/>
<form:hidden path="searchDate2"/>
<form:hidden path="searchDate3"/>
<form:hidden path="searchDate4"/>
<form:hidden path="searchDate5"/>
<form:hidden path="searchDate6"/>
<form:hidden path="searchDate7"/>
<form:hidden path="searchDate8"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchValue3"/>
<form:hidden path="searchValue4"/>
<form:hidden path="searchValue5"/>
<form:hidden path="searchValue6"/>
<form:hidden path="searchValue7"/>
<form:hidden path="searchValue8"/>
<form:hidden path="searchValue9"/>
<form:hidden path="searchValue10"/>
<form:hidden path="searchKeyword"/>
<input type="hidden" name="paramKey1" value="Y" />
<input type="hidden" name="paramKey2" value="${resultData.imptStartDate}" />
<input type="hidden" name="paramKey3" value="${resultData.imptEndDate}" />
<input type="hidden" name="paramKey33" value="${resultData.answer}" />
<input type="hidden" name="paramKey35" value="${resultData.cnt}" />
<div class="cont">
	<div class="writing_area">
		<table class="board_write">
			<colgroup>
				<col style="width: 20%;">
				<col style="width: 80%;">
			</colgroup>
			<tbody>
				<c:forEach items="${boardData.listFields}" var="list" varStatus="status">
				<c:if test="${list ne 'no' and list ne 'useAt' and list ne 'cnt'}">
				<tr>
					<th scope="row">
						<span class="text">
							<c:out value="${boardData.listTitles[status.index]}" escapeXml="false"/>
							<c:if test="${boardData.listValis[status.index] eq 'Y'}"><img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></c:if>
						</span>
					</th>
					<td>
						<c:choose>
							<c:when test="${list.indexOf('register') != -1}">
								<c:choose>
									<c:when test="${empty resultData and not empty usrSession}">
										<c:out value="${usrSession.name}"/>
										<input type="hidden" name="writer" value="${usrSession.name}"/>
									</c:when>
									<c:when test="${empty resultData and empty usrSession}"><input type="text" class="inp_01 vali" name="writer" value="" vali-text="작성자를 입력해주세요."/></c:when>
									<c:otherwise>
										<c:out value="${resultData.writer}"/>
										<input type="hidden" name="writer" value="${usrSession.name}"/>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${list.indexOf('regDate') != -1}">
								<c:choose>
									<c:when test="${empty resultData}">
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
										<input type="text" name="paramKey36" class="datepicker unCheck" style="width: 150px;" value="${sysYear}"/> 
									</c:when>
									<c:otherwise><input type="text" name="paramKey36" class="datepicker unCheck" style="width: 150px;" value="${resultData.get(list)}"/></c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${list.indexOf('attachFile') != -1}">
								<c:if test="${boardData.listValis[status.index] eq 'Y'}"><input type="hidden" id="fileVali" name="fileVali" class="vali check custom" vali-text="첨부파일을 업로드해주세요."/></c:if>
								<c:out value="${cFn:onFileInclude('fileTable', 'fileDataList1', boardData.attachCnt, 'attach', 50, 'MB', fileList)}" escapeXml="false"/>
							</c:when>
							<c:when test="${list.indexOf('title') != -1}">
								<input type="text" id="${list}" name="${list}" class="${boardData.listValis[status.index] eq 'Y' ?'vali' :'unCheck'}" vali-text="${boardData.listTitles[status.index]} 을(를) 입력해주세요." style="width: 100%;" value="${resultData.get(list)}"/>
							</c:when>
							<c:when test="${list.indexOf('textField') != -1}">
								<c:set var="paramKey" value="paramKey${fn:substring(list, 9, fn:length(list))+4}"/>
								<input type="text" id="${paramKey}" name="${paramKey}" class="${boardData.listValis[status.index] eq 'Y' ?'vali' :'unCheck'}" vali-text="${boardData.listTitles[status.index]} 을(를) 입력해주세요." style="width: 310px;" value="${resultData.get(list)}"/>
							</c:when>
							<c:when test="${list.indexOf('textareaField') != -1}">
								<c:set var="paramKey" value="paramKey${fn:substring(list, 13, fn:length(list))+19}"/>
								<textarea id="${paramKey}" name="${paramKey}" editor="Y" class="${boardData.listValis[status.index] eq 'Y' ?'vali' :'unCheck'}" vali-text="${boardData.listTitles[status.index]} 을(를) 입력해주세요." style="width: 100%; height: 250px;"><c:out value="${resultData.get(list)}" escapeXml="false"/></textarea>
							</c:when>
							<c:when test="${list.indexOf('dateField') != -1}">
								<c:set var="paramKey" value="paramKey${fn:substring(list, 9, fn:length(list))+24}"/>
								<input type="text" id="${paramKey}" name="${paramKey}" class="datepicker${boardData.listValis[status.index] eq 'Y' ?' vali' :' unCheck'}" vali-text="${boardData.listTitles[status.index]} 을(를) 선택해주세요." style="width: 150px;" value="${resultData.get(list)}"/>
							</c:when>
							<c:when test="${list.indexOf('dateArrayField') != -1}">	
								<c:set var="paramKeyStart" value="paramKey${fn:substring(list, 14, fn:length(list)) * 2 + 27}"/>
								<c:set var="paramKeyEnd" value="paramKey${fn:substring(list, 14, fn:length(list)) * 2 + 28}"/>
								<c:set var="itemStart" value="dateArrayField${fn:substring(list, 14, fn:length(list))}Start"/>
								<c:set var="itemEnd" value="dateArrayField${fn:substring(list, 14, fn:length(list))}End"/>
								<input type="text" id="${paramKeyStart}" name="${paramKeyStart}" class="datepicker${boardData.listValis[status.index] eq 'Y' ?' vali' :' unCheck'}" onChange="datepicker_start('${paramKeyStart}','${paramKeyEnd}')" vali-text="${boardData.listTitles[status.index]} 시작일 선택해주세요." style="width: 150px;" value="${resultData.get(itemStart)}"/>
									~
								<input type="text" id="${paramKeyEnd}" name="${paramKeyEnd}" class="datepicker${boardData.listValis[status.index] eq 'Y' ?' vali' :' unCheck'}" onChange="datepicker_end('${paramKeyStart}','${paramKeyEnd}')" vali-text="${boardData.listTitles[status.index]} 종료일 선택해주세요." style="width: 150px;" value="${resultData.get(itemEnd)}"/>
							</c:when>
							<c:when test="${list.indexOf('categoryField') != -1}">
								<c:set var="getCateOption" value="${list}Option"/>
								<c:set var="getCateChildren" value="${list}Children"/>
								<c:set var="cateIdx" value="${fn:substring(list, 13, fn:length(list))}"/>
								<c:set var="paramKey" value="paramKey4${(cateIdx-1) * 2}"/>
								<c:set var="paramKeyChild" value="paramKey4${(cateIdx-1) * 2 + 1}"/>
								<c:set var="cateList" value="${cateIdx eq 1 ?categoryList1 :cateIdx eq 2 ?categoryList2 :cateIdx eq 3 ?categoryList3 :categoryList4}"/>
								<c:set var="cateName" value="category${cateIdx}Name"/>
								
								<c:set var="categoryData" value="category${cateIdx}"/>
								<c:set var="categoryChildData" value="category${cateIdx}Child"/>
								<c:choose>
									<c:when test="${boardData[getCateOption] eq 'S'}">
										<select id="${paramKey}" name="${paramKey}" class="join_select1" style="min-width: 150px;" onChange="fn_cate_select('${paramKey}', '${paramKeyChild}');">
											<c:forEach items="${cateList}" var="cate" varStatus="cateStatus">
												<option value="${cate.no}" <c:if test="${cate.no eq resultData.get(categoryData)}">selected="selected"</c:if>><c:out value="${cate.dataName}"/></option>
											</c:forEach>
										</select>
										
										<c:if test="${boardData[getCateChildren] gt 0}">
										<select id="${paramKeyChild}" name="${paramKeyChild}" style="display: none; min-width: 150px;">
										</select>
										
										<script>fn_cate_select('${paramKey}', '${paramKeyChild}', '${resultData.get(categoryChildData)}');</script>
										</c:if>
									</c:when>
									<c:when test="${boardData[getCateOption] eq 'R'}">
										<c:forEach items="${cateList}" var="cate" varStatus="cateStatus">
											<span class="radio_each"> 
                                                <input type="radio" name="${paramKey}" id="${paramKey}_${cateStatus.count}" class="hide${boardData.listValis[status.index] eq 'Y' ?' vali' :' unCheck'}" value="${cate.no}" vali-text="${boardData[cateName]} 을(를) 선택해주세요." <c:if test="${cate.no eq resultData.get(categoryData)}">checked="checked"</c:if>> 
                                                <label for="${paramKey}_${cateStatus.count}"><span class="vradio"><span class="cir"></span></span><c:out value="${cate.dataName}"/></label>
                                            </span>
										</c:forEach>
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${list.indexOf('answerAt') ne -1}">
								<c:choose>
									<c:when test="${not empty resultData.get(list) and resultData.get(list) ne '<p>&nbsp;</p>'}">
										[답변완료]
									</c:when>
									<c:otherwise>
										[답변 미완료]
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
					</td>
				</tr>
				</c:if>
				</c:forEach>
				<c:if test="${boardData.secretAt eq 'Y'}">
				<tr>
					<th scope="row"><span class="text">비밀글</span></th>
					<td>
						<c:choose>
							<c:when test="${empty resultData or empty resultData.secret}">
								<input type="password" id="paramKey34" name="paramKey34" style="width: 150px;" class="unCheck"/>
								<input type="hidden" id="paramKey37" name="paramKey37" value="Y"/>
							</c:when>
							<c:otherwise>
								<input type="password" id="paramKey34" name="paramKey34" style="width: 150px; display: none;" class="unCheck"/>
								<input type="hidden" id="paramKey37" name="paramKey37" value="N"/>
								<a onclick="fn_secret_change(this);" class="common_btn type2 restore" style="cursor: pointer;">변경하기</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
	<div class="btn_area">
		<a class="btn_color" onclick="fn_edit();" style="cursor: pointer;"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
		<c:if test="${vo.act eq	'modify'}"><a onclick="fn_remove();" style="cursor: pointer;">삭제</a></c:if>
		<a onClick="fn_cancel();" style="cursor: pointer;">목록</a>
	</div>
</form:form>
</body>