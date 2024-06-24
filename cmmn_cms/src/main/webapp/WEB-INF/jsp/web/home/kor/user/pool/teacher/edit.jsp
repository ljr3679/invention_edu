<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript">

var countRegion = '${fn:length(subArea)}';

function fn_add_Region_Form() {
    if (countRegion >= 3) {
        alert("최대 3개까지 가능합니다");
        return false;
    }

    countRegion++;

    var html = '';
    html += '<div style="width:100%" class="region_form" id="region_form_' + countRegion + '" data-index="' + countRegion + '">';
    html += '    <div class="form">';
    html += '        <div class="region_chk_wrap">';
    html += '                <label for="region_province_' + countRegion + '">순위 ' + countRegion + ': </label>';
    html += '                <select style="width:40%" id="region_province_' + countRegion + '" name="paramKeyList7" onchange="fetchCities(' + countRegion + ')">';
    html += '                    <option value="">도 선택</option>';
    html += '                </select>';
    html += '                <select style="width:40%" id="region_city_' + countRegion + '" name="paramKeyList8">';
    html += '                    <option value="">시 선택</option>';
    html += '                </select>';
    html += '    <button type="button" onclick="fn_line_delete1(' + countRegion + ');" class="btn btn-default">삭제</button>';
    html += '        </div>';
    html += '    </div>';
    html += '</div>';

    $("#addFormRegion").append(html);
    fetchProvinces(countRegion);
}

function fn_line_delete1(index) {
    // 폼 삭제
    $("#region_form_" + index).remove();

    // 인덱스 재정렬
    $(".region_form").each(function(i) {
        var newIndex = i + 1;
        $(this).attr("id", "region_form_" + newIndex);
        $(this).attr("data-index", newIndex);
        $(this).find("label").attr("for", "region_province_" + newIndex).text("순위 " + newIndex + ": ");
        $(this).find("select[name='paramKeyList7']").attr("id", "region_province_" + newIndex).attr("name", "paramKeyList7").attr("onchange", "fetchCities(" + newIndex + ")");
        $(this).find("select[name='paramKeyList8']").attr("id", "region_city_" + newIndex).attr("name", "paramKeyList8");
        $(this).find("button").attr("onclick", "fn_line_delete1(" + newIndex + ")");
    });

    countRegion = $(".region_form").length;
}

function fetchProvinces(index) {
    fetch("https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000")
        .then(response => response.json())
        .then(data => {
            var provinceSelect = $("#region_province_" + index);
            provinceSelect.empty();
            provinceSelect.append(new Option("도 선택", ""));
            data.regcodes.forEach(province => {
                provinceSelect.append(new Option(province.name, province.code));
            });

            // 기존 데이터 선택
            var existingProvince = $("#region_province_" + index).data("existingProvince");
            if (existingProvince) {
                $("#region_province_" + index).val(existingProvince).change();
            }
        })
        .catch(error => console.error('Error:', error));
}

function fetchCities(index) {
    var provinceCode = $("#region_province_" + index).val();
    if (provinceCode) {
        var pattern = provinceCode.substring(0, 2) + "*00000";
        var url = 'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=' + pattern;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                var citySelect = $("#region_city_" + index);
                citySelect.empty(); // 기존 옵션 제거
                citySelect.append(new Option("시 선택", ""));
                data.regcodes.forEach(city => {
                    if (city.code.substring(2, 5) !== "000") { // 시/구 코드 필터링
                        citySelect.append(new Option(city.name, city.code));
                    }
                });

                // 기존 데이터 선택
                var existingCity = $("#region_city_" + index).data("existingCity");
                if (existingCity) {
                    $("#region_city_" + index).val(existingCity);
                }
            })
            .catch(error => console.error('Error:', error));
    }
}


















function fetchProvincesForMain() {
    fetch("https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000")
        .then(response => response.json())
        .then(data => {
            var provinceSelect = $("#paramKey9");
            provinceSelect.empty();
            provinceSelect.append(new Option("도 선택", ""));
            data.regcodes.forEach(province => {
                provinceSelect.append(new Option(province.name, province.code));
            });

            // 기존 선택된 도가 있다면 설정
            var existingProvince = $("#paramKey9").attr("data-existing-province");
            if (existingProvince) {
                provinceSelect.val(existingProvince).change();
            }
        })
        .catch(error => console.error('Error:', error));
}

