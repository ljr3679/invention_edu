<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
		if(fn_validation_check($('#cmmnForm'))) {
			if(confirm('저장 하시겠습니까?')) {
				$('#cmmnForm').attr('action', '${vo.selfPath}courseEdit.act');
				$('#cmmnForm').attr('target', '');
				$('#cmmnForm').attr('method', 'post');				
				$('#cmmnForm').submit();
			}
		}
	}

	function fn_cancel(){
        $('#act').remove();
        $('#idx').remove();
        $('#cmmnForm').attr('action', '${vo.selfPath}courseList.do');
        $('#cmmnForm').submit();
    }

	function fn_member_popup(idx) {
		$('#idx2').val(idx);
		window.open('', 'member_popup', 'width=1000, height=700, top=200, left=200');
		$('#cmmnForm').unbind();
		$('#cmmnForm').attr('action', '${vo.selfPath}member_popup.do');
		$('#cmmnForm').attr('target', 'member_popup');
		$('#cmmnForm').attr('method', 'post');
		$('#cmmnForm').submit();
	}	
	
	function fn_append_data(name,phone) {
		$('#paramKey9').val(name);
		$('#paramKey13').val(phone);
    }	
	
	function fn_teammember_popup(idx) {
		$('#idx2').val(idx);
		window.open('', 'tmember_popup', 'width=1000, height=700, top=200, left=200');
		$('#cmmnForm').unbind();
		$('#cmmnForm').attr('action', '${vo.selfPath}teammember_popup.do');
		$('#cmmnForm').attr('target', 'tmember_popup');
		$('#cmmnForm').attr('method', 'post');
		$('#cmmnForm').submit();
	}	
	
	function fn_append_data2(name,phone) {
    	var d = $('#paramKey10').val();
    	var p = $('#paramKey18').val();
    	if(d==''){
    		$('#paramKey10').val(name);
    		$('#paramKey18').val(phone);
    	} else {
    		$('#paramKey10').val(d+','+name);
    		$('#paramKey18').val(p+','+phone);
    	}
    }		

	function fn_delete() {
		if(confirm('삭제 하시겠습니까?')) {
			$('#act').val('delete');
			$('#cmmnForm').attr('action', "${vo.selfPath}courseEdit.act");
			$('#cmmnForm').submit();
		}
	}	
	
	
	function fn_message_popup() {
		var pnum = $('#paramKey13').val() + ',' + $('#paramKey18').val() 
		$('#phonenum').val(pnum);
		window.open('', 'message_popup', 'width=700, height=700, top=200, left=200');
		$('#cmmnForm').unbind();
		$('#cmmnForm').attr('action', '${vo.selfPath}message_popup.do');
		$('#cmmnForm').attr('target', 'message_popup');
		$('#cmmnForm').attr('method', 'post');
		$('#cmmnForm').submit();
	}	
	
	
	$("#paramKey11").timepicker({
		step: 5,            //시간간격 : 5분
		timeFormat: "H:i"    //시간:분 으로표시
	});	

	$("#paramKey12").timepicker({
		step: 5,            //시간간격 : 5분
		timeFormat: "H:i"    //시간:분 으로표시
	});		
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="searchValue1" /> <!-- 검색조건 -->
<form:hidden path="searchKeyword" /> <!-- 키워드 -->
<input type="hidden" name="phonenum" id="phonenum"/>
<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">연도</th>
			<td>
				<select id="paramKey1" name="paramKey1" class="join_select1" vali-text="수상년도를 선택해주세요." style="width:150px;">
					<c:forEach items="${yearList}" var="value" varStatus="status">
						<option value="${value}"<c:if test="${resultData.year eq value}">selected="selected"</c:if>>${value}</option>
					</c:forEach>
				</select>
			</td>
		</tr>	
		<tr>
			<th scope="row">코드</th>
			<td>
				<input type="text" id="paramKey2" name="paramKey2" vali-text="코드을 입력해주세요." value="${resultData.classCd}" style="width: 70px;"/>
			</td>
		</tr>
		<tr>
			<th scope="row">학교명</th>
			<td>
				<input type="text" id="paramKey3" name="paramKey3" vali-text="학교명을 입력해주세요." value="${resultData.schoolNm}" style="width: 30%;" />
			</td>
		</tr>		
		<tr>
			<th scope="row">시도교육청</th>
			<td>
				<input type="text" id="paramKey4" name="paramKey4" vali-text="시도교육청을 입력해주세요." value="${resultData.sidoEdu}" style="width: 30%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">교육기관</th>
			<td>
				<input type="text" id="paramKey5" name="paramKey5" vali-text="교육기관을 입력해주세요." value="${resultData.eduAgency}" style="width: 30%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">프로그램</th>
			<td>
				<select  id="paramKey15" name="paramKey15" class="join_select1"  title="프로그램을 선택하세요."  style="width:150px;">
					<c:forEach items="${codeData}" var="clist" varStatus="status">							
					<option value='<c:out value="${clist.dataName}" />' <c:if test="${resultData.progrmCd eq clist.dataName}"> selected</c:if>><c:out value="${clist.dataName}" /></option>
					</c:forEach>
				</select>      				
				
			</td>
		</tr>
		<tr>
			<th scope="row">학생수</th>
			<td>
				<input type="text" id="paramKey6" name="paramKey6" vali-text="학생수를 입력해주세요." value="${resultData.studentCnt}" style="width: 10%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">학제</th>
			<td>
				<select id="paramKey7" name="paramKey7" class="join_select1" vali-text="학제를 선택해주세요." style="width:150px;">
					<option value="초등" <c:if test="${resultData.schoolGrade eq '초등'}">selected="selected"</c:if>>초등</option>
					<option value="초/중" <c:if test="${resultData.schoolGrade eq '초/중'}">selected="selected"</c:if>>초/중</option>
					<option value="중등" <c:if test="${resultData.schoolGrade eq '중등'}">selected="selected"</c:if>>중등</option>
					<option value="중/고" <c:if test="${resultData.schoolGrade eq '중/고'}">selected="selected"</c:if>>중/고</option>
					<option value="고등" <c:if test="${resultData.schoolGrade eq '고등'}">selected="selected"</c:if>>고등</option>
				</select>			
			</td>
		</tr>		
		<tr>
			<th scope="row">참조</th>
			<td>
				<input type="text" id="paramKey14" name="paramKey14" vali-text="참조를 입력해주세요." value="${resultData.reference}" style="width: 50%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">수업명</th>
			<td>
				<input type="text" id="paramKey8" name="paramKey8" vali-text="수업명을 입력해주세요." value="${resultData.classTitle}" style="width: 100%;" />
			</td>
		</tr>		
		<tr>
			<th scope="row">운영보고서</th>
			<td>
				<input type="text" id="paramKey16" name="paramKey16" vali-text="운영보고서를 입력해주세요." value="${resultData.reportsUrl}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">담당교사</th>
			<td>
				<input type="text" id="paramKey9" name="paramKey9" vali-text="담당교사를 입력해주세요." value="${resultData.chargeReader}" style="width: 20%;" />
				<a href="javascript:void(0);" onclick="fn_member_popup();" class="right btn">회원검색</a>
			</td>
		</tr>
		<tr>
			<th scope="row">연락처</th>
			<td>
				<input type="text" id="paramKey13" name="paramKey13" vali-text="연락처를 입력해주세요." value="${resultData.phone}" style="width: 20%;" />
			</td>
		</tr>		
		<tr>
			<th scope="row">강사진</th>
			<td>
				<input type="text" id="paramKey10" name="paramKey10" vali-text="강사진을 입력해주세요." value="${resultData.chargeTeam}" style="width: 50%;" />
				<a href="javascript:void(0);" onclick="fn_teammember_popup();" class="right btn">회원검색</a>
			</td>
		</tr>
		<tr>
			<th scope="row">연락처</th>
			<td>
				<input type="text" id="paramKey18" name="paramKey18" vali-text="연락처를 입력해주세요." value="${resultData.teamPhone}" style="width: 50%;" />
			</td>
		</tr>		
		<tr>
			<th scope="row">특강시간</th>
			<td>
				<input type="text" id="paramKey11" name="paramKey11" vali-text="특강시작시간을 입력해주세요." value="${resultData.eduStartTime}" style="width: 10%;" />
				~ <input type="text" id="paramKey12" name="paramKey12" vali-text="특강종료시간을 입력해주세요." value="${resultData.eduEndTime}" style="width: 10%;" />
			</td>
		</tr>

		<tr>
			<th scope="row">준비물</th>
			<td>
				<input type="text" id="paramKey17" name="paramKey17" vali-text="준비물을 입력해주세요." value="${resultData.materials}" style="width: 100%;" />
			</td>
		</tr>
	</tbody>
</table>

<!-- // board_write -->
<div style="float:left;margin-top:20pt;">
	<a href="javascript:void(0);" onClick="fn_message_popup();" class="btn restore">예약문자</a>
</div>
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn">저장</a>
	<a href="javascript:void(0);" onClick="fn_delete();" class="btn">삭제</a>
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->
