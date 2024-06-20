<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" />

<head>
    <script type="text/javascript" defer="defer">
        
	    function fn_edit(type) {
	    	if(fn_validation_check($('#cmmnForm'))) {
	    		var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
	    		var msg2 = type == 'Y' ?' 후 발송' :''; 
				if(confirm(msg+msg2+' 하시겠습니까?')) {
					$('#idx4').val(type);
					$('#cmmnForm').attr('action', '${selfPath}edit.act');
					$('#cmmnForm').submit();
				}
	    	}
	    	
	    }
        
        function fn_cancel(){
	        $('#act').remove();
	        $('#idx').remove();
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
    	function fn_member_popup(idx) {
    		$('#idx2').val(idx);
    		console.log("fn_member_popup");
    		console.log('idx::' + idx);
    		window.open('', 'member_popup', 'width=1200, height=500, top=200, left=200');
    		$('#memberForm').unbind();
    		$('#memberForm').attr('action', '${vo.selfPath}member_popup.do');
    		$('#memberForm').attr('target', 'member_popup');
    		$('#memberForm').attr('method', 'post');
    		$('#memberForm').submit();
    	}
    	
    	function fn_append_data(data) {
	    	var d = $('#paramKey2').val();
	    	$('#paramKey2').val(d+';'+data);
	    }
       
    </script>
</head>
<form:form commandName="commonVO" name="memberForm" id="memberForm" method="post"></form:form>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm">
    <form:hidden path="idx"/> <!-- 고유값 -->
    <form:hidden path="act" /> <!-- 상태값 -->
    <form:hidden path="pageIndex"/><!-- 페이징 -->
    <form:hidden path="searchValue3" />
    <form:hidden path="searchValue4" />
    <form:hidden path="searchKeyword2" />
   
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
                    <th scope="row">발신일<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <c:choose>
							<c:when test="${empty vo.idx}">
								<c:set var="now" value="<%=new java.util.Date()%>" />  
								<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
								<c:out value="${sysYear}"/>  
							</c:when>
							<c:otherwise><c:out value="${resultData.regDate}"/></c:otherwise>
						</c:choose>
                    </td>
                </tr>
                <tr>
                    <th scope="row">발신 번호<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
						<select  id="paramKey1" name="paramKey1"  title="발신번호를 선택하세요." >
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
                        <textarea id="paramKey2" name="paramKey2" style="width: 100%; height: 300px; resize: none;" vali-text="수신 번호를 입력해 주세요."><c:out value="${resultData.phone}"/></textarea>
                        <ul style="display: inline-flex; width: 100%; margin-top: 20px;">
							<li style="text-align: left; width: 50%;"><span style="color:red">* 구분자는 ; 또는 Enter 를 이용해주세요 ex)010-0000-0000;010-1111-1111;010-2222-2222<br/>회원검색 후 목록을 클릭하시면 자동으로 입력됩니다.</span></li>
							<li style="text-align: right; width: 50%;"><a href="javascript:void(0);" onclick="fn_member_popup();" class="right btn">회원검색</a></li>
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
	<a onclick="fn_edit('Y');" style="cursor: pointer;" class="right btn"><c:out value="SMS발송" /></a>
	<c:if test="${vo.act eq	'modify'}">
		<a href="javascript:void(0);" onclick="fn_remove();" style="cursor: pointer;" class="right btn delete">삭제</a>
	</c:if>	
    <a href="javascript:void(0);" onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">목록</a>
</div>