function fetchCitiesForMain() {
    var provinceCode = $("#paramKey9").val();
    if (provinceCode) {
        var pattern = provinceCode.substring(0, 2) + "*00000";
        var url = 'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=' + pattern;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                var citySelect = $("#paramKey10");
                citySelect.empty();
                citySelect.append(new Option("시 선택", ""));
                data.regcodes.forEach(city => {
                    if (city.code.substring(2, 5) !== "000") { // 시/구 코드 필터링
                        citySelect.append(new Option(city.name, city.code));
                    }
                });

                // 기존 선택된 시가 있다면 설정
                var existingCity = $("#paramKey10").attr("data-existing-city");
                if (existingCity) {
                    citySelect.val(existingCity);
                }
            })
            .catch(error => console.error('Error:', error));
    }
}

$(document).ready(function () {
    // 희망 활동 지역 추가 버튼 클릭 이벤트 등록
    $("#addBtnRegion").click(fn_add_Region_Form);

    // 기존 데이터에 대해 도/시 초기화
    <c:forEach varStatus="status" var="list" items="${subArea}">
        $("#region_province_${status.count}").data("existingProvince", "${list.regionProvince}");
        $("#region_city_${status.count}").data("existingCity", "${list.regionCity}");
        fetchProvinces(${status.count});
    </c:forEach>

    // 메인 지역 선택 초기화
    fetchProvincesForMain();

});


































	function fn_edit(){
		for (var i = 1; i <= countB; i++) {
			if ($("#data6_"+i).val() == "") {
				$("#data6_"+i).val(".");
			}
		}
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
	
	if(countA == '0'){
		fn_add_Form('A');
	}
	
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
		        var html = '';
		        html += '<div class="education_from">';
		        html += '    <div class="form">';
		        html += '        <div class="agree_chk_wrap">';
		        html += '            <span class="check_form">';
		        html += '                <select id="data5_' + countB + '" name="paramKeyList5">';
		        html += '                    <option value="돌봄">돌봄</option>';
		        html += '                    <option value="방과후">방과후</option>';
		        html += '                    <option value="늘봄">늘봄</option>';
		        html += '                    <option value="기타">기타</option>';
		        html += '                </select>';
		        html += '            </span>';
		        html += '        </div>';
		        html += '    </div>';
		        html += '    <textarea maxlength="90" name="paramKeyList6" id="data6_' + countB + '"></textarea>';
		        html += '    <button type="button" onclick="fn_line_delete(this,\'B\');" class="btn btn-default">삭제</button>';
		        html += '</div>';
		        $("#addForm" + type).append(html);
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
			html += "			<option value=\"1\">준학사</option>";
			html += "			<option value=\"2\">학사</option>";
			html += "			<option value=\"3\">석사</option>";
			html += "			<option value=\"4\">박사</option>";
			html += "		</select>";
			html += "</div>";
			html += "<div class=\"form\">";
			html += "<span class=\"txt\">취득연도</span>";
			html += " <input type=\"text\" class=\"getYear\" name=\"paramKeyList3\" id=\"data3_" + countA + "\" style=\"width:80px;\" maxlength=\"4\" placeholder=\"연도선택\"  oninput=\"this.value=this.value.replace(/[^0-9]/g, '').substring(0, 4);\"> ";
			html += "</div>";
			html += "<div class=\"form\">";
			html += "	<span class=\"txt\">세부전공</span>";
			html += "	<input type=\"text\" class=\"major\" name=\"paramKeyList4\" id=\"data4_"+countA+"\" style=\"width:70px;\"> ";
			html += "</div>";
			html += "<button type=\"button\" onclick=\"fn_add_Form('A');\" class=\"btn btn-primary\">추가</button>";
			html += "<button type=\"button\" onclick=\"fn_line_delete(this,'A');\" class=\"btn btn-default\">삭제</button>";
			html += "</div>";
			$("#addForm"+type).append(html);
		}
	}	
	
	
	 function toggleOtherField(checkbox) {
	        var otherField = document.getElementById("otherField");
	        if (checkbox.checked) {
	            otherField.style.display = "inline";
	        } else {
	            otherField.style.display = "none";
	        }
	    }

	    window.onload = function() {
	        var otherCheckbox = document.getElementById("hopeEduField5");
	        if (otherCheckbox.checked) {
	            document.getElementById("otherField").style.display = "inline";
	        }
	    };
	
