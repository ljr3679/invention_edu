<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_cancel() {
		$('#act').val('');
		$('#cmmnForm').attr('action', '${vo.selfPath}index.do');
		$('#cmmnForm').submit();
	}
	
	function fn_remove() {
		if(confirm('삭제 하시겠습니까?')) {
			$('#act').val('delete');
			$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
			$('#cmmnForm').submit();
		}
	}	

	function fn_edit() {
		if(formSubmit($('#cmmnForm'))) {

			if(confirm('저장 하시겠습니까?')) {
				$('#act').val('modify');
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}
	}	
	
	
	var countA = '${fn:length(subEdu)}';
	var countB = '${fn:length(subCareer)}';

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
			html += "<div class=\"form\">";
			html += "<span class=\"txt\">프로그램명</span>";
			html += "	<input type=\"text\" name=\"paramKeyList6\" id=\"data6_"+countB+"\">";
			html += "</div>";
			html += "<div class=\"form\">";
			html += "	<span class=\"txt\">차시</span>";
			html += "	<input type=\"text\" class=\"tc\" name=\"paramKeyList7\" id=\"data7_"+countB+"\" style=\"width:70px;\"> ";
			html += "</div>";
			html += "<button type=\"button\" onclick=\"fn_line_delete(this,'B');\" class=\"btn btn-del\">삭제</button>";
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
			html += "<button type=\"button\" onclick=\"fn_line_delete(this,'A');\" class=\"btn btn-del\">삭제</button>";
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
<script type="text/javascript" src="/js/home/kor/admin/teacher.js"></script>
<link rel="stylesheet" type="text/css" href="/css/home/kor/admin/teacher.css">
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex" />
<form:hidden path="searchValue1" />
<form:hidden path="searchValue2" /> 
<form:hidden path="searchValue3" />
<form:hidden path="searchValue4" />
<form:hidden path="searchValue5" />
<form:hidden path="searchKeyword" />
<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:auto;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row" colspan="2"><h4><span class="imp">*</span> 기초정보  (<span class="imp">*</span>표기는 필수 입력 사항입니다.)</h4></th>
		</tr>		
		<tr>
			<th scope="row"><span class="imp">*</span> 관리코드</th>
			<td>
			<c:out value="${code}"/>
			<input type="hidden" id="paramKey1" name="paramKey1" value="${resultData.no}"/>
			</td>
		</tr>	
		<tr>
			<th scope="row"><span class="imp">*</span> 아이디</th>
			<td>
			<c:out value="${resultData.memberId}"/>
			<input type="hidden" id="paramKey2" name="paramKey2"  value="${resultData.memberId}"/>
			</td>
		</tr>
		<tr>
			<th scope="row"><span class="imp">*</span> 성명</th>
			<td>
			<c:out value="${resultData.memberName}"/>
			<input type="hidden" id="paramKey3" name="paramKey3"  value="${resultData.memberName}"/>
			</td>
		</tr>
		<tr>
			<th scope="row"><span class="imp">*</span> 생년월일</th>
			<td>
			<input type="text" maxlength="8" class="year" id="paramKey4" name="paramKey4" value="${resultData.birth}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')"/>&nbsp;&nbsp;&nbsp;(20230101 형식으로 입력해주세요.)
			</td>
		</tr>		
		<tr>
			<th scope="row"><span class="imp">*</span> 성별</th>
			<td>
				<span class="radio_area">
					<input type="radio" name="paramKey5" id="paramKey51" value="1" checked/><label for="gender1">남자</label>
				</span>
				<span class="radio_area">
					<input type="radio" name="paramKey5" id="paramKey52" <c:if test="${resultData.gender eq '2'}">checked</c:if> value="2"/><label for="gender2">여자</label>
				</span>
			
			</td>
		</tr>		
		<tr>
			<th scope="row"><span class="imp">*</span> 연락처(휴대폰)</th>
			<td>
			<input type="text" style="width:100%" value="${resultData.phone}" name="paramKey6" maxlength="11" id="paramKey6" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"/>
			</td>
		</tr>
		<tr>
			<th scope="row"><span class="imp">*</span> 이메일</th>
			<td>
				<input type="hidden" id="paramKey7" name="paramKey7" value="${resultData.email}"/>
				<input type="text" id="email1" name="email1" value="${resultData.email1}"/>
				<span>@</span>
				<input type="text" id="email2" name="email2" value="${resultData.email2}"/>
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
			</td>
		</tr>
		<tr>
			<th scope="row"><span class="imp">*</span> 소속(50자이내)</th>
			<td>
			<input type="text" class="base" style="width:100%;" maxlength="50" id="paramKey8" name="paramKey8" value="${resultData.department}"/>
			</td>
		</tr>
		<tr>
			<th scope="row"><span class="imp">*</span> 직위(50자이내)</th>
			<td>
			<input type="text" class="base" style="width:100%;" maxlength="50"  id="paramKey9" name="paramKey9" value="${resultData.departmentPosition}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">학력<a href="javascript:void(0);" id="addBtn1" onclick="fn_add_Form('A');" class="btn btn-primary">추가</a></th>
			<td id="addFormA">
			
				<c:forEach varStatus="status" var="list" items="${subEdu}">
					<div class="education_from">
						<div class="form">
							<span class="txt">학위</span>
							<select name="paramKeyList2" id="data2_${status.count}">
								<option value="">선택</option>
								<option value="1" <c:if test="${list.level eq '1'}">selected="selected"</c:if>>학사</option>
								<option value="2" <c:if test="${list.level eq '2'}">selected="selected"</c:if>>석사</option>
								<option value="3" <c:if test="${list.level eq '3'}">selected="selected"</c:if>>박사</option>
							</select>
						</div>
						<div class="form">
							<span class="txt">취득연도</span>
							<input type="text"  name="paramKeyList3" class="getYear" id="data3_${status.count}" maxlength="4" style="width:80px;" value="${list.year}" placeholder="연도선택"/> 
						</div>
						<div class="form">
							<span class="txt">세부전공</span>
							<input type="text" class="major" name="paramKeyList4" id="data4_${status.count}" style="width:70px;" value="${list.major}"/> 
						</div>
						<button type="button" onclick="fn_line_delete(this,'A');" class="btn btn-del">삭제</button>
					</div>
				</c:forEach>			
			
			</td>
		</tr>
		<tr>
			<th scope="row" colspan="2"><h4>자격이력</h4></th>
		</tr>	
		<tr>
			<th scope="row">발명교사인증제 취득 여부</th>
			<td>
				<select name="paramKey10" id="paramKey10" style="width:250px;">
					<option value="">선택</option>
					<option value="2급" <c:if test="${resultData.acqAt eq '2급'}">selected="selected"</c:if>>2급</option>
					<option value="1급" <c:if test="${resultData.acqAt eq '1급'}">selected="selected"</c:if>>1급</option>
					<option value="명인(마스터)" <c:if test="${resultData.acqAt eq '명인(마스터)'}">selected="selected"</c:if>>명인(마스터)</option>
					<option value="취득 예정" <c:if test="${resultData.acqAt eq '취득 예정'}">selected="selected"</c:if>>취득 예정</option>
				</select>&nbsp;&nbsp;&nbsp;(취득한 가장 높은 등급을 선택해주세요.)
			</td>
		</tr>
		<tr>
			<th scope="row">발명교사 인증제 번호</th>
			<td>
			<%-- 
			<input type="text" style="width:80px;" class="tc" maxlength="4" name="paramKey11" id="paramKey11" value="${result.acqAuthNum1}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
			<span>-</span>
			<input type="text" style="width:55px;" class="tc" maxlength="1" name="paramKey12" id="paramKey12" value="${result.acqAuthNum2}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> 
			<span>-</span>
			<input type="text" style="width:80px;" class="tc" maxlength="4" name="paramKey13" id="paramKey13" value="${result.acqAuthNum3}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
			<input type="hidden" id="acqAuthNum" name="acqAuthNum" value="${result.acq_auth_num}">
			--%>			
			<input type="text" class="" readonly="readonly" value="${resultData.acqAuthNum1}" name="paramKey11" id="paramKey11" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"/>
			<input type="hidden" id="acqAuthNum" name="acqAuthNum" value="${resultData.acq_auth_num}">
			</td>
		</tr>
		<tr>
			<th scope="row">교사연구회 참여 이력</th>
			<td>
			<input type="text" class="" readonly="readonly" value="${resultData.researchGroupHistory}" name="paramKey14" id="paramKey14" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"/>
			</td>
		</tr>
		<tr>
			<th scope="row">직무 연수 참여 이력</th>
			<td>
			<input type="text" class="" readonly="readonly" value="${resultData.jobTrainingHistory}" name="paramKey15" id="paramKey15" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"/>
			</td>
		</tr>
		<tr>
			<th scope="row" colspan="2"><h4>강의이력</h4></th>
		</tr>
		<tr>
			<th scope="row">KIPA 교육 플랫폼 활용 교육 경력</th>
			<td>
			<input type="text" class="" readonly="readonly" name="paramKey16" id="paramKey16" value="${resultData.kipaEduCareer}" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"/>
			</td>
		</tr>
		<tr>
			<th scope="row">발명 교육 콘텐츠 개발 경력 <a href="javascript:void(0);" id="addBtn2" onclick="fn_add_Form('B');" class="btn btn-primary">추가</a></th>
			<td id="addFormB">
				<c:forEach varStatus="status" var="list" items="${subCareer}">
					<div class="education_from">
						<div class="form">
							<span class="txt">연도</span>
							<input type="text" name="paramKeyList5" class="dataList5" value="${list.year}" maxlength="4" id="data5_${status.count}" style="width:80px;"  placeholder="연도선택">
						</div>
						<div class="form">
							<span class="txt">프로그램명</span>
							<input type="text" name="paramKeyList6" id="data6_${status.count}" value="${list.program}">
						</div>
						<div class="form">
							<span class="txt">차시</span>
							<input type="text" class="tc" name="paramKeyList7" id="data7_${status.count}" value="${list.turn}" style="width:70px;"> 
						</div>
						<button type="button" onclick="fn_line_delete(this,'B');" class="btn btn-del">삭제</button>
					</div>
				</c:forEach>			
			</td>
		</tr>
		<tr>
			<th scope="row">기타 관련 경력</th>
			<td>
			<textarea name="paramKey17" id="paramKey17" style="width:100%;" rows="10"><c:out value="${resultData.etcCareer}"/></textarea>
			</td>
		</tr>		
		<tr>
			<th scope="row">강의 가능 학교급</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="paramKey181" name="paramKey18" value="유치원" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'유치원') ne -1}">checked</c:if>>
					<label for="adviceSchoolType1">유치원</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="paramKey182" name="paramKey18" value="초등" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'초등') ne -1}">checked</c:if>>
					<label for="adviceSchoolType2">초등</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="paramKey183" name="paramKey18" value="중등" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'중등') ne -1}">checked</c:if>>
					<label for="adviceSchoolType3">중등</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="paramKey184" name="paramKey18" value="성인" <c:if test="${fn:indexOf(resultData.adviceSchoolType,'성인') ne -1}">checked</c:if>>
					<label for="adviceSchoolType4">성인</label>
				</span>
			</td>
		</tr>			
		<tr>
			<th scope="row">희망 활동 분야</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="paramKey191" name="paramKey19" value="원격 강의" <c:if test="${fn:indexOf(resultData.classHistory,'원격 강의') ne -1}">checked</c:if>>
					<label for="classHistory1">원격 강의</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="paramKey192" name="paramKey19" value="교사연구회 연수 참여" <c:if test="${fn:indexOf(resultData.classHistory,'교사연구회 연수 참여') ne -1}">checked</c:if>>
					<label for="classHistory2">교사연구회·연수 참여</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="paramKey193" name="paramKey19" value="자문 평가 위원" <c:if test="${fn:indexOf(resultData.classHistory,'자문 평가 위원') ne -1}">checked</c:if>>
					<label for="classHistory3">자문·평가 위원</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="paramKey194" name="paramKey19" value="연구 개발 위원" <c:if test="${fn:indexOf(resultData.classHistory,'연구 개발 위원') ne -1}">checked</c:if>>
					<label for="classHistory4">연구·개발 위원</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="paramKey195" name="paramKey19" value="기타" <c:if test="${fn:indexOf(resultData.classHistory,'기타') ne -1}">checked</c:if>>
					<label for="classHistory5">기타</label>
				</span>			
			</td>
		</tr>					
	</tbody>
</table>
<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn">수정</a>
	<c:if test="${vo.act eq	'modify'}">
		<a href="javascript:void(0);" onclick="fn_remove();" style="cursor: pointer;" class="right btn delete">삭제</a>
	</c:if>		
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			

</body>
<!-- header end -->
