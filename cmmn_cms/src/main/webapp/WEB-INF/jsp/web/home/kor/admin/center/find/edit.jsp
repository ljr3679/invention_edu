<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" />

<head>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@globals['gbls.kakao.key']" />&libraries=services,clusterer"></script>
    <script type="text/javascript" defer="defer">
        
        function fn_edit(){
        	$.each($('textarea[editor=Y]'), function(index, item) {
    			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
        		$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
    		});
        	if(fn_validation_check($('#cmmnForm'),custom_check)) {
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
    	/* function fn_custom_vali(obj, index) {
    		if($(obj).attr('name') == 'fileVali1') {
    			if($(obj).next().find('.kssFileBody').find('li').length == 0) {
    				return false;
    			}
    		}
    		return true;
    	} */
    	function custom_check(obj, index) {
    		var id = $(obj).attr('id');
    		switch (id) {
/*     			case 'check3':
    				if($('#paramKey9').val().split('-').length != 3) return false;
    				break;
 */    			case 'check4':
    				return fn_email_check($('#paramKey7').val());
    				break;
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
                    <th scope="row">발명교육센터명<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey2" name="paramKey2" style="width: 450px;" value="${resultData.title}" vali-text="발명교육센터명을 입력해주새요."/>
                        <!-- <div style="margin-top:5px; ">
                           <label for="title" style="color: gray; font-size: 14px;">※ 최대 50자 입력가능</label>	
                       </div> -->
                    </td>
                </tr>
                <tr>
                    <th scope="row">지역<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <select id="paramKey1" name="paramKey1" class="join_select1" style="width:150px" vali-text="지역을 선택해주세요.">
						<c:forEach items="${region}" var="list" varStatus="status">
							<option value="${list.no}"<c:if test="${resultData.regionRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
						</c:forEach>
					</select>
                    </td>
                </tr>
                <tr>
                    <th scope="row">소속지원청<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                    	<input type="text" id="paramKey3" name="paramKey3" style="width: 450px;" value="${resultData.agency}" vali-text="소속지원청을 입력해주새요."/>
                    </td>
                </tr>
                <tr>
	                <th scope="row">주소<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
	                <td>
	                	<input type="text" id="zipcode" name="paramKey4" value="${resultData.zipcode}" style="width: 15%; margin-bottom: 8px;" autocomplete="off" vali-text="우편번호를 입력해주세요."/>
	                	<a href="javascript:void(0);" onClick="fn_post_office(false);" class="btn-layerClose">주소검색</a>
	                    <input type="text" id="address" name="paramKey5" value="${resultData.address}"  style="width: 100%;" vali-text="주소를 입력해주세요." >
	                    <input type="text" id="addressDetail" name="paramKey6" value="${resultData.addressDetail}"  style="width: 100%;" vali-text="상세주소를 입력해주세요." >
	                </td>
	            </tr>
	            <tr>
	                <th scope="row">위치정보<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
	                <td>
						위도 : <input type="text" id="latitude" name="paramKey10" value="${resultData.latitute}" vali-text="위도를 입력해주세요." style="width: 15%;">
						경도 : <input type="text" id="longitude" name="paramKey11" value="${resultData.longitute}" vali-text="경도를 입력해주세요." style="width: 15%;">
	                </td>
	            </tr>
<!--                 <tr> -->
<!--                     <th scope="row">주소<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th> -->
<!--                     <td> -->
<!--                     	<span class="write_sup_txt" style="width: 10%;">주소</span> -->
<%-- 						<input type="text" id="address" name="paramKey5" value="${resultData.address}" style="width:70.7%;" vali-text="주소를 입력해주세요." readonly="readonly" /><br /> --%>
<!-- 						<span class="write_sup_txt" style="width: 10%;">상세 주소</span> -->
<%-- 						<input type="text" id="addressDetail" name="paramKey6" value="${resultData.addressDetail}" style="width: 30%;" vali-text="주소를 입력해주세요." placeholder="아트빌 101호"/> --%>
<!-- 						<span class="write_sup_txt" style="width: 10%;">우편 번호</span> -->
<%-- 						<input type="text" id="zipcode" name="paramKey4" value="${resultData.zipcode}" style="width: 30%;" vali-text="주소를 입력해주세요." readonly="readonly" /> --%>
<!-- 						<a href="javascript:void(0);" onClick="fn_post_office(false);" class="bw_in_btn sty2" >주소 찾기</a> -->
<!--                     </td> -->
<!--                 </tr> -->
                <tr>
                    <th scope="row">전화번호<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                    	<input type="text" class="vali_phone" id="paramKey7" name="paramKey7" value="${cFn:decrypt(resultData.phone)}" style="width:100%;" maxlength="13" vali-text="전화번호를 입력해주세요." placeholder="010-1234-1234"/>
						<input type="hidden" id="check3" name="check3" class="check custom" vali-text="휴대폰번호 양식을 확인해주세요."/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">사용여부<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="radio" id="paramKey8_1" name="paramKey8" <c:if test="${resultData.useAt eq 'Y' or vo.act eq 'regist'}">checked="checked"</c:if> value="Y" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey8_1">사용</label>
                    	<input type="radio" id="paramKey8_2" name="paramKey8" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey8_2">미사용</label>
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