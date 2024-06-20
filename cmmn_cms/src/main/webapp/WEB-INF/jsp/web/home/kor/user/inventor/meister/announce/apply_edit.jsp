<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@globals['gbls.kakao.key']" />&libraries=services,clusterer"></script>
<script>
	function fn_apply(){
		if(fn_validation_check($('#cmmnForm'),fn_custom_vali)) {
    		if(confirm('수정 하시겠습니까?')) {
    			$('#cmmnForm').attr('action', '${vo.selfPath}apply_update.act');
    		    $('#cmmnForm').submit();	
			}
    	}
	}
	
	function fn_custom_vali(obj, index) {
    	if($(obj).attr('name') == 'fileVali1') {
    		if($('#fileTable1').find('tr').not(':hidden').length == 0) return false;
			else return true;
		}
    	if($(obj).attr('name') == 'fileVali2') {
    		if($('#fileTable2').find('tr').not(':hidden').length == 0) return false;
			else return true;
		}
    }
	
	function fn_egov_pw_ck(val) {
		var ser = val.search(/^(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,11}$/);
		if(ser == 0){
			return true;
		}else{
			return false;
		}
	}
	
	function fn_gubun(val) {
		var html = "";
		
		if(val == "A") {
			$("#idea_text1").html("");
			$("#idea_text2").html("");
			$("#idea_text3").html("");
		} else if(val == "B") {
			$("#idea_text2").html("");
			$("#idea_text3").html("");
			
			html += "<label for=\"radio14\" class=\"else_label\"><span class=\"text\">전공 :</span></label>";
			html += "<input type=\"text\" name=\"paramKey35\" id=\"paramKey35\" value=\"\" vali-text=\"전공을 입력해주세요.\">";
			$("#idea_text1").html(html);
		} else if(val == "C") {
			$("#idea_text1").html("");
			$("#idea_text3").html("");
			
			html += "<label for=\"radio15\" class=\"else_label\"><span class=\"text\">협력기업 명 :</span></label>";
			html += "<input type=\"text\" name=\"paramKey35\" id=\"paramKey35\" value=\"\" vali-text=\"협력기업 명을 입력해주세요.\">";
			
			$("#idea_text2").html(html);
		} else if(val == "D") {
			$("#idea_text1").html("");
			$("#idea_text2").html("");
			
			html += "<label for=\"radio16\" class=\"else_label\"><span class=\"text\">분류번호 :</span></label>";
			html += "<select name=\"paramKey35\" id=\"paramKey35\" vali-text=\"분류번호을 선택해주세요.\">";
			html += "	<option value=\"\">선택</option>";
			for(var i=1; i<39; i++) {
				html += "	<option value=\""+i+"\">"+i+"</option>";
			}
			html += "</select>";
			
			$("#idea_text3").html(html);
		}
	}
	
	function fn_cancel(){
	    $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
	    $('#cmmnForm').submit();
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post" enctype="multipart/form-data">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchKeyword"/>

	<div class="cont_wrap">
		<div class="cont_each">
			<div class="board_info sty1">
				<div class="board_system_info">
					<dl>
						<dt>제목</dt>
						<dd><c:out value="${resultData.title}" escapeXml="false"/></dd>
					</dl>
					<dl>
						<dt>모집기간</dt>
						<dd><c:out value="${resultData.startDate}"/> ~ <c:out value="${resultData.endDate}"/></dd>
					</dl>
					
				</div>
			</div>
			<div class="com_table_cont">
				<div class="table_box">
					<div class="title_area">
						<div class="fr">
							<span class="text"><span class="red">*</span> 표시는 필수 입력 사항입니다</span>
						</div>
					</div>
					<table class="board_write">
						<caption>신청정보의 내용을 포함한 표</caption>
						<colgroup>
							<col style="width: 200px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th>접수번호</th>
								<td><c:out value="${resultData.applyNumber}"/></td>
							</tr>
							<tr>
								<th>아이디어 명칭</th>
								<td><input type="text" name="paramKey2" id="paramKey2" value="${resultData.ideaName}" class="mw365 unCheck" vali-text="아이디어 명칭을 입력해주세요."></td>
							</tr>
							<tr>
								<th>팀명</th>
								<td><input type="text" name="paramKey3" id="paramKey3" value="${resultData.teamName}" class="mw365 unCheck" vali-text="팀명을 입력해주세요."></td>
							</tr>
							<tr>
								<th scope="row"><label for=""><span class="red">*</span> 아이디어 구분 </label></th>
								<td>
									<div class="inp_chk_list sty1">
										<ul class="list">
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp" name="paramKey4" id="paramKey4_1" value="A" onchange="fn_gubun(this.value);" vali-text="아이디어 구분을 선택해주세요." <c:if test="${resultData.ideaGubun eq 'A'}">checked="checked"</c:if>>
													<label for="paramKey4_1"><span class="text">자유과제</span></label>
												</span>
											</li>
											<li>
												<span class="radio_area sty1">
													<input type="radio" class="radio_inp" name="paramKey4" id="paramKey4_2" value="B" onchange="fn_gubun(this.value);" vali-text="아이디어 구분을 선택해주세요." <c:if test="${resultData.ideaGubun eq 'B'}">checked="checked"</c:if>>
													<label for="paramKey4_2"><span class="text">전문교과과제</span></label>
													<span id="idea_text1">
														<c:if test="${resultData.ideaGubun eq 'B'}">
															<label for="radio14" class="else_label"><span class="text">전공 :</span></label>
															<input type="text" name="paramKey35" id="paramKey35" value="${resultData.ideaGubunText}" vali-text="전공을 입력해주세요.">
														</c:if>
													</span>
												</span>
											</li>
											<li>
												<span class="radio_area sty1">
													<input type="radio" class="radio_inp" name="paramKey4" id="paramKey4_3" value="C" onchange="fn_gubun(this.value);" vali-text="아이디어 구분을 선택해주세요." <c:if test="${resultData.ideaGubun eq 'C'}">checked="checked"</c:if>>
													<label for="paramKey4_3"><span class="text">협력기업과제</span></label>
													<span id="idea_text2">
														<c:if test="${resultData.ideaGubun eq 'C'}">
															<label for="radio15" class="else_label"><span class="text">협력기업 명 :</span></label>
															<input type="text" name="paramKey35" id="paramKey35" value="${resultData.ideaGubunText}" vali-text="전공을 입력해주세요.">
														</c:if>
													</span>
												</span>
											</li>
											<li>
												<span class="radio_area sty1">
													<input type="radio" class="radio_inp" name="paramKey4" id="paramKey4_4" value="D" onchange="fn_gubun(this.value);" vali-text="아이디어 구분을 선택해주세요." <c:if test="${resultData.ideaGubun eq 'D'}">checked="checked"</c:if>>
													<label for="paramKey4_4"><span class="text">테마과제</span></label>
													<span id="idea_text3">
														<c:if test="${resultData.ideaGubun eq 'D'}">
															<label for="radio16" class="else_label"><span class="text">분류번호 :</span></label>
															<select name="paramKey35" id="paramKey35" vali-text="분류번호을 선택해주세요.">
																<option value="">선택</option>
																<c:forEach var="i" begin="1" end="39">
																	<option value="${i}" <c:if test="${resultData.ideaGubunText eq i}">selected="selected"</c:if>>${i}</option>
																</c:forEach>
															</select>
														</c:if>
													</span>
												</span>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="red">*</span> 학교</th>
								<td><input type="text" name="paramKey33" id="paramKey33" value="${resultData.school}" class="mw365" vali-text="학교를 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 학교유형 </label></th>
								<td>
									<select name="paramKey5" id="paramKey5" class="mw365" vali-text="학교유형을 선택해주세요.">
										<option value="">선택</option>
										<option value="A" <c:if test="${resultData.schoolType eq 'A'}">selected="selected"</c:if>>특성화고</option>
										<option value="B" <c:if test="${resultData.schoolType eq 'B'}">selected="selected"</c:if>>마이스터고</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 학교주소</label></th>
								<td>
									<div class="area_area">
										<ul class="area_list">
											<li>
												<div class="area_sch">
													<input type="text" name="paramKey6" id="zipcode" value="${resultData.zipCode}" vali-text="우편번호를 선택해주세요." readonly="readonly">
													<a href="javascript:void(0);" class="btn sty2" onClick="fn_post_office(false);">우편번호 검색</a>
												</div>
											</li>
											<li><input type="text" name="paramKey7" id="address" value="${resultData.address}" vali-text="주소를 선택해주세요." readonly="readonly"></li>
											<li><input type="text" name="paramKey8" id="addressDetail" value="${resultData.addressDetail}" vali-text="상세주소를 입력해주세요."></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th colspan="2" class="txt_center"><label for=""><span class="red">*</span> 팀원1(대표학생)</label></th>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 성명</label></th>
								<td><input type="text" name="paramKey9" id="paramKey9" value="${resultData.teamUserName1}" class="mw365" vali-text="성명을 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 법정 생년월일</label></th>
								<td><input type="text" name="paramKey10" id="paramKey10" value="${resultData.teamUserBirthDay1}" class="mw365 datepicker" vali-text="법정 생년월일을 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 학년</label></th>
								<td>
									<select name="paramKey11" id="paramKey11" class="mw365" vali-text="학년을 선택해주세요.">
										<option value="">선택</option>
										<option value="1" <c:if test="${resultData.teamUserGrade1 eq '1'}">selected="selected"</c:if>>1학년</option>
										<option value="2" <c:if test="${resultData.teamUserGrade1 eq '2'}">selected="selected"</c:if>>2학년</option>
										<option value="3" <c:if test="${resultData.teamUserGrade1 eq '3'}">selected="selected"</c:if>>3학년</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for=""><span class="red">*</span> 성별</label></th>
								<td>
									<div class="inp_chk_list">
										<ul class="list">
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp" name="paramKey12" id="paramKey12_1" value="M" vali-text="성별을 선택해주세요." <c:if test="${resultData.teamUserSex1 eq 'M'}">checked="checked"</c:if>>
													<label for="paramKey12_1"><span class="text">남</span></label>
												</span>
											</li>
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp" name="paramKey12" id="paramKey12_2" value="F" vali-text="성별을 선택해주세요." <c:if test="${resultData.teamUserSex1 eq 'F'}">checked="checked"</c:if>>
													<label for="paramKey12_2"><span class="text">여</span></label>
												</span>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 휴대전화</label></th>
								<td><input type="text" name="paramKey13" id="paramKey13" value="${cFn:decrypt(resultData.teamUserPhone1)}" class="mw365 vali_phone" vali-text="휴대전화를 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> E-mail</label></th>
								<td><input type="text" name="paramKey14" id="paramKey14" value="${cFn:decrypt(resultData.teamUserEmail1)}" class="mw365" vali-text="E-mail을 입력해주세요."></td>
							</tr>
	
							<tr>
								<th colspan="2" class="txt_center"><label for="">팀원2</label></th>
							</tr>
							<tr>
								<th><label for="">성명</label></th>
								<td><input type="text" name="paramKey15" id="paramKey15" value="${resultData.teamUserName2}" class="mw365 unCheck"></td>
							</tr>
							<tr>
								<th><label for="">법정 생년월일</label></th>
								<td><input type="text" name="paramKey16" id="paramKey16" value="${resultData.teamUserBirthDay2}" class="mw365 datepicker unCheck"></td>
							</tr>
							<tr>
								<th><label for="">학년</label></th>
								<td>
									<select name="paramKey17" id="paramKey17" class="mw365 unCheck">
										<option value="">선택</option>
										<option value="1" <c:if test="${resultData.teamUserGrade2 eq '1'}">selected="selected"</c:if>>1학년</option>
										<option value="2" <c:if test="${resultData.teamUserGrade2 eq '2'}">selected="selected"</c:if>>2학년</option>
										<option value="3" <c:if test="${resultData.teamUserGrade2 eq '3'}">selected="selected"</c:if>>3학년</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="">성별</label></th>
								<td>
									<div class="inp_chk_list">
										<ul class="list">
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp unCheck" name="paramKey18" id="paramKey18_1" value="M" <c:if test="${resultData.teamUserSex2 eq 'M'}">checked="checked"</c:if>>
													<label for="paramKey18_1"><span class="text">남</span></label>
												</span>
											</li>
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp unCheck" name="paramKey18" id="paramKey18_2" value="F" <c:if test="${resultData.teamUserSex2 eq 'F'}">checked="checked"</c:if>>
													<label for="paramKey18_2"><span class="text">여</span></label>
												</span>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">휴대전화</label></th>
								<td><input type="text" name="paramKey19" id="paramKey19" value="${cFn:decrypt(resultData.teamUserPhone2)}" class="mw365 vali_phone unCheck"></td>
							</tr>
							<tr>
								<th><label for="">E-mail</label></th>
								<td><input type="text" name="paramKey20" id="paramKey20" value="${cFn:decrypt(resultData.teamUserEmail2)}" class="mw365 unCheck"></td>
							</tr>
	
							<tr>
								<th colspan="2" class="txt_center"><label for="">팀원3</label></th>
							</tr>
							<tr>
								<th><label for="">성명</label></th>
								<td><input type="text" name="paramKey21" id="paramKey21" value="${resultData.teamUserName3}" class="mw365 unCheck"></td>
							</tr>
							<tr>
								<th><label for="">법정 생년월일</label></th>
								<td><input type="text" name="paramKey22" id="paramKey22" value="${resultData.teamUserBirthDay3}" class="mw365 datepicker unCheck"></td>
							</tr>
							<tr>
								<th><label for="">학년</label></th>
								<td>
									<select name="paramKey23" id="paramKey23" class="mw365 unCheck">
										<option value="">선택</option>
										<option value="1" <c:if test="${resultData.teamUserGrade3 eq '1'}">selected="selected"</c:if>>1학년</option>
										<option value="2" <c:if test="${resultData.teamUserGrade3 eq '2'}">selected="selected"</c:if>>2학년</option>
										<option value="3" <c:if test="${resultData.teamUserGrade3 eq '3'}">selected="selected"</c:if>>3학년</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="">성별</label></th>
								<td>
									<div class="inp_chk_list">
										<ul class="list">
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp unCheck" name="paramKey24" id="paramKey24_1" value="M" <c:if test="${resultData.teamUserSex3 eq 'M'}">checked="checked"</c:if>>
													<label for="paramKey24_1"><span class="text">남</span></label>
												</span>
											</li>
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp unCheck" name="paramKey24" id="paramKey24_2" value="F" <c:if test="${resultData.teamUserSex3 eq 'F'}">checked="checked"</c:if>>
													<label for="paramKey24_2"><span class="text">여</span></label>
												</span>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">휴대전화</label></th>
								<td><input type="text" name="paramKey25" id="paramKey25" value="${cFn:decrypt(resultData.teamUserPhone3)}" class="mw365 vali_phone unCheck"></td>
							</tr>
							<tr>
								<th><label for="">E-mail</label></th>
								<td><input type="text" name="paramKey26" id="paramKey26" value="${cFn:decrypt(resultData.teamUserEmail3)}" class="mw365 unCheck"></td>
							</tr>
							<tr>
								<th colspan="2" class="txt_center"><label for=""><span class="red">*</span> 지도교사</label></th>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 성명</label></th>
								<td><input type="text" name="paramKey27" id="paramKey27" value="${resultData.teacherName}" class="mw365" vali-text="성명을 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 법정 생년월일</label></th>
								<td><input type="text" name="paramKey28" id="paramKey28" value="${resultData.teacherBirthDay}" class="mw365 datepicker" vali-text="법정 생년월일을 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 담당교과</label></th>
								<td><input type="text" name="paramKey29" id="paramKey29" value="${resultData.teacherSubject}" class="mw365" vali-text="담당교과를 입력해주세요."></td>
							</tr>
							<tr>
								<th scope="row"><label for=""><span class="red">*</span> 성별</label></th>
								<td>
									<div class="inp_chk_list">
										<ul class="list">
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp" name="paramKey30" id="paramKey30_1" value="M" vali-text="성별을 선택해주세요." <c:if test="${resultData.teacherSex eq 'M'}">checked="checked"</c:if>>
													<label for="paramKey30_1"><span class="text">남</span></label>
												</span>
											</li>
											<li>
												<span class="radio_area">
													<input type="radio" class="radio_inp" name="paramKey30" id="paramKey30_2" value="F" vali-text="성별을 선택해주세요." <c:if test="${resultData.teacherSex eq 'F'}">checked="checked"</c:if>>
													<label for="paramKey30_2"><span class="text">여</span></label>
												</span>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 휴대전화</label></th>
								<td><input type="text" id="paramKey31" name="paramKey31" value="${cFn:decrypt(resultData.teacherPhone)}" class="mw365 vali_phone" vali-text="휴대전화를 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> E-mail</label></th>
								<td><input type="text" id="paramKey32" name="paramKey32" value="${cFn:decrypt(resultData.teacherEmail)}" class="mw365" vali-text="E-mail을 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 위임장</label></th>
								<td>
									<div class="attach_area">
										<ul class="list">
											<li>
												<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="위임장을 업로드해주세요."/>
												<c:out value="${cFn:onUserFileInclude('fileTable1', 'fileDataList1', 1, 'pdf,jpg,bmp,gif,png', 10, 'MB', fileList1)}" escapeXml="false"/>
											</li>
										</ul>
									</div>
									<span class="text red">※ 파일명: 위임장-팀명</span>
									<span class="text">※ 형식: pdf, jpg, bmp, gif, png 등 이미지 파일</span>
									<span class="text">※ 최대 첨부용량: 10MB</span>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 아이디어 제안서</label></th>
								<td>
									<div class="attach_area">
										<ul class="list">
											<li>
												<input type="hidden" id="fileVali2" name="fileVali2" class="check custom" vali-text="아이디어 제안서를 업로드해주세요."/>
												<c:out value="${cFn:onUserFileInclude('fileTable2', 'fileDataList2', 1, 'hwp,pdf,zip', 10, 'MB', fileList2)}" escapeXml="false"/>
											</li>
										</ul>
									</div>
									<span class="text red">※ 파일명: 기업명-팀명-아이디어 명칭</span>
									<span class="text">※ 형식: 한글파일(hwp), PDF(pdf) 또는 압축파일(zip)로 첨부</span>
									<span class="text">※ 최대 첨부용량: 10MB</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="board_btn_area">
				<button type="button" class="btn_blue" onclick="fn_apply();">수정하기</button>
				<button type="button" class="btn_base" onclick="fn_cancel();">취소</button>
			</div>
		</div>
	</div>

</form:form>
</body>
