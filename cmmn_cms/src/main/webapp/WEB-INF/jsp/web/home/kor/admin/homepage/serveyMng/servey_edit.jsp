<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" />
<script type="text/javascript" defer="defer">
	function fn_cancel() {
		$('#act2').val('');
		$('#idx2').val('');
		$('#cmmnForm').attr('action', '${selfPath}servey_list.do');
		$('#cmmnForm').submit();
	}
</script>
<style>
	[disabled=disabled] {background-color: white;}
</style>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="idx2"/>
<form:hidden path="act"/>
<form:hidden path="act2"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchValue1"/>
<form:hidden path="searchValue2"/>
<form:hidden path="searchKeyword"/>

    <div id="view1">
        <table class="board_write basic">
            <caption>작성</caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
            	 <tr>
                    <th scope="row">설문제목</th>
                    <td><c:out value="${resultData.title}" /></td>
                </tr>
                <tr>
                    <th scope="row">성명</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${not empty resultData.name}"><c:out value="${resultData.name}" /></c:when>
                    		<c:otherwise>-</c:otherwise>
                    	</c:choose>
                    </td>
                </tr>
                <tr>
                    <th scope="row">ID</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${not empty resultData.id}"><c:out value="${resultData.id}" /></c:when>
                    		<c:otherwise>-</c:otherwise>
                    	</c:choose>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- // board_write -->
    </div>
    <div class="sch_bar_box clearfix" style="margin-top: 30px;">
      <p class="total_txt" style="font-size: 20px;">■ 설문내용</p>                           
	</div>
    <div id="view1">
        <table class="board_write basic">
            <caption>작성</caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
            <c:forEach items="${resultSubDataList}" var="list" varStatus="status">
				<tr>
					<th scope="row">설문${status.count}</th>
					<td colspan="3">
						<input type="hidden" name="dumyList" value="${status.count}"/>
						<input type="hidden" name="paramKeyList1" value="${list.no}"/>
						<input type="hidden" name="paramKeyList2" value="${list.surveyType}"/>
						
						<input type="text" id="paramKeyList3" name="paramKeyList3" value="${list.surveyTitle}" style="width: 100%;" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<th scope="row">답변${status.count}</th>
					<c:choose>
						<c:when test="${list.surveyType eq 'A'}">
							<c:set var="surveyText" value="${fn:split(list.surveyText,'[-g-]')}" />
							
							<td colspan="3">
							<c:forEach items="${surveyText}" var="list2" varStatus="status2">
								<input type="radio" class="an_radio unCheck" <c:if test="${list.answer eq status2.index+1}">checked="checked"</c:if> disabled="disabled"/>
								<input type="text" name="surveyTx${status.count}" style="width: 100px;" value="${list2}"/>
			  				</c:forEach>
							</td>
						</c:when>
						<c:when test="${list.surveyType eq 'B'}">
							<td colspan="3">
								<input type="hidden" name="surveyTx${status.count}" value="-1"/>
								${list.answer}
							</td>
						</c:when>
					</c:choose>
				</tr>
				</c:forEach>
            </tbody>
        </table>

        <!-- // board_write -->
    </div>
</form:form>

<div class="btn_wrap">
    <a onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">목록</a>
</div>