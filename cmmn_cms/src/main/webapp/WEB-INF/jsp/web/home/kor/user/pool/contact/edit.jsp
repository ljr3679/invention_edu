<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript">
	function fn_edit(){
		if(formSubmit($('#cmmnForm'))) {
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg + ' 하시겠습니까?')) {
				$("#paramKey7").val($("#email1").val()+"@"+$("#email2").val());
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}		
    }

	function fn_leave(){
		if(formSubmit($('#cmmnForm'))) {
			var msg = "탈퇴";
			if(confirm('협력교원을 ' + msg + ' 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}leave.act');
				$('#cmmnForm').submit();
			}
		}		
    }	
	
	
	var countA = '${fn:length(subEdu)}';
	var countB = '${fn:length(subCareer)}';
	let countC = 0;
	function fn_add_Form(type){
		var html = "";
		if(type == 'B'){
			countB++;
			if(countB > 5) {
				alert("최대 5개까지 가능합니다");
				countB--;
				return false;
			}
			html += "<div class=\"education_from\">";
			html += "<div class=\"form\">";
			html += "	<span class=\"txt\">연도</span>";
			html += "	<input type=\"text\" class=\"tc\" name=\"paramKeyList5\"id=\"data5_"+countB+"\" style=\"width:80px;\" maxlength=\"4\" >";
			html += "</div>";
			html += "<div class=\"form prgm\">";
			html += "<span class=\"txt\">프로그램명</span>";
			html += "	<input type=\"text\" name=\"paramKeyList6\" id=\"data6_"+countB+"\">";
			html += "</div>";
			html += "<div class=\"form\">";
			html += "	<span class=\"txt\">차시</span>";
			html += "	<input type=\"text\" class=\"tc\" name=\"paramKeyList7\" id=\"data7_"+countB+"\" style=\"width:70px;\"> ";
			html += "</div>";
			html += "<button type=\"button\" onclick=\"fn_line_delete(this,'B');\" class=\"btn btn-default\">삭제</button>";
			html += "</div>";
			$("#addForm"+type).append(html);
		 	/* $('#data5_'+countB).attr("readonly",true);
			$('#data5_'+countB).datepicker({
				minViewMode: "years",
				format: "yyyy",
				language: "kr",
				autoclose: true
			});  */
		}else{
			countA++;
			if(countA > 5) {
				alert("최대 5개까지 가능합니다");
				countA--;
				return false;
			}
			html += "<div class=\"education_from\">";
			html += "<div class=\"form\">";
			html += "	<span class=\"txt\">학위</span>";
			html += "		<select name=\"paramKeyList2\" id=\"data2_"+countA+"\">";
			html += "			<option value=\"\">선택</option>";
			html += "			<option value=\"1\">학사</option>";
			html += "			<option value=\"2\">석사</option>";
			html += "			<option value=\"3\">박사</option>";
			html += "		</select>";
			html += "</div>";
			html += "<div class=\"form\">";
			html += "<span class=\"txt\">취득연도</span>";
			html += "	<input type=\"text\" class=\"major\" name=\"paramKeyList3\" id=\"data3_"+countA+"\" style=\"width:80px;\" maxlength=\"4\" > ";
			html += "</div>";
			html += "<div class=\"form\">";
			html += "	<span class=\"txt\">세부전공</span>";
			html += "	<input type=\"text\" class=\"major\" name=\"paramKeyList4\" id=\"data4_"+countA+"\" style=\"width:70px;\"> ";
			html += "</div>";
			html += "<button type=\"button\" onclick=\"fn_line_delete(this,'A');\" class=\"btn btn-default\">삭제</button>";
			html += "</div>";
			$("#addForm"+type).append(html);
			/* $('#data3_'+countA).attr("readonly",true);
			$('#data3_'+countA).datepicker({
				minViewMode: "years",
				format: "yyyy",
				language: "kr",
				autoclose: true
			});  */
		}
	}	
	
</script>
<script type="text/javascript" src="/js/home/kor/user/pool.js"></script>
<style type="text/css">
	.board_write dl {display:flex;margin-bottom:10px;}
	.board_write dl dt {width:270px;}
	.board_write dl dd {width:100%;}
	
	input[type="text"]{display:inline;	}	

</style>
<link rel="stylesheet" type="text/css" href="/css/home/kor/user/pool.css">

