<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
		});
		if(fn_validation_check($('#cmmnForm'))) {
			if(confirm('저장 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}
	}
	
	function fn_email_check(email) { 
		if(!/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g.test(email)) return false;
	    else return true;
	}
	
	/* function custom_check(obj, index) {
		var id = $(obj).attr('id');
		switch (id) {
			case 'check4':
				return fn_email_check($('#paramKey7').val());
				break;
		}
		
		return true;
	} */
	function fn_cancel(){
        $('#act').remove();
        $('#idx').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
        $('#cmmnForm').submit();
    }
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="searchValue1" /> <!-- 메뉴명 -->
<form:hidden path="searchValue2" /> <!-- 메뉴명 -->
<form:hidden path="searchValue3" /> <!-- 메뉴명 -->
<form:hidden path="searchKeyword" /> <!-- 메뉴명 -->
<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">문의일자</th>
			<td><c:out value="${resultData.regDate}" /></td>
		</tr>
		<tr>
			<th scope="row">확인상태</th>
			<td>
				<input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData.useAt eq 'Y' or vo.act eq 'regist'}">checked="checked"</c:if> value="Y" vali-text="확인상태를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">확인</label>
				<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="확인상태를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">미확인</label>
			</td>
		</tr>
		<tr>
			<th scope="row">성명</th> 
			<td>
				<c:out value="${resultData.name}" />
				<%-- <input type="text" id="paramKey4" name="paramKey4" vali-text="성명을 입력해주세요." value="${resultData.name}" style="width: 100%;"/> --%>
			</td>
		</tr>
		<tr>
			<th scope="row">이메일</th>
			<td>
				<c:out value="${cFn:decrypt(resultData.email)}" />	
				<%-- <input type="text" id="paramKey7" name="paramKey7" vali-text="이메일을 입력해주세요." value="${cFn:decrypt(resultData.email)}" style="width: 100%;"/>
				<input type="hidden" id="check4" name="check4" class="check custom" vali-text="이메일 양식을 확인해주세요."/> --%>
			</td>
		</tr>
		<tr>
			<th scope="row"><img src="/images/cmmn/star.png" class="th_star" alt="필수 입력">구분</th>
			<td>
				<c:choose>
					<c:when test="${resultData.typeAt eq 'A'}">
						<c:out value="발명교육포털사이트" />
					</c:when>
					<c:when test="${resultData.typeAt eq 'B'}">
						<c:out value="대한민국학생발명전시회" />
					</c:when>
					<c:when test="${resultData.typeAt eq 'C'}">
						<c:out value="대한민국 학생창의력 챔피언대회" />
					</c:when>
					<c:when test="${resultData.typeAt eq 'D'}">
						<c:out value="YIP(Young Invenfors Program)" />
					</c:when>
					<c:otherwise>
						<c:out value="-" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td>
				<c:out value="${resultData.title}" />
				<%-- <input type="text" id="paramKey2" name="paramKey2" vali-text="제목을 입력해주세요." value="${resultData.title}" style="width: 100%;"/> --%>
			</td>
		</tr>
		<tr>
			<th scope="row">문의 내용</th>
			<td style="width: 100%; height: 300px; resize: none;">
				<c:out value="${resultData.content}" escapeXml="false" />
				<%-- <textarea id="paramKey3" name="paramKey3" editor="Y" style="width: 100%; height: 300px; resize: none;" vali-text="문의 내용을 입력해주세요."><c:out value="${resultData.content}" escapeXml="false"/></textarea> --%>
			</td>
		</tr>
		<tr>
			<th scope="row">첨부파일</th>
			<td>
				<c:choose>
					<c:when test="${not empty fileList1}">
						<c:forEach items="${fileList1}" var="file" varStatus="status">
							<p><a href="javascript:void(0);" id="file${status.count}" onclick="cmmn_file_down('${file.attachName}','${file.attachReName}')">${file.attachName}</a></p>
						</c:forEach>
					</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
				
				<%-- <input type="hidden" id="fileVali1" name="fileVali1" class="unCheck" />
				<c:out value="${cFn:kssFileInclude('fileDataList1', 1, 'attach', 100, 'MB', true, fileList1)}" escapeXml="false"/> --%>
				<!-- <div style="margin-top:5px; ">
                    <label for="fileVali1" style="color: gray; font-size: 14px;">※ 첨부파일은 최대 1개 5MB이하 jpg, png, jpeg, gif, tiff, bmp 확장자만 등록 가능합니다.</label>	
                </div> -->
			</td>
		</tr>
	</tbody>
</table>

<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn">저장</a>
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->
