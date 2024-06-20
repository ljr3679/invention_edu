<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>
	function fn_cancel(){
		$("#idx").val("");
	    $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
	    $('#cmmnForm').submit();
	}
	
	function fn_cancellation() {
		if(confirm('신청취소 하시겠습니까?')) {
			var data = {'idx': $("#idx").val()};
			fn_cmmn_ajax("${vo.selfPath}apply_cancellation.ajax", false, data, 'json', function(res) {
				if(res) {
					if(res.result == "200") {
						alert("정상적으로 취소요청 되었습니다.");
						location.reload();
					}
				}
			});
		}
	}
	
	function fn_edit() {
		if(confirm('수정 하시겠습니까?')) {
			$('#cmmnForm').attr('action', '${vo.selfPath}apply_edit.do');
		    $('#cmmnForm').submit();
		}
	}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
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
								<td>
									<c:out value="${resultData.applyNumber}"/>
								</td>
							</tr>
							<tr>
								<th>아이디어 명칭</th>
								<td>
									<c:choose>
										<c:when test="${not empty resultData.ideaName}"><c:out value="${resultData.ideaName}"/></c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>팀명</th>
								<td>
									<c:choose>
										<c:when test="${not empty resultData.teamName}"><c:out value="${resultData.teamName}"/></c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for=""><span class="red">*</span> 아이디어 구분 </label></th>
								<td>
									<c:choose>
										<c:when test="${resultData.ideaGubun eq 'A'}">자유과제</c:when>
										<c:when test="${resultData.ideaGubun eq 'B'}">
											전문교과과제(전공 : <c:out value="${resultData.ideaGubunText}"/>)
										</c:when>
										<c:when test="${resultData.ideaGubun eq 'C'}">
											협력기업과제(협력기업 명 : <c:out value="${resultData.ideaGubunText}"/>)
										</c:when>
										<c:when test="${resultData.ideaGubun eq 'D'}">
											테마과제(분류번호 : <c:out value="${resultData.ideaGubunText}"/>)
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for=""><span class="red">*</span> 학교</label></th>
								<td>
									<c:out value="${resultData.school}"/>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 학교유형 </label></th>
								<td>
									<c:choose>
										<c:when test="${resultData.schoolType eq 'A'}">특성화고</c:when>
										<c:when test="${resultData.schoolType eq 'B'}">마이스터고</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 학교주소</label></th>
								<td>
									<c:out value="${resultData.zipCode}"/><br>
									<c:out value="${resultData.address}"/><br>
									<c:out value="${resultData.addressDetail}"/>
								</td>
							</tr>
							<tr>
								<th colspan="2" class="txt_center"><label for=""><span class="red">*</span> 팀원1(대표학생)</label></th>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 성명</label></th>
								<td><c:out value="${resultData.teamUserName1}"/></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 법정 생년월일</label></th>
								<td><c:out value="${resultData.teamUserBirthDay1}"/></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 학년</label></th>
								<td>
									<c:out value="${resultData.teamUserGrade1}"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for=""><span class="red">*</span> 성별</label></th>
								<td>
									<c:choose>
										<c:when test="${resultData.teamUserSex1 eq 'M'}">남자</c:when>
										<c:when test="${resultData.teamUserSex1 eq 'F'}">여자</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 휴대전화</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teamUserPhone1)}"/></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> E-mail</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teamUserEmail1)}"/></td>
							</tr>
							
							<c:if test="${not empty resultData.teamUserName2 or not empty resultData.teamUserBirthDay2 or not empty resultData.teamUserGrade2 or not empty resultData.teamUserSex2 or not empty resultData.teamUserPhone2 or not empty resultData.teamUserEmail2}">
							<tr>
								<th colspan="2" class="txt_center"><label for="">팀원2</label></th>
							</tr>
							<tr>
								<th><label for="">성명</label></th>
								<td><c:out value="${resultData.teamUserName2}"/></td>
							</tr>
							<tr>
								<th><label for="">법정 생년월일</label></th>
								<td><c:out value="${resultData.teamUserBirthDay2}"/></td>
							</tr>
							<tr>
								<th><label for="">학년</label></th>
								<td>
									<c:out value="${resultData.teamUserGrade2}"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="">성별</label></th>
								<td>
									<c:choose>
										<c:when test="${resultData.teamUserSex2 eq 'M'}">남자</c:when>
										<c:when test="${resultData.teamUserSex2 eq 'F'}">여자</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th><label for="">휴대전화</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teamUserPhone2)}"/></td>
							</tr>
							<tr>
								<th><label for="">E-mail</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teamUserEmail2)}"/></td>
							</tr>
							</c:if>

							<c:if test="${not empty resultData.teamUserName3 or not empty resultData.teamUserBirthDay3 or not empty resultData.teamUserGrade3 or not empty resultData.teamUserSex3 or not empty resultData.teamUserPhone3 or not empty resultData.teamUserEmail3}">
							<tr>
								<th colspan="2" class="txt_center"><label for="">팀원3</label></th>
							</tr>
							<tr>
								<th><label for="">성명</label></th>
								<td><c:out value="${resultData.teamUserName3}"/></td>
							</tr>
							<tr>
								<th><label for="">법정 생년월일</label></th>
								<td><c:out value="${resultData.teamUserBirthDay3}"/></td>
							</tr>
							<tr>
								<th><label for="">학년</label></th>
								<td>
									<c:out value="${resultData.teamUserGrade3}"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="">성별</label></th>
								<td>
									<c:choose>
										<c:when test="${resultData.teamUserSex3 eq 'M'}">남자</c:when>
										<c:when test="${resultData.teamUserSex3 eq 'F'}">여자</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th><label for="">휴대전화</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teamUserPhone3)}"/></td>
							</tr>
							<tr>
								<th><label for="">E-mail</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teamUserEmail3)}"/></td>
							</tr>
							</c:if>

							<tr>
								<th colspan="2" class="txt_center"><label for=""><span class="red">*</span> 지도교사</label></th>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 성명</label></th>
								<td><c:out value="${resultData.teacherName}"/></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 법정 생년월일</label></th>
								<td><c:out value="${resultData.teacherBirthDay}"/></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 담당교과</label></th>
								<td><c:out value="${resultData.teacherSubject}"/></td>
							</tr>
							<tr>
								<th scope="row"><label for=""><span class="red">*</span> 성별</label></th>
								<td>
									<c:choose>
										<c:when test="${resultData.teacherSex eq 'M'}">남자</c:when>
										<c:when test="${resultData.teacherSex eq 'F'}">여자</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 휴대전화</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teacherPhone)}"/></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> E-mail</label></th>
								<td><c:out value="${cFn:decrypt(resultData.teacherEmail)}"/></td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 위임장</label></th>
								<td>
									<div class="attach_area">
										<ul class="list">
											<c:forEach items="${fileList1}" var="list" varStatus="status">
												<li><a href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')"><i class="file xi-paperclip"></i>${list.attachName}</a></li> 
											</c:forEach>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for=""><span class="red">*</span> 아이디어 제안서</label></th>
								<td>
									<div class="attach_area">
										<ul class="list">
											<c:forEach items="${fileList2}" var="list" varStatus="status">
												<li><a href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')"><i class="file xi-paperclip"></i>${list.attachName}</a></li> 
											</c:forEach>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="board_btn_area">
				<!--모집기간 일시에만 신청취소/ 수정 버튼 노출-->
				<c:if test="${resultData.mojibAt eq 'B'}">
					<c:if test="${resultData.useAt eq 'A'}">
						<button type="button" class="btn_red" onclick="fn_cancellation();">신청취소</button>	
					</c:if>
				</c:if>
				<button type="button" class="btn_blue" onclick="fn_edit();">수정</button>
				<!--/모집기간 일시에만 신청취소/ 수정 버튼 노출-->
				<button type="button" class="btn_base" onclick="fn_cancel();">목록</button>
			</div>
		</div>
	</div>
</form:form>
</body>
