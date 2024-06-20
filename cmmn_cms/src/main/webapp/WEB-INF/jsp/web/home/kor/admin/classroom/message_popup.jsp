<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<html>
	<head>
		<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_css.jsp" %>
		<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_js.jsp" %>
		
		<script type="text/javascript">
		
			function fn_send() {
				if(fn_validation_check($('#cmmnForm'))) {
					if(confirm('전송 하시겠습니까?')) {
						$('#cmmnForm').attr('action', '${vo.selfPath}sendSmsReserve.act');
						$('#cmmnForm').submit();
					}
				}
				//window.close();				
			}

			function fn_cancel() {
				window.close();
			}			
			
			$(document).ready(function()
			{		
				$("#paramKey11").datepicker({
					dateFormat: "yy-mm-dd"
				});				
				
				$("#paramKey12").timepicker({
					step: 5,            //시간간격 : 5분
					timeFormat: "H:i"    //시간:분 으로표시
				});				
			});
</script>
	</head>
	<body style="padding: 20px;">

<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm">
    <form:hidden path="idx"/> <!-- 고유값 -->
    <form:hidden path="act" /> <!-- 상태값 -->
   
    <div id="view1">
        <!-- <div class="caption_title">
              	팝업창 설정 
        </div> -->
        <table class="board_write basic">
            <caption>작성</caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
            	<tr>
                    <th scope="row">발신일시<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>								
                    	<c:set var="now" value="<%=new java.util.Date()%>" />  
						<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
						<c:set var="sysTime"><fmt:formatDate value="${now}" pattern="HH:mm" /></c:set>
						<input type="text" id="paramKey11" name="paramKey11" class="datepicker" style="width: 20%;" maxlength="15" vali-text="발신일을 입력해 주세요." value="<c:out value='${sysDate}'/> "/>
						<input type="text" id="paramKey12" name="paramKey12" class="timepicker" style="width: 20%;" maxlength="15" vali-text="발신시간을 입력해 주세요." value="<c:out value='${sysTime}'/>"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">발신 번호<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
						<select  id="paramKey1" name="paramKey1"  title="발신번호를 선택하세요." vali-text="발신번호를 선택해 주세요.">
							<option value="">발신번호선택</option>
							<c:forEach items="${codeData}" var="clist" varStatus="status">							
							<option value='<c:out value="${clist.dataName}" />' <c:if test="${resultData.caller eq clist.dataName}"> selected</c:if>><c:out value="${clist.dataName}" /></option>
							</c:forEach>
						</select>                    

                    </td>
                </tr>
                <tr>
                    <th scope="row">수신 번호<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <textarea id="paramKey2" name="paramKey2" style="width: 100%; height: 50px; resize: none;" vali-text="수신 번호를 입력해 주세요."><c:out value="${phonenum}"/></textarea>
                        <ul style="display: inline-flex; width: 100%; margin-top: 10px;">
							<li style="text-align: left; width: 100%;"><span style="color:red">* 구분자는 , 또는 Enter 를 이용해주세요 ex) 010-0000-0000, 010-1111-1111, 010-2222-2222</span></li>
						</ul>
                    </td>
                </tr>
                <tr>
                    <th scope="row">발신 제목<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                    	<input type="text" id="paramKey3" name="paramKey3"  style="width: 100%;" maxlength="100" vali-text="제목을 입력해 주세요." value='<c:out value="${resultData.subject}"/>'/>
                    </td>
                </tr>                
                <tr>
                    <th scope="row">발신 내용<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                    	<textarea id="paramKey4" name="paramKey4"  style="width: 100%; height: 300px; resize: none;" maxlength="1000" vali-text="내용을 입력해 주세요."><c:out value="${resultData.content}"/></textarea>
                        <ul style="display: inline-flex; width: 100%; margin-top: 20px;">
							<li style="text-align: left; width: 50%;"><span style="color:red">* 장문 메시지. 최대 2,000 byte (한글 1,000자)까지 문자 전송 가능.</span></li>
						</ul>                    	
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- // board_write -->
    </div>
</form:form>

<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_send();" class="btn">보내기</a>
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">닫기</a>
</div>
	
		<script type="text/javascript" src="/js/cmmn/common_site.js"></script>
	</body>
</html>
