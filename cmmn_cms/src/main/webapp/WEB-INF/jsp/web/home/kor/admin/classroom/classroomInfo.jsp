<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript">

	function fn_cancel(){
        $('#cmmnForm').attr('action', '${vo.selfPath}classroomList.do');
        $('#cmmnForm').submit();
    }

	
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">

<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">코드</th>
			<td>
				${course.id}
			</td>
		</tr>
		<tr>
			<th scope="row">수업명</th>
			<td>
				${course.name}
			</td>
		</tr>	
		<tr>
			<th scope="row">제목</th>
			<td>
				${course.descriptionHeading}
			</td>
		</tr>	
		<tr>
			<th scope="row">섹선</th>
			<td>
				${course.section}
			</td>
		</tr>	
		<tr>
			<th scope="row">수업링크</th>
			<td>
				${course.alternateLink}
			</td>
		</tr>		
		<tr>
			<th scope="row">성적표 세팅</th>
			<td>
				${course.gradebookSettings.calculationType}
			</td>
		</tr>
		<tr>
			<th scope="row">구글 드라이브 주소</th>
			<td>
				${course.teacherFolder.alternateLink}
			</td>
		</tr>
		<tr>
			<th scope="row">그룹 Email</th>
			<td>
				${course.courseGroupEmail}
			</td>
		</tr>		
		
		<tr>
			<th scope="row">수업 상태</th>
			<td>
				${course.courseState}
			</td>
		</tr>
		<tr>
			<th scope="row">등록일</th>
			<td>
				${course.creationTime}
			</td>
		</tr>				
	</tbody>
</table>

<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
</body>