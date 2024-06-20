<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" />

<head>
    <script type="text/javascript" defer="defer">
        
        function fn_edit(){
        	$.each($('textarea[editor=Y]'), function(index, item) {
    			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
        		$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
    		});
        	if(fn_validation_check($('#cmmnForm'))) {
        		if($("#paramKey5").val()<400){
        			alert("400이상의 정수만 입력 가능합니다.")
        			$("#paramKey5").focus();
        			return false;
        		}
        		
        		if($("#paramKey6").val()<400){
        			alert("400이상의 정수만 입력 가능합니다.")
        			$("#paramKey6").focus();
        			return false;
        		}
        		
        		if($("#paramKey7").val()<50){
        			alert("팝업창 위치설정 50이상의 정수만 입력 가능합니다.")
        			$("#paramKey7").focus();
        			return false;
        		}
        		
        		if($("#paramKey8").val()<50){
        			alert("팝업창 위치설정 50이상의 정수만 입력 가능합니다.")
        			$("#paramKey8").focus();
        			return false;
        		}
        		
        		var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
    			if(confirm(msg+' 하시겠습니까?')) {
    				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
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
       
    </script>
</head>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm">
    <form:hidden path="idx"/> <!-- 고유값 -->
    <form:hidden path="act" /> <!-- 상태값 -->
    <form:hidden path="pageIndex"/><!-- 페이징 -->
    <form:hidden path="searchValue1" /> <!-- 메뉴명 -->
    <form:hidden path="searchKeyword" /> <!-- 메뉴명 -->
    
    <div id="view1">
        <div class="caption_title">
              	팝업창 설정 
        </div>
        <table class="board_write basic">
            <caption>작성</caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">공개여부<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData.useAt eq 'Y' or vo.act eq 'regist'}">checked="checked"</c:if> value="Y" vali-text="공개여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">공개</label>
                    	<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="공개여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">비공개</label>
                    </td>
                </tr>
                <tr>
                    <th scope="row">제목<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey2" name="paramKey2" style="width: 100%;" value="${resultData.title}" vali-text="제목을 입력해주새요."/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">게시기간 설정<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey3" name="paramKey3" class="datepicker" onChange="datepicker_start('paramKey3','paramKey4')" style="width: 150px; cursor: pointer;" vali-text="게시 시작일을 선택해주새요." readonly="readonly" value="${resultData.startDate}"/>
						~
						<input type="text" id="paramKey4" name="paramKey4" class="datepicker" onChange="datepicker_start('paramKey3','paramKey4')" style="width: 150px; cursor: pointer;" vali-text="게시 종료일을 선택해주새요." readonly="readonly" value="${resultData.endDate}"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">팝업창 크기<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <label for="paramKey3">가로</label>
                        <input type="text" id="paramKey5" name="paramKey5" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');" style="width: 150px;" numberOnly value="${resultData.horizontalWidth}"/ maxlength="5" vali-text="가로 팝업 크기를 입력해주세요.">
						<label for="paramKey4" style="margin-left: 15px;">세로</label>
						<input type="text" id="paramKey6" name="paramKey6" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');" style="width: 150px;" numberOnly value="${resultData.verticalWidth}"/ maxlength="5" vali-text="세로 팝업 크기를  입력해주세요.">
                    	<div style="margin-top:5px; ">
                           <label for="paramKey6" style="color: gray; font-size: 14px;"> ※ 400이상 정수만 입력가능  ex)400</label>
                       </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">팝업창 위치설정<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                    	<label for="paramKey7">X : </label>
                        <input type="text" id="paramKey7" name="paramKey7" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');" style="width: 150px;" numberOnly  value="${resultData.xLocation}" maxlength="5" vali-text="X: 팝업위치를 입력해주세요.">
						<label for="paramKey8" style="margin-left: 15px;">Y :</label>
						<input type="text" id="paramKey8" name="paramKey8" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'');" style="width: 150px;" numberOnly value="${resultData.yLocation}" maxlength="5" vali-text="Y : 팝업위치를 입력해주세요."/>
                    	<div style="margin-top:5px; ">
                           <label for="paramKey8" style="color: gray; font-size: 14px;">정수만 입력 가능하며 예시: X:50 Y: 50 <br> 팝업창이 2개 이상 메인에 표시될 경우, 위치 값이 없으면 팝업창이 겹쳐져 표시됩니다</label>	
                       </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">내용<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                    	<textarea id="paramKey9" name="paramKey9" editor="Y" style="width: 100%; height: 300px; resize: none;" vali-text="내용을 입력해 주세요."><c:out value="${resultData.content}" escapeXml="false"/></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- // board_write -->
    </div>
</form:form>

<div class="btn_wrap">
	<a href="javascript:void(0);" onclick="fn_edit();" style="cursor: pointer;" class="right btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}" /></a>
	<c:if test="${vo.act eq	'modify'}">
		<a href="javascript:void(0);" onclick="fn_remove();" style="cursor: pointer;" class="right btn delete">삭제</a>
	</c:if>	
    <a href="javascript:void(0);" onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">목록</a>
</div>