</script>
<script type="text/javascript" src="/js/home/kor/user/pool.js"  charset="utf-8"></script>
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
									<option value="hotmail.net" <c:if test="${fn:indexOf(resultData.email,'Hotmail.net') != -1}">selected="selected"</c:if>>Hotmail.net</option>
								</select>
							</div>
						</dd>
					</dl>
					
					<dl>
					    <dt><span class="imp">*</span> 지역</dt>
					    <dd>
					        <div class="form">
					            <select id="paramKey9" name="paramKey9" vali-text="지역을 선택해주세요." style="width:150px;" onchange="fetchCitiesForMain()" data-existing-province="${resultData.departmentPosition}">
					                <option value="">도 선택</option>
					            </select>
					            <select id="paramKey10" name="paramKey10" vali-text="시를 선택해주세요." style="width:150px;" data-existing-city="${resultData.acqAt}">
					                <option value="">시 선택</option>
					            </select>
					        </div>
					    </dd>
					</dl>

					
					
					<dl>
						<dt  style="font-size: 14px;"><span class="imp">*</span> 소속/직위(50자이내)</dt>
						<dd><input type="text" class="base" style="width:100%;" maxlength="50" id="paramKey8" name="paramKey8" value="${resultData.department}"></dd>
					</dl>
					<dl>
						<dt><span class="imp">*</span> 학력 &nbsp;&nbsp;&nbsp;  </dt>
						<dd id="addFormA">
							<c:forEach varStatus="status" var="list" items="${subEdu}">
								<div class="education_from">
									<div class="form">
										<span class="txt">학위</span>
										<select name="paramKeyList2" id="data2_${status.count}">
											<option value="" <c:if test="${list.level eq '0'}">selected="selected"</c:if>>선택</option>
											<option value="1" <c:if test="${list.level eq '1'}">selected="selected"</c:if>>준학사</option>
											<option value="1" <c:if test="${list.level eq '2'}">selected="selected"</c:if>>학사</option>
											<option value="2" <c:if test="${list.level eq '3'}">selected="selected"</c:if>>석사</option>
											<option value="3" <c:if test="${list.level eq '4'}">selected="selected"</c:if>>박사</option>
										</select>
									</div>
									<div class="form">
										<span class="txt">취득연도</span>
										<input type="text"  name="paramKeyList3" class="getYear" id="data3_${status.count}" maxlength="4" style="width:80px;" value="${list.year}" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="연도선택" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> 
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
<%-- 					<dl>
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
					</dl> --%>
					
					
					
					<dl>
						<dt>교사자격증</dt>
						<dd>
							<div class="agree_chk_wrap">
								<span class="check_form">
									<input type="checkbox" id="teacherAcqAt1" name="paramKey20" value="1급 정교사" <c:if test="${fn:indexOf(resultData.teacherAcqAt,'1급 정교사') ne -1}">checked</c:if>>
									<label for="teacherAcqAt1">1급 정교사</label>
								</span>
								<span class="check_form">
									<input type="checkbox" id="teacherAcqAt2" name="paramKey20" value="2급 정교사" <c:if test="${fn:indexOf(resultData.teacherAcqAt,'2급 정교사') ne -1}">checked</c:if>>
									<label for="teacherAcqAt2">2급 정교사</label>
								</span>
								<span class="check_form">
									<input type="checkbox" id="teacherAcqAt3" name="paramKey20" value="없음" <c:if test="${fn:indexOf(resultData.teacherAcqAt,'없음') ne -1}">checked</c:if>>
									<label for="teacherAcqAt3">없음</label>
								</span>
							</div>
						</dd> 
					</dl>
					<dl>
						<dt>기타 관련 자격증</dt>
						<dd>
							<div class="email_form">
								<span>자격증 이름</span>
								<input type="text" id="paramKey21" name="paramKey21" value="${resultData.acqAtNm}"/>
								<span>취득일</span>
								<input type="text" id="paramKey22" name="paramKey22" value="${resultData.acqAtDt}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1')" />
								<span>시행처</span>
								<input type="text" id="paramKey23" name="paramKey23" value="${resultData.acqAtLo}"/>
							</div>
						</dd> 
					</dl>
				<%-- <dl>
					<dt>발명교사 인증제 번호</dt> 
					<dd>
						<div class="nm_form">
							<input type="text" style="width:80px;" class="tc" maxlength="4" name="paramKey11" id="paramKey11" value="${resultData.acqAuthNum1}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
							<span>-</span>
							<input type="text" style="width:55px;" class="tc" maxlength="1" name="paramKey12" id="paramKey12" value="${resultData.acqAuthNum2}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> 
							<span>-</span>
							<input type="text" style="width:80px;" class="tc" maxlength="4" name="paramKey1" id="paramKey13" value="${resultData.acqAuthNum3}" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
							<input type="hidden" id="acqAuthNum" name="acqAuthNum" value="${result.acq_auth_num}">
						</div>
					</dd>
					<dd><input type="text" class="" readonly="readonly" value="${resultData.acqAuthNum1}" name="paramKey11" id="paramKey11" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl>  
				<dl>
					<dt>교사연구회 참여 이력</dt>
					<dd><input type="text" class="" readonly="readonly" value="${resultData.researchGroupHistory}" name="paramKey14" id="paramKey14" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl>
				<dl>
					<dt>직무 연수 참여 이력</dt>
					<dd><input type="text" class="" readonly="readonly" value="${resultData.jobTrainingHistory}" name="paramKey15" id="paramKey15" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl>	 --%>	
				
				
			</div>
