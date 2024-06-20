<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@globals['gbls.kakao.key']" />&libraries=services,clusterer"></script>
<script>
	function fn_email_ch(val) {
		if(val == "0") $("#email2").val("");
		else $("#email2").val(val);
	}
	
	function fn_edit(){
    	if(fn_validation_check($('#cmmnForm'))) {
    		if($("input[name='paramKey5']:checked").val() != "Y") {
    			alert("개인정보보유 및 이용기간 동의를 해주세요.");
    			return;
    		}
    		var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm('문의 하시겠습니까?')) {
				$("#paramKey1").val($("#email1").val()+"@"+$("#email2").val());
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
    	}
    }
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
	<form:hidden path="paramKey1"/>
	<div class="cont_wrap">
		<div class="cont_each">
			<div class="board_write">
				<dl>
					<dt>성명</dt>
					<dd>
						<input type="text" id="paramKey2" name="paramKey2" title="이름을 입력하세요." style="width:200px;" vali-text="이름을 입력해주새요.">
					</dd>
				</dl>
				<dl>
					<dt>이메일</dt>
					<dd>
						<div class="email_area">
							<input type="text" name="email1" id="email1" title="이메일 아이디를 입력하세요" vali-text="이메일을 입력해주새요.">
							<span class="t">@</span>
							<input type="text" name="email2" id="email2" title="이메일 주소를 입력하세요." vali-text="이메일을 입력해주새요.">
							<select title="이메일 주소를 직접 선택하세요." onchange="fn_email_ch(this.value);">
								<option value="0">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
					</dd>
				</dl>
				<dl>
					<dt>제목</dt>
					<dd>
						<input type="text" id="paramKey3" name="paramKey3" style="width:100%;" title="제목을 입력하세요." vali-text="제목을 입력해주새요.">
					</dd>
				</dl>
				<dl>
					<dt>문의내용</dt>
					<dd>
						<div class="textarea_area">
							<textarea id="paramKey4" name="paramKey4" rows="10" title="내용을 입력하세요" vali-text="내용을 입력해주새요."></textarea>
						</div>
					</dd>
				</dl>
				<dl>
					<dt>첨부파일</dt>
					<dd>
						<div class="filebox bs3-primary">
							<c:out value="${cFn:onUserFileInclude('fileTable1', 'fileDataList1', 1, '', 25, 'MB', fileList1)}" escapeXml="false"/>
<!-- 							<input class="upload-name" value="파일선택" disabled="disabled" title="파일을 선택해주세요."> -->
<!-- 							<label for="ex_filename" type="button">첨부파일</label> -->
<!-- 							<input type="file" id="ex_filename" class="upload-hidden"> -->
						</div>
					</dd>
				</dl>
			</div>
		</div>
		<!-- cont_each -->
		<div class="cont_each">
			<div class="center_tit">개인정보보유 및 이용기간 <span class="r">*</span></div>
			<div class="agree_textarea">
				<div class="scroll">
					원활한 상담 진행을 위해 성명, 이메일을 수집합니다. <br>
					이용목적: 개인 정보는 문의를 하신 분들에게 답변을 드리기 위한 목적으로 수집합니다.<br>
					수집항목: 성명, 이메일<br>
					수집된 개인정보는 암호화되어 보관하며, 문의 글 등록 처리목적으로만 사용됩니다.<br>
				</div>
				<div class="agree_chk_wrap">
					<span>개인정보 수집 및 이용 목적에 동의합니다.</span>
					<span class="radio_form"><input type="radio" id="agree_true" name="paramKey5" value="Y" vali-text="개인정보보유 및 이용기간 동의를 선택해주세요."><label for="agree_true">동의</label></span>
					<span class="radio_form"><input type="radio" id="agree_false" name="paramKey5" value="N" vali-text="개인정보보유 및 이용기간 동의를 선택해주세요."><label for="agree_false">미동의</label></span>
				</div>
			</div>
			<div class="center_txt_wrap">문의사항에 대한 답변은 작성하신 E-mail로 회신 드리오니, 주로 사용하시는 E-mail로 문의주시기 바랍니다.</div>
			<div class="btn_center_area">
				<button class="btn_blue large" type="button" onclick="fn_edit();">문의하기</button>
			</div>
		</div>
	</div>
</form:form>
</body>
