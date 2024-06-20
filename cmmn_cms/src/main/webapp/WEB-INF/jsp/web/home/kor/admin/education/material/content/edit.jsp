<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" />

<head>
    <script type="text/javascript" defer="defer">
        
        function fn_edit(){
        	$.each($('textarea[editor=Y]'), function(index, item) {
    			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
        		$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
    		});
        	if(fn_validation_check($('#cmmnForm'),fn_custom_vali)) {
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
    	function fn_custom_vali(obj, index) {
    		if($(obj).attr('name') == 'fileVali2') {
    			if($(obj).next().find('.kssFileBody').find('li').length == 0) {
    				return false;
    			}
    		}
    		if($(obj).attr('name') == 'fileVali1') {
    			if($(obj).next().find('.kssFileBody').find('li').length == 0) {
    				return false;
    			}
    		}
    		return true;
    	}
       
    </script>
</head>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm">
    <form:hidden path="idx"/> <!-- 고유값 -->
    <form:hidden path="act" /> <!-- 상태값 -->
    <form:hidden path="pageIndex"/><!-- 페이징 -->
    <form:hidden path="searchValue1" /> <!-- 메뉴명 -->
    <form:hidden path="searchValue2" /> <!-- 메뉴명 -->
    <form:hidden path="searchKeyword" /> <!-- 메뉴명 -->
    
    <div id="view1">
        <table class="board_write basic">
            <caption>작성</caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">사용여부 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData.useAt eq 'Y' or vo.act eq 'regist'}">checked="checked"</c:if> value="Y" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">사용</label>
                    	<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">미사용</label>
                    </td>
                </tr>
                <tr>
                	<th scope="row">구분 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
					<td>
						<select id="paramKey2" name="paramKey2" class="join_select1" vali-text="구분을 선택해주세요." style="width:300px;">
							<option value="">전체</option> 
							<c:forEach items="${type}" var="list" varStatus="status">
								<option value="${list.no}"<c:if test="${resultData.typeRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
							</c:forEach>
						</select>
					</td>
                </tr>
                <tr>
                    <th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey3" name="paramKey3" style="width: 100%;" value="${resultData.title}" vali-text="제목을 입력해주새요."/>
                    </td>
                </tr>
                <tr>
					<th scope="row">썸네일 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
					<td colspan="3">
						<input type="hidden" id="fileVali2" name="fileVali2" class="check custom" vali-text="이미지를 업로드해주세요."/>
						<c:out value="${cFn:kssFileInclude('fileDataList2', 1, 'png,jpg,jpeg', 100, 'MB', true, fileList2)}" escapeXml="false"/>
					</td>
				</tr>
                <tr>
					<th scope="row">첨부파일 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
					<td colspan="3">
						<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="첨부파일을 업로드해주세요."/>
						<c:out value="${cFn:kssFileInclude('fileDataList1', 1, 'pdf', 100, 'MB', true, fileList1)}" escapeXml="false"/>
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