<!-- 			<div class="person-title info_form">자격이력</div> -->
<!-- 			<div class="info_form_wrap v2">
						
			</div> -->
			<div class="person-title info_form">직무 연수 참여 이력 입력 </div>
			<div class="info_form_wrap v3">
<%-- 				<dl>
					<dt>KIPA 교육 플랫폼 활용 교육 경력</dt>
					<dd><input type="text" class="" readonly="readonly" name="paramKey16" id="paramKey16" value="${resultData.kipaEduCareer}" style="width:250px;" value="추후 사업 담당자 입력 영역" placeholder="추후 사업 담당자 입력 영역"></dd>
				</dl> --%>
				 
				<dl>
					<dt>한국발명진흥회 연수 경력</dt>
					<dd><textarea name="paramKey24" id="paramKey24" style="width:100%;" rows="10"><c:out value="${resultData.trainingCareer}"/></textarea></dd>
				</dl>
				<dl>
					<dt>타기관 발명교육 관련 경력</dt>
					<dd><textarea name="paramKey25" id="paramKey25" style="width:100%;" rows="10"><c:out value="${resultData.eduCareer}"/></textarea></dd>
				</dl>
				<dl>
					<dt>기타 관련 연수경력</dt>
					<dd><textarea name="paramKey17" id="paramKey17" style="width:100%;" rows="10"><c:out value="${resultData.etcCareer}"/></textarea></dd>
				</dl>
			</div>
			
			<div class="person-title info_form">강의이력 </div>
			<div class="info_form_wrap v3">
				<dl>
					<dt>강의 경력</dt>
					<dd>
						<div class="agree_chk_wrap">

							<span class="radio_form">
								<span class="radio_form">
									<input type="radio" name="paramKey16" id="kipaEduCareer1" <c:if test="${resultData.kipaEduCareer eq '없음'}">checked</c:if> value="없음"><label for="kipaEduCareer1">없음</label>
								</span>
								<span class="radio_form">
	                        		<input type="radio" name="paramKey16" id="kipaEduCareer2" <c:if test="${resultData.kipaEduCareer eq '1년미만'}">checked</c:if> value="1년미만"><label for="kipaEduCareer2">1년미만</label>
								</span>
								<span class="radio_form">
	                        		<input type="radio" name="paramKey16" id="kipaEduCareer3" <c:if test="${resultData.kipaEduCareer eq '1년~3년'}">checked</c:if> value="1년~3년"><label for="kipaEduCareer3">1년~3년</label>
								</span>
								<span class="radio_form">
	                        		<input type="radio" name="paramKey16" id="kipaEduCareer4" <c:if test="${resultData.kipaEduCareer eq '4년이상'}">checked</c:if> value="4년이상"><label for="kipaEduCareer4">4년이상</label>
								</span>
							</span>
						</div>
					</dd> 
				</dl>
				