</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
	<form:hidden path="act"/>
	<form:hidden path="idx"/>	
	<form:hidden path="paramKey1"/>
	<form:hidden path="paramKey40"/>
	<form:hidden path="paramKey41"/>
	<div class="cont_wrap">
		<div class="cont_each">
			
			<div class="person-title info_form">정보동의 일자 </div>
			<div class="info_form_wrap v3">			
				<dl>
					<dt> 개인정보 제공동의</dt>
					<dd>
						<span class="txt">동의여부 : ${resultDataAgree.privacyYn}, 동의일시 : ${resultDataAgree.privacyDt}</span>
					</dd> 
				</dl>			
				<dl>
					<dt> 아동청소년 대상 범죄 전력 관련 서약</dt>
					<dd>
						<span class="txt">동의여부 : ${resultDataAgree.crimsYn}, 동의일시 :  ${resultDataAgree.crimsDt}</span>
					</dd> 
				</dl>				
			</div>	
			
			<div class="person-title info_form">기초정보  (<span class="imp">*</span>표기는 필수 입력 사항입니다.)</div>
			<div class="info_form_wrap">
				
					<dl>
						<dt><span class="imp">*</span> 아이디</dt>
						<dd>
							<span class="txt">${usrSession.id}</span>
							<input type="hidden" id="paramKey2" name="paramKey2"  value="${usrSession.id}"/>
						</dd> 
					</dl>
					<dl>
						<dt><span class="imp">*</span> 성명</dt>
						<dd><span class="txt">${usrSession.name}</span>
							<input type="hidden" id="paramKey3" name="paramKey3"  value="${usrSession.name}"/>
						</dd>
						
					</dl>
					<dl>
						<dt><span class="imp">*</span> 생년월일</dt>
						<dd><input type="text" maxlength="8" class="year" id="paramKey4" name="paramKey4" value="${resultData.birth}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')">&nbsp;&nbsp;&nbsp;(20230101 형식으로 입력해주세요.)</dd>
					</dl>
					<dl>
						<dt><span class="imp">*</span> 성별</dt>
						<dd>
							<div class="agree_chk_wrap">
								<span class="radio_form">
									<input type="radio" name="paramKey5" id="gender1" value="1" checked><label for="gender1">남자</label>
								</span>
								<span class="radio_form">
	                        		<input type="radio" name="paramKey5" id="gender2" <c:if test="${resultData.gender eq '2'}">checked</c:if> value="2"><label for="gender2">여자</label>
								</span>
							</div>
						</dd>
					</dl>
					<dl>
						<dt><span class="imp">*</span> 연락처(휴대폰)</dt>
						<dd>
							<div class="tel_form">
								<input type="text" style="width:100%" value="${resultData.phone}" name="paramKey6" maxlength="11" id="paramKey6" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
							</div> 
						</dd>
					</dl>
					<dl>
						<dt><span class="imp">*</span> 이메일 </dt>
						<dd>
							<div class="email_form">
								<input type="hidden" id="paramKey7" name="paramKey7" value="${resultData.email}"/>
								<input type="text" id="email1" name="email1" value="${resultData.email1}">
								<span>@</span>
								<input type="text" id="email2" name="email2" value="${resultData.email2}">
								<select onchange="fn_mail(this.value);" >
									<option value="">직접입력</option>
									<option value="naver.com"  <c:if test="${fn:indexOf(resultData.email,'naver.com') != -1}">selected="selected"</c:if>>naver.com</option>
									<option value="nate.com" <c:if test="${fn:indexOf(resultData.email,'nate.com') != -1}">selected="selected"</c:if>>nate.com</option>
									<option value="dreamwuz.com" <c:if test="${fn:indexOf(resultData.email,'dreamwuz.com') != -1}">selected="selected"</c:if>>dreamwuz.com</option>
									<option value="lycos.co.kr" <c:if test="${fn:indexOf(resultData.email,'lycos.co.kr') != -1}">selected="selected"</c:if>>lycos.co.kr</option>
									<option value="gmail.com" <c:if test="${fn:indexOf(resultData.email,'gmail.com') != -1}">selected="selected"</c:if>>gmail.com</option>
									<option value="daum.net" <c:if test="${fn:indexOf(resultData.email,'daum.net') != -1}">selected="selected"</c:if>>daum.net</option>
									<option value="yahoo.com" <c:if test="${fn:indexOf(resultData.email,'yahoo.com') != -1}">selected="selected"</c:if>>yahoo.com</option>
									<option value="Hotmail.net" <c:if test="${fn:indexOf(resultData.email,'Hotmail.net') != -1}">selected="selected"</c:if>>Hotmail.net</option>
								</select>
							</div>
						</dd>
					</dl>
					<dl>
						<dt><span class="imp">*</span> 소속(50자이내)</dt>
						<dd><input type="text" class="base" style="width:100%;" maxlength="50" id="paramKey8" name="paramKey8" value="${resultData.department}"></dd>
					</dl>
					<dl>
						<dt><span class="imp">*</span> 직위(50자이내)
						</dt>
						<dd><input type="text" class="base" style="width:100%;" maxlength="50"  id="paramKey9" name="paramKey9" value="${resultData.departmentPosition}"></dd> 
					</dl>
					<dl>
						<dt><span class="imp">*</span> 학력 &nbsp;&nbsp;&nbsp; <a href="javascript:void(0);" id="addBtn1" onclick="fn_add_Form('A');" class="btn btn-primary">추가</a></dt>
						<dd id="addFormA">
							<c:forEach varStatus="status" var="list" items="${subEdu}">
								<div class="education_from">
									<div class="form">
										<span class="txt">학위</span>
										<select name="paramKeyList2" id="data2_${status.count}">
											<option value="" <c:if test="${list.level eq '0'}">selected="selected"</c:if>>선택</option>
											<option value="1" <c:if test="${list.level eq '1'}">selected="selected"</c:if>>학사</option>
											<option value="2" <c:if test="${list.level eq '2'}">selected="selected"</c:if>>석사</option>
											<option value="3" <c:if test="${list.level eq '3'}">selected="selected"</c:if>>박사</option>
										</select>
									</div>
									<div class="form">
										<span class="txt">취득연도</span>
										<input type="text"  name="paramKeyList3" class="getYear" id="data3_${status.count}" maxlength="4" style="width:80px;" value="${list.year}" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="연도선택"> 
									</div>
									<div class="form">
										<span class="txt">세부전공</span>
										<input type="text" class="major" name="paramKeyList4" id="data4_${status.count}" style="width:70px;" value="${list.major}"> 
									</div>
									<button type="button" onclick="fn_line_delete(this,'A');" id="delBtn1" class="btn btn-default">삭제</button>
								</div>
							</c:forEach>
							
						</dd>
					</dl>				
				
				
			</div>
			<div class="person-title info_form">자격이력</div>
			<div class="info_form_wrap v2">
				<dl>
					<dt><span class="imp">*</span> 발명교사인증제 취득 여부</dt>
					<dd>
						<select name="paramKey10" id="paramKey10" style="width:250px;">
							<option value="">선택</option>
							<option value="2급" <c:if test="${resultData.acqAt eq '2급'}">selected="selected"</c:if>>2급</option>
							<option value="1급" <c:if test="${resultData.acqAt eq '1급'}">selected="selected"</c:if>>1급</option>
							<option value="명인(마스터)" <c:if test="${resultData.acqAt eq '명인(마스터)'}">selected="selected"</c:if>>명인(마스터)</option>
							<option value="취득 예정" <c:if test="${resultData.acqAt eq '취득 예정'}">selected="selected"</c:if>>취득 예정</option>
						</select>&nbsp;&nbsp;&nbsp;(취득한 가장 높은 등급을 선택해주세요.)
					</dd>
				</dl>
				<dl>
					<dt>발명교사 인증제 번호</dt> 
					<%-- <dd>
						<div class="nm_form">
							<input type="text" style="width:80px;" class="tc" maxlength="4" name="paramKey11" id="paramKey11" value="${resultData.acqAuthNum1}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
							<span>-</span>
							<input type="text" style="width:55px;" class="tc" maxlength="1" name="paramKey12" id="paramKey12" value="${resultData.acqAuthNum2}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> 
							<span>-</span>
							<input type="text" style="width:80px;" class="tc" maxlength="4" name="paramKey1" id="paramKey13" value="${resultData.acqAuthNum3}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
							<input type="hidden" id="acqAuthNum" name="acqAuthNum" value="${result.acq_auth_num}">
						</div>
					</dd> --%>
					<dd><input type="text" class="" readonly="readonly" value="${resultData.acqAuthNum1}" name="paramKey11" id="paramKey11" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl>  
				<dl>
					<dt>교사연구회 참여 이력</dt>
					<dd><input type="text" class="" readonly="readonly" value="${resultData.researchGroupHistory}" name="paramKey14" id="paramKey14" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl>
				<dl>
					<dt>직무 연수 참여 이력</dt>
					<dd><input type="text" class="" readonly="readonly" value="${resultData.jobTrainingHistory}" name="paramKey15" id="paramKey15" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl>			
			</div>
			<div class="person-title info_form">강의이력 </div>
			<div class="info_form_wrap v3">
				<dl>
					<dt>KIPA 교육 플랫폼 활용 교육 경력</dt>
					<dd><input type="text" class="" readonly="readonly" name="paramKey16" id="paramKey16" value="${resultData.kipaEduCareer}" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl>
				<dl>
					<dt>발명 교육 콘텐츠 개발 경력 <a href="javascript:void(0);" id="addBtn2" onclick="fn_add_Form('B');" class="btn btn-primary">추가</a></dt>
					<dd id="addFormB">
						<c:forEach varStatus="status" var="list" items="${subCareer}">
							<div class="education_from">
								<div class="form">
									<span class="txt">연도</span>
									<input type="text" name="paramKeyList5" class="tc" value="${list.year}" maxlength="4" id="data5_${status.count}" style="width:80px;" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="연도선택">
								</div>
								<div class="form prgm">
									<span class="txt">프로그램명</span>
									<input type="text" name="paramKeyList6" id="data6_${status.count}" value="${list.program}">
								</div>
								<div class="form">
									<span class="txt">차시</span>
									<input type="text" class="tc" name="paramKeyList7" id="data7_${status.count}" value="${list.turn}" style="width:70px;"> 
								</div>
								<button type="button" onclick="fn_line_delete(this,'B');" class="btn btn-default">삭제</button>
							</div>
						</c:forEach>
					</dd>
				</dl>
				<dl>
					<dt>기타 관련 경력</dt>
					<dd><textarea name="paramKey17" id="paramKey17" style="width:100%;" rows="10"><c:out value="${resultData.etcCareer}"/></textarea></dd>
				</dl>
				<dl>
					<dt>강의 가능 학교급</dt>
					<dd>
						<div class="agree_chk_wrap">
							<span class="check_form">
								<input type="checkbox" id="adviceSchoolType1" name="paramKey18" value="유치원" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'유치원') ne -1}">checked</c:if>>
								<label for="adviceSchoolType1">유치원</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="adviceSchoolType2" name="paramKey18" value="초등" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'초등') ne -1}">checked</c:if>>
								<label for="adviceSchoolType2">초등</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="adviceSchoolType3" name="paramKey18" value="중등" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'중등') ne -1}">checked</c:if>>
								<label for="adviceSchoolType3">중등</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="adviceSchoolType4" name="paramKey18" value="성인" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'성인') ne -1}">checked</c:if>>
								<label for="adviceSchoolType4">성인</label>
							</span>
						</div>
					</dd> 
				</dl>
				<dl>
					<dt>희망 활동 분야</dt>
					<dd>
						<div class="agree_chk_wrap">
							<span class="check_form">
								<input type="checkbox" id="classHistory1" name="paramKey19" value="원격 강의" <c:if test="${fn:indexOf(resultData.classHistory,'원격 강의') ne -1}">checked</c:if>>
								<label for="classHistory1">원격 강의</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="classHistory2" name="paramKey19" value="교사연구회 연수 참여" <c:if test="${fn:indexOf(resultData.classHistory,'교사연구회 연수 참여') ne -1}">checked</c:if>>
								<label for="classHistory2">교사연구회·연수 참여</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="classHistory3" name="paramKey19" value="자문 평가 위원" <c:if test="${fn:indexOf(resultData.classHistory,'자문 평가 위원') ne -1}">checked</c:if>>
								<label for="classHistory3">자문·평가 위원</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="classHistory4" name="paramKey19" value="연구 개발 위원" <c:if test="${fn:indexOf(resultData.classHistory,'연구 개발 위원') ne -1}">checked</c:if>>
								<label for="classHistory4">연구·개발 위원</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="classHistory5" name="paramKey19" value="기타" <c:if test="${fn:indexOf(resultData.classHistory,'기타') ne -1}">checked</c:if>>
								<label for="classHistory5">기타</label>
							</span>
						</div>
					</dd> 
				</dl>			

			
			</div>
	
		</div>
		<!-- cont_each -->
		<div class="form-group text-center box-footer">
			<c:choose>
				<c:when test="${vo.act eq 'modify'}">
					<button type="button" onclick="location.href='/';" class="btn btn-default" title="이전화면">이전화면</button>
					<button type="button" class="btn btn-primary" onclick="fn_edit()">정보수정</button>
					<button type="button" class="btn btn-default" onclick="fn_leave()" style="margin-left:100px;">협력교원탈퇴</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='/';" class="btn btn-default" title="이전화면">이전화면</button>
					<button type="button" class="btn btn-primary" onclick="fn_edit()">등록</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</form:form>
</body>
