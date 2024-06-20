<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">

	function fn_edit2() {
		if(confirm('저장 하시겠습니까?')) {
			$('#cmmnForm').attr('action', '${vo.selfPath}edit2.act');
			$('#cmmnForm').submit();
		}
	}

	function fn_cancel(){
        $('#act2').remove();
        $('#idx2').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}edit.do');
        $('#cmmnForm').submit();
    }
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="idx2"/>
<form:hidden path="act2"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="pageIndex2"/><!-- 페이징 -->
<form:hidden path="tabPos"/>
<form:hidden path="searchValue4" /> <!-- 메뉴명 -->
<form:hidden path="searchValue5" />
<form:hidden path="searchValue6" />
<form:hidden path="searchValue7" />
<form:hidden path="searchKeyword2" /> <!-- 메뉴명 -->
<!-- board_write -->
<div class="caption_title">· 모집공고 정보</div>
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">접수상태 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td>
				<select id="paramKey1" name="paramKey1" class="join_select1" style="width:150px;">
					<option value="A"<c:if test="${resultData2.useAt eq 'A'}">selected="seleted"</c:if>>접수완료</option>
					<option value="B"<c:if test="${resultData2.useAt eq 'B'}">selected="seleted"</c:if>>접수취소</option>
				</select>
			</td>
        </tr>
		<tr>
			<th scope="row">제목 </th> 
			<td>
				<c:out value="${resultData2.title}" />
			</td>
		</tr>
		<tr>
			<th scope="row">모집기간 </th>
			<td>
				<c:out value="${resultData2.startDate}"/>
				~
				<c:out value="${resultData2.endDate}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">접수번호 </th>
			<td>
				<c:out value="${resultData2.applyNumber}"/>
			</td>
		</tr>
		<%-- <tr>
			<th scope="row">비빌번호 </th>
			<td>
				<c:out value="${resultData2.pw}"/>
			</td>
		</tr> --%>
		<tr>
			<th scope="row">아이디어 명칭 </th>
			<td>
				<c:out value="${resultData2.ideaName}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">팀명 </th>
			<td>
				<c:out value="${resultData2.teamName}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">아이디어 구분 </th>
			<td>
				<c:choose>
					<c:when test="${resultData2.ideaGubun eq 'A'}">
						<c:out value="자유과제"/>
					</c:when>
					<c:when test="${resultData2.ideaGubun eq 'B'}"> 
						<c:out value="전문교과과제"/>
					</c:when>
					<c:when test="${resultData2.ideaGubun eq 'C'}">
						<c:out value="협력기업과제"/>
					</c:when>
					<c:when test="${resultData2.ideaGubun eq 'D'}">
						<c:out value="테마과제"/>
					</c:when>
					<c:otherwise><c:out value="-" /></c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th scope="row">학교 </th>
			<td>
				<c:out value="${resultData2.school}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">학교 유형 </th>
			<td>
				<c:choose>
					<c:when test="${resultData2.schoolType eq 'A'}">
						<c:out value="특성화고"/>
					</c:when>
					<c:when test="${resultData2.schoolType eq 'B'}">
						<c:out value="마이스터고"/>
					</c:when>
					<c:otherwise><c:out value="-"/></c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th scope="row">학교주소 </th>
			<td>
				<c:out value="${resultData2.zipCode}"/><br/>
				<c:out value="${resultData2.address}"/><br/>
				<c:out value="${resultData2.addressDetail}"/>
			</td>
		</tr>
	</tbody>
</table>
<c:if test="${not empty resultData2.teamUserName1 and not empty resultData2.teamUserPhone1 and not empty resultData2.teamUserEmail1}">
	<div class="caption_title">· 팀원1 (태표학생)</div>
	<table class="board_write basic">
		<caption>작성</caption>
		<colgroup>
			<col style="width:20%;">
			<col style="width:atuo;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">성명 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserName1}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserName1}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">법정 생년월일  </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserBirthDay1}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserBirthDay1}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">학년 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserGrade1}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserGrade1}학년" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">성별 </th>
				<td>
					<c:choose>
						<c:when test="${resultData2.teamUserSex1 eq 'M'}">
							<c:out value="남자"/>
						</c:when>
						<c:when test="${resultData2.teamUserSex1 eq 'F'}">
							<c:out value="여자"/>
						</c:when>
						<c:otherwise><c:out value="-"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">휴대전화 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserPhone1}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teamUserPhone1)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserEmail1}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teamUserEmail1)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</c:if>