<dl>
    <dt>강의 경력 <a href="javascript:void(0);" id="addBtn2" onclick="fn_add_Form('B');" class="btn btn-primary">추가</a></dt>
    <dd id="addFormB">
        <c:forEach varStatus="status" var="list" items="${subCareer}">
            <div class="education_from">
                <div class="form">
                    <div class="agree_chk_wrap">
                        <span class="check_form">
                            <select id="data5_${status.count}" name="paramKeyList5">
                                <option value="돌봄" <c:if test="${list.year == '돌봄'}">selected</c:if>>돌봄</option>
                                <option value="방과후" <c:if test="${list.year == '방과후'}">selected</c:if>>방과후</option>
                                <option value="늘봄" <c:if test="${list.year == '늘봄'}">selected</c:if>>늘봄</option>
                                <option value="기타" <c:if test="${list.year == '기타'}">selected</c:if>>기타</option>
                            </select>
                        </span>
                    </div>
                </div>
                <textarea maxlength="90" name="paramKeyList6" id="data6_${status.count}"> <c:out value="${list.program}"/></textarea>
                
                <button type="button" onclick="fn_line_delete(this,'B');" class="btn btn-default">삭제</button>
            </div>
        </c:forEach>
    </dd>
</dl>
				
				
			</div>
			
			<div class="person-title info_form">향후 희망 강의 (중복 선택 가능) </div>
			<div class="info_form_wrap v3">
				<%-- <dl>
					<dt>희망 강의</dt>
					<dd>
						<div class="agree_chk_wrap">
							<span class="check_form">
								<input type="checkbox" id="classHistory1" name="paramKey19" value="돌봄" <c:if test="${fn:indexOf(resultData.classHistory,'돌봄') ne -1}">checked</c:if>>
								<label for="classHistory1">돌봄</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="classHistory2" name="paramKey19" value="방과후" <c:if test="${fn:indexOf(resultData.classHistory,'방과후') ne -1}">checked</c:if>>
								<label for="classHistory2">방과후</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="classHistory3" name="paramKey19" value="늘봄" <c:if test="${fn:indexOf(resultData.classHistory,'늘봄') ne -1}">checked</c:if>>
								<label for="classHistory3">늘봄</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="classHistory4" name="paramKey19" value="기타" <c:if test="${fn:indexOf(resultData.classHistory,'기타') ne -1}">checked</c:if>>
								<label for="classHistory4">기타</label>
							</span>
						</div>
					</dd> 
				</dl> --%>
				<dl>
					<dt>희망 강의 분야</dt>
					<dd>
						<div class="agree_chk_wrap">
							<span class="check_form">
								<input type="checkbox" id="hopeEduField1" name="paramKey26" value="ICT 및 코딩" <c:if test="${fn:indexOf(resultData.hopeEduField,'ICT 및 코딩') ne -1}">checked</c:if>>
								<label for="hopeEduField1">ICT 및 코딩</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduField2" name="paramKey26" value="메이커스" <c:if test="${fn:indexOf(resultData.hopeEduField,'메이커스') ne -1}">checked</c:if>>
								<label for="hopeEduField2">메이커스</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduField3" name="paramKey26" value="창의과학" <c:if test="${fn:indexOf(resultData.hopeEduField,'창의과학') ne -1}">checked</c:if>>
								<label for="hopeEduField3">창의과학</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduField4" name="paramKey26" value="지식재산" <c:if test="${fn:indexOf(resultData.hopeEduField,'지식재산') ne -1}">checked</c:if>>
								<label for="hopeEduField4">지식재산</label>
							</span>
							<span class="check_form">
				                <input type="checkbox" id="hopeEduField5" name="paramKey26" value="기타" <c:if test="${fn:indexOf(resultData.hopeEduField,'기타') ne -1}">checked</c:if> onclick="toggleOtherField(this)">
				                <label for="hopeEduField5">기타</label>
				            </span>
							<span class="check_form" id="otherField" style="display: none;">
				                <input type="text" id="paramKey11" name="paramKey11" value="${resultData.acqAuthNum}"  placeholder="기타 입력">
				            </span>
						</div>
					</dd> 
				</dl>
				<dl>
					<dt>희망 강의 학년</dt>
					<dd>
						<div class="agree_chk_wrap">
							<span class="check_form">
								<input type="checkbox" id="hopeEduGrade1" name="paramKey27" value="유치원" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'유치원') ne -1}">checked</c:if>>
								<label for="hopeEduGrade1">유치원</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduGrade2" name="paramKey27" value="초등학교 1~2학년" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'초등학교 1~2학년') ne -1}">checked</c:if>>
								<label for="hopeEduGrade2">초등학교 1~2학년</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduGrade3" name="paramKey27" value="초등학교 3~4학년" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'초등학교 3~4학년') ne -1}">checked</c:if>>
								<label for="hopeEduGrade3">초등학교 3~4학년</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduGrade4" name="paramKey27" value="초등학교 5~6학년" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'초등학교 5~6학년') ne -1}">checked</c:if>>
								<label for="hopeEduGrade4">초등학교 5~6학년</label>
							</span>
						</div>
					</dd> 
				</dl>
				<dl>
					<dt>희망 강의 요일</dt>
					<dd>
						<div class="agree_chk_wrap">
							<span class="check_form">
								<input type="checkbox" id="hopeEduDt1" name="paramKey28" value="월" <c:if test="${fn:indexOf(resultData.hopeEduDt,'월') ne -1}">checked</c:if>>
								<label for="hopeEduDt1">월</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduDt2" name="paramKey28" value="화" <c:if test="${fn:indexOf(resultData.hopeEduDt,'화') ne -1}">checked</c:if>>
								<label for="hopeEduDt2">화</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduDt3" name="paramKey28" value="수" <c:if test="${fn:indexOf(resultData.hopeEduDt,'수') ne -1}">checked</c:if>>
								<label for="hopeEduDt3">수</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduDt4" name="paramKey28" value="목" <c:if test="${fn:indexOf(resultData.hopeEduDt,'목') ne -1}">checked</c:if>>
								<label for="hopeEduDt4">목</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduDt5" name="paramKey28" value="금" <c:if test="${fn:indexOf(resultData.hopeEduDt,'금') ne -1}">checked</c:if>>
								<label for="hopeEduDt5">금</label>
							</span>
						</div>
					</dd> 
				</dl>
				<dl>
					<dt>희망 강의 시간</dt>
					<dd>
						<div class="agree_chk_wrap">
							<span class="check_form">
								<input type="checkbox" id="hopeEduTime1" name="paramKey29" value="8:00~9:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'8:00~9:00') ne -1}">checked</c:if>>
								<label for="hopeEduTime1">8:00~9:00</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduTime2" name="paramKey29" value="12:00~13:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'12:00~13:00') ne -1}">checked</c:if>>
								<label for="hopeEduTime2">12:00~13:00</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduTime3" name="paramKey29" value="13:00~14:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'13:00~14:00') ne -1}">checked</c:if>>
								<label for="hopeEduTime3">13:00~14:00</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduTime4" name="paramKey29" value="15:00~16:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'15:00~16:00') ne -1}">checked</c:if>>
								<label for="hopeEduTime4">15:00~16:00</label>
							</span>
							<span class="check_form">
								<input type="checkbox" id="hopeEduTime5" name="paramKey29" value="16:00~17:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'16:00~17:00') ne -1}">checked</c:if>>
								<label for="hopeEduTime5">16:00~17:00</label>
							</span>
						</div>
					</dd> 
				</dl>	
				
				<dl>
			        <dt>희망 활동 지역  <a href="javascript:void(0);" id="addBtnRegion" class="btn btn-primary">추가</a></dt>
			        <dd id="addFormRegion">
			            <c:forEach varStatus="status" var="list" items="${subArea}">
			                <div style="width:100%" class="region_form" id="region_form_${status.count}" data-index="${status.count}">
			                    <div class="form">
			                        <div class="region_chk_wrap">
			                            <label for="region_province_${status.count}">순위 ${status.count}: </label>
			                            <select style="width:40%" id="region_province_${status.count}" name="paramKeyList7" onchange="fetchCities(${status.count})">
			                                <option value="">도 선택</option>
			                            </select>
			                            <select style="width:40%" id="region_city_${status.count}" name="paramKeyList8">
			                                <option value="">시 선택</option>
			                            </select>
			                            <button type="button" onclick="fn_line_delete1(${status.count});" class="btn btn-default">삭제</button>
			                        </div>
			                    </div>
			                </div>
			            </c:forEach>
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
					<button type="button" class="btn btn-default" onclick="fn_leave()" style="margin-left:100px;">늘봄 민간강사 탈퇴</button>
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
