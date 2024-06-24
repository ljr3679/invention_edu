<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
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
    html += '            <label for="region_province_' + countRegion + '">순위 ' + countRegion + ': </label>';
    html += '            <select style="width:40%" id="region_province_' + countRegion + '" name="paramKeyList7" onchange="fetchCities(' + countRegion + ')">';
    html += '                <option value="">도 선택</option>';
    html += '            </select>';
    html += '            <select style="width:40%" id="region_city_' + countRegion + '" name="paramKeyList8">';
    html += '                <option value="">시 선택</option>';
    html += '            </select>';
    html += '            <button type="button" onclick="fn_line_delete1(' + countRegion + ');" class="btn btn-default">삭제</button>';
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
		        var html = '';
		        html += '<div class="education_from">';
		        html += '    <div class="form">';
		        html += '        <div class="agree_chk_wrap">';
		        html += '            <span class="txt">';
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
		    <th scope="row"><span class="imp">*</span> 지역</th>
		    <td>
		        <div class="form">
		            <select id="paramKey9" name="paramKey9" vali-text="지역을 선택해주세요." style="width:150px;" onchange="fetchCitiesForMain()" data-existing-province="${resultData.departmentPosition}">
		                <option value="">도 선택</option>
		                <c:forEach items="${region}" var="list" varStatus="status">
		                    <option value="${list.no}" <c:if test="${resultData.departmentPosition eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
		                </c:forEach>
		            </select>
		            <select id="paramKey10" name="paramKey10" vali-text="시를 선택해주세요." style="width:150px;" data-existing-city="${resultData.acqAt}">
		                <option value="">시 선택</option>
		            </select>
		        </div>
		    </td>
		</tr>
		<tr>
			<th scope="row"><span class="imp">*</span> 소속(50자이내)</th>
			<td>
			<input type="text" class="base" style="width:100%;" maxlength="50" id="paramKey8" name="paramKey8" value="${resultData.department}"/>
			</td>
		</tr>
		<%-- <tr>
			<th scope="row"><span class="imp">*</span> 직위(50자이내)</th>
			<td>
			<input type="text" class="base" style="width:100%;" maxlength="50"  id="paramKey9" name="paramKey9" value="${resultData.departmentPosition}"/>
			</td>
		</tr> --%>
		<tr>
			<th scope="row">학력<a href="javascript:void(0);" id="addBtn1" onclick="fn_add_Form('A');" class="btn btn-primary">추가</a></th>
			<td id="addFormA">
			
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
							<input type="text"  name="paramKeyList3" class="getYear" id="data3_${status.count}" maxlength="4" style="width:80px;" value="${list.year}" placeholder="연도선택" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="연도선택" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"/> 
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
			<th scope="row">교사자격증</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="teacherAcqAt1" name="paramKey20" value="1급 정교사" <c:if test="${fn:indexOf(resultData.teacherAcqAt,'1급 정교사') ne -1}">checked</c:if>>
					<label for="teacherAcqAt1">1급 정교사</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="teacherAcqAt2" name="paramKey20" value="2급 정교사" <c:if test="${fn:indexOf(resultData.teacherAcqAt,'2급 정교사') ne -1}">checked</c:if>>
					<label for="teacherAcqAt2">2급 정교사</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="teacherAcqAt3" name="paramKey20" value="없음" <c:if test="${fn:indexOf(resultData.teacherAcqAt,'없음') ne -1}">checked</c:if>>
					<label for="teacherAcqAt3">없음</label>
				</span>
			</td>
		</tr>			
		<tr>
			<th scope="row">기타 관련 자격증</th>
			<td>
				<span>자격증 이름</span>
				<input type="text" id="paramKey21" name="paramKey21" value="${resultData.acqAtNm}"/>
				<span>취득일</span>
				<input type="text" id="paramKey22" name="paramKey22" value="${resultData.acqAtDt}" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="취득일" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');/>
				<span>시행처</span>
				<input type="text" id="paramKey23" name="paramKey23" value="${resultData.acqAtLo}"/>
			</td>
		</tr>			
		
		
		
		
		
		
		<tr>
			<th scope="row" colspan="2"><h4>직무 연수 참여 이력 입력</h4></th>
		</tr>	
		<tr>
			<th scope="row">한국발명진흥회 연수 경력</th>
			<td>
			<textarea name="paramKey24" id="paramKey24" style="width:100%;" rows="10"><c:out value="${resultData.trainingCareer}"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">타기관 발명교육 관련 경력</th>
			<td>
			<textarea name="paramKey25" id="paramKey25" style="width:100%;" rows="10"><c:out value="${resultData.eduCareer}"/></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">타기관 발명교육 관련 경력</th>
			<td>
			<textarea name="paramKey17" id="paramKey17" style="width:100%;" rows="10"><c:out value="${resultData.etcCareer}"/></textarea>
			</td>
		</tr>
		
		<tr>
			<th scope="row" colspan="2"><h4>강의이력</h4></th>
		</tr>	
		
		<tr>
			<th scope="row">강의경력</th>
			<td>
				<span class="radio_area">
					<input type="radio" id="kipaEduCareer1" name="paramKey16" value="없음" <c:if test="${fn:indexOf(resultData.kipaEduCareer,'없음') ne -1}">checked</c:if>>
					<label for="kipaEduCareer1">없음</label>
				</span>
				<span class="radio_area">
					<input type="radio" id="kipaEduCareer2" name="paramKey16" value="1년미만" <c:if test="${fn:indexOf(resultData.kipaEduCareer,'1년미만') ne -1}">checked</c:if>>
					<label for="kipaEduCareer2">1년미만</label>
				</span>
				<span class="radio_area">
					<input type="radio" id="kipaEduCareer3" name="paramKey16" value="1년~3년" <c:if test="${fn:indexOf(resultData.kipaEduCareer,'1년~3년') ne -1}">checked</c:if>>
					<label for="kipaEduCareer3">1년~3년</label>
				</span>
				<span class="radio_area">
					<input type="radio" id="kipaEduCareer4" name="paramKey16" value="4년이상" <c:if test="${fn:indexOf(resultData.kipaEduCareer,'4년이상') ne -1}">checked</c:if>>
					<label for="kipaEduCareer4">4년이상</label>
				</span>
			</td>
		</tr>	
		
		<tr>
			<th scope="row">강의 경력<a href="javascript:void(0);" id="addBtn2" onclick="fn_add_Form('B');" class="btn btn-primary">추가</a></th>
			<td id="addFormB">
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
			</td>
		</tr>
		
		<tr>
			<th scope="row" colspan="2"><h4>향후 희망 강의</h4></th>
		</tr>	
		
				
		<%-- <tr>
			<th scope="row">희망 강의</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="classHistory1" name="paramKey19" value="돌봄" <c:if test="${fn:indexOf(resultData.classHistory,'돌봄') ne -1}">checked</c:if>>
					<label for="classHistory1">돌봄</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="classHistory2" name="paramKey19" value="방과후" <c:if test="${fn:indexOf(resultData.classHistory,'방과후') ne -1}">checked</c:if>>
					<label for="classHistory2">방과후</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="classHistory3" name="paramKey19" value="늘봄" <c:if test="${fn:indexOf(resultData.classHistory,'늘봄') ne -1}">checked</c:if>>
					<label for="classHistory3">늘봄</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="classHistory4" name="paramKey19" value="기타" <c:if test="${fn:indexOf(resultData.classHistory,'기타') ne -1}">checked</c:if>>
					<label for="classHistory4">기타</label>
				</span>
			</td>
		</tr>				 --%>	
		<tr>
			<th scope="row">희망 강의 분야</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduField1" name="paramKey26" value="ICT 및 코딩" <c:if test="${fn:indexOf(resultData.hopeEduField,'ICT 및 코딩') ne -1}">checked</c:if>>
					<label for="hopeEduField1">ICT 및 코딩</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduField2" name="paramKey26" value="메이커스" <c:if test="${fn:indexOf(resultData.hopeEduField,'메이커스') ne -1}">checked</c:if>>
					<label for="hopeEduField2">메이커스</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduField3" name="paramKey26" value="창의과학" <c:if test="${fn:indexOf(resultData.hopeEduField,'창의과학') ne -1}">checked</c:if>>
					<label for="hopeEduField3">창의과학</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduField4" name="paramKey26" value="지식재산" <c:if test="${fn:indexOf(resultData.hopeEduField,'지식재산') ne -1}">checked</c:if>>
					<label for="hopeEduField4">지식재산</label>
				</span>
				<span class="radio_area">
					 <input type="checkbox" id="hopeEduField5" name="paramKey26" value="기타" <c:if test="${fn:indexOf(resultData.hopeEduField,'기타') ne -1}">checked</c:if> onclick="toggleOtherField(this)">
					<label for="hopeEduField5">기타</label>
				</span>
				<span class="radio_area" id="otherField" style="display: none;">
					<input type="text" id="paramKey11" name="paramKey11" value="${resultData.acqAuthNum}"  placeholder="기타 입력">
				</span>
			</td>
		</tr>					
		<tr>
			<th scope="row">희망 강의 학년</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduGrade1" name="paramKey27" value="유치원" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'유치원') ne -1}">checked</c:if>>
					<label for="hopeEduGrade1">유치원</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduGrade2" name="paramKey27" value="초등학교 1~2학년" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'초등학교 1~2학년') ne -1}">checked</c:if>>
					<label for="hopeEduGrade2">초등학교 1~2학년</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduGrade3" name="paramKey27" value="초등학교 3~4학년" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'초등학교 3~4학년') ne -1}">checked</c:if>>
					<label for="hopeEduGrade3">초등학교 3~4학년</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduGrade4" name="paramKey27" value="초등학교 5~6학년" <c:if test="${fn:indexOf(resultData.hopeEduGrade,'초등학교 5~6학년') ne -1}">checked</c:if>>
					<label for="hopeEduGrade4">초등학교 5~6학년</label>
				</span>
			</td>
		</tr>					
		<tr>
			<th scope="row">희망 강의 요일</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduDt1" name="paramKey28" value="월" <c:if test="${fn:indexOf(resultData.hopeEduDt,'월') ne -1}">checked</c:if>>
					<label for="hopeEduDt1">월</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduDt2" name="paramKey28" value="화" <c:if test="${fn:indexOf(resultData.hopeEduDt,'화') ne -1}">checked</c:if>>
					<label for="hopeEduDt2">화</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduDt3" name="paramKey28" value="수" <c:if test="${fn:indexOf(resultData.hopeEduDt,'수') ne -1}">checked</c:if>>
					<label for="hopeEduDt3">수</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduDt4" name="paramKey28" value="목" <c:if test="${fn:indexOf(resultData.hopeEduDt,'목') ne -1}">checked</c:if>>
					<label for="hopeEduDt4">목</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduDt5" name="paramKey28" value="금" <c:if test="${fn:indexOf(resultData.hopeEduDt,'금') ne -1}">checked</c:if>>
					<label for="hopeEduDt5">금</label>
				</span>
			</td>
		</tr>					
		<tr>
			<th scope="row">희망 강의 시간</th>
			<td>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduTime1" name="paramKey29" value="8:00~9:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'8:00~9:00') ne -1}">checked</c:if>>
					<label for="hopeEduTime1">8:00~9:00</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduTime2" name="paramKey29" value="12:00~13:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'12:00~13:00') ne -1}">checked</c:if>>
					<label for="hopeEduTime2">12:00~13:00</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduTime3" name="paramKey29" value="13:00~14:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'13:00~14:00') ne -1}">checked</c:if>>
					<label for="hopeEduTime3">13:00~14:00</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduTime4" name="paramKey29" value="15:00~16:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'15:00~16:00') ne -1}">checked</c:if>>
					<label for="hopeEduTime4">15:00~16:00</label>
				</span>
				<span class="radio_area">
					<input type="checkbox" id="hopeEduTime5" name="paramKey29" value="16:00~17:00" <c:if test="${fn:indexOf(resultData.hopeEduTime,'16:00~17:00') ne -1}">checked</c:if>>
					<label for="hopeEduTime5">16:00~17:00</label>
				</span>
			</td>
		</tr>		
		
		
		 <tr>
            <th scope="row">희망 활동 지역 <a href="javascript:void(0);" id="addBtnRegion" class="btn btn-primary">추가</a></th>
            <td id="addFormRegion">
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