<c:if test="${not empty resultData2.teamUserName2 and not empty resultData2.teamUserPhone2 and not empty resultData2.teamUserEmail2}">
	<div class="caption_title">· 팀원2</div>
	<table class="board_write basic">
		<caption>작성</caption>
		<colgroup>
			<col style="width:20%;">
			<col style="width:atuo;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">성명 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserName2}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserName2}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">법정 생년월일  </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserBirthDay2}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserBirthDay2}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">학년 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserGrade2}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserGrade2}학년"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">성별 </th>
				<td>
					<c:choose>
						<c:when test="${resultData2.teamUserSex2 eq 'M'}">
							<c:out value="남자"/>
						</c:when>
						<c:when test="${resultData2.teamUserSex2 eq 'F'}">
							<c:out value="여자"/>
						</c:when>
						<c:otherwise><c:out value="-"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">휴대전화 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserPhone2}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teamUserPhone2)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserEmail2}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teamUserEmail2)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</c:if>

<c:if test="${not empty resultData2.teamUserName3 and not empty resultData2.teamUserPhone3 and not empty resultData2.teamUserEmail3}">
	<div class="caption_title">· 팀원3</div>
	<table class="board_write basic">
		<caption>작성</caption>
		<colgroup>
			<col style="width:20%;">
			<col style="width:atuo;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">성명 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserName3}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserName3}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">법정 생년월일  </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserBirthDay3}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserBirthDay3}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">학년 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserGrade3}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teamUserGrade3}학년" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">성별 </th>
				<td>
					<c:choose>
						<c:when test="${resultData2.teamUserSex3 eq 'M'}">
							<c:out value="남자"/>
						</c:when>
						<c:when test="${resultData2.teamUserSex3 eq 'F'}">
							<c:out value="여자"/>
						</c:when>
						<c:otherwise><c:out value="-"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">휴대전화 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserPhone3}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teamUserPhone3)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teamUserEmail3}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teamUserEmail3)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</c:if>

<c:if test="${not empty resultData2.teacherName and not empty resultData2.teacherPhone and not empty resultData2.teacherEmail}">
	<div class="caption_title">· 지도교사</div>
	<table class="board_write basic">
		<caption>작성</caption>
		<colgroup>
			<col style="width:20%;">
			<col style="width:atuo;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">성명 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teacherName}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teacherName}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">법정 생년월일 </th> 
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teacherBirthDay}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teacherBirthDay}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">담당교과 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teacherSubject}">-</c:when>
						<c:otherwise>
							<c:out value="${resultData2.teacherSubject}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">성별 </th>
				<td>
					<c:choose>
						<c:when test="${resultData2.teacherSex eq 'M'}">
							<c:out value="남자"/>
						</c:when>
						<c:when test="${resultData2.teacherSex eq 'F'}">
							<c:out value="여자"/>
						</c:when>
						<c:otherwise><c:out value="-"/></c:otherwise>
					</c:choose>
					
				</td>
			</tr>
			<tr>
				<th scope="row">휴대전화 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teacherPhone}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teacherPhone)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일 </th>
				<td>
					<c:choose>
						<c:when test="${empty resultData2.teacherEmail}">-</c:when>
						<c:otherwise>
							<c:out value="${cFn:decrypt(resultData2.teacherEmail)}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">위임장 </th>
				<td>
					<c:choose>
						<c:when test="${not empty fileList1}">
							<c:forEach items="${fileList1}" var="file" varStatus="status">
								<p><a href="javascript:void(0);" id="file${status.count}" onclick="cmmn_file_down('${file.attachName}','${file.attachReName}')">${file.attachName}</a></p>
							</c:forEach>
						</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">아이디어 제안서 </th>
				<td>
					<c:choose>
						<c:when test="${not empty fileList2}">
							<c:forEach items="${fileList2}" var="file" varStatus="status">
								<p><a href="javascript:void(0);" id="file${status.count}" onclick="cmmn_file_down('${file.attachName}','${file.attachReName}')">${file.attachName}</a></p>
							</c:forEach>
						</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</c:if>	
	
<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit2();" class="btn"><c:out value="저장"/></a>
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
</body>