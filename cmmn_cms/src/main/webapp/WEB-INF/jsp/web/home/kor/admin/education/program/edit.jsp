<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" />

<head>
    <script type="text/javascript" defer="defer">
        
        function fn_edit(){
        	$.each($('textarea[editor=Y]'), function(index, item) {
    			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
    			$('#paramKey18').html(CKEDITOR.instances.paramKey18.getData());
    			$('#paramKey19').html(CKEDITOR.instances.paramKey19.getData());
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
    	$('input.stat_point').on('input', function() {
   		  this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');
   		  this.value = this.value.replace(/^0+/, '');
   		  if(this.value > 5) 
   		  	this.value = '0';
   		});
    	function fn_add_index(){
    		var html = "";
    		html = "<div>"
	    				+"<input type=\"hidden\" name=\"paramKeyList1\" value=\"0\"/>"
	    				+"<input type=\"text\" name=\"paramKeyList2\" style=\"width: 80%;\" value=\"\" vali-text=\"목차를 입력해주새요.\"/>"
	    	    		+"<a href=\"javascript:void(0);\" onclick=\"fn_remove_index(this);\" style=\"cursor: pointer;\" class=\"right btn delete\">삭제</a>"
    	    		"</div>";
    		$('#indexRow').append(html);
    	}
    	function fn_add_link(){
    		var html = "";
    		html = "<div>"
	    				+"<input type=\"hidden\" name=\"paramKeyList3\" value=\"0\"/>"
	    				+"<input type=\"text\" name=\"paramKeyList4\" style=\"width: 80%;\" value=\"\" placeholder=\"제목\" vali-text=\"제목을 입력해주새요.\" />"
	    	    		+"<a href=\"javascript:void(0);\" onclick=\"fn_remove_link(this);\" style=\"cursor: pointer;\" class=\"right btn delete\">삭제</a>"
	    	    		+"<input type=\"text\" name=\"paramKeyList5\" style=\"width: 80%;\" class=\"unCheck\" placeholder=\"링크\" vali-text=\"링크를 입력해주새요.\" />"
    	    		"</div>";
    		$('#linkRow').append(html);
    	}
    	
    	function fn_remove_index(obj,no){
    		$(obj).parent().remove();
    		if(no != "") {
    			if(confirm('목차를 삭제 하시겠습니까?')) {
    				fn_cmmn_ajax('${vo.selfPath}index_delete.ajax', false, {'no':no}, 'json', function(res) {
    					if(res) {
    						var result = res.result;
    						switch (result) {
    							case '200':
    								alert('삭제되었습니다.');
    								break;
    							case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
    						}
    					} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
    				});
    			}
    		}
    	}
    	function fn_remove_link(obj,no){
    		$(obj).parent().remove();
    		if(no != "") {
    			if(confirm('링크를 삭제 하시겠습니까?')) {
    				fn_cmmn_ajax('${vo.selfPath}link_delete.ajax', false, {'no':no}, 'json', function(res) {
    					if(res) {
    						var result = res.result;
    						switch (result) {
    							case '200':
    								alert('삭제되었습니다.');
    								break;
    							case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
    						}
    					} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
    				});
    			}
    		}
    	}
    	function fn_write() {
    		fn_cmmn_ajax('${vo.selfPath}comment_insert.ajax', false, {'no':$('#idx').val(),'content':$('#commentId').val()}, 'json', function(res) {
				if(res) {
					var result = res.result;
					switch (result) {
						case '200':
							alert('작성되었습니다.');
							fn_comment_init();
							$('#commentId').val("");
							break;
						case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
					}
				} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
			});
    	}
    	function fn_delete_comment(no) {
    		fn_cmmn_ajax('${vo.selfPath}comment_delete.ajax', false, {'no':no}, 'json', function(res) {
				if(res) {
					var result = res.result;
					switch (result) {
						case '200':
							alert('삭제되었습니다.');
							fn_comment_init();
							break;
						case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
					}
				} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
			});
    	}
    	function fn_comment_init() {
    		$('#commentTable').empty();
    		fn_cmmn_ajax('${vo.selfPath}comment_init.ajax', false, {'no':$('#idx').val()}, 'json', function(res) {
				if(res) {
					var result = res.result;
					var commentList = res.commentList;
					var commentRow = "";
					switch (result) {
						case '200':
							if(commentList.length > 0){
								$.each(commentList,function(i,value){
									commentRow = "<tr>"
													+"<td><p>"+value.registerName+"</p></td>"
													+"<td><p>"+value.content+"</p></td>"
													+"<td><p>"+value.regDate+"</p></td>"
													+"<td><a href=\"javascript:void(0);\" onclick=\"fn_delete_comment('"+value.no+"');\" style=\"cursor: pointer;\" class=\"right btn delete\">삭제</a></td>"
												+"</tr>";
									$('#commentTable').append(commentRow);
								});
							}
							
							break;
						case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
					}
				} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
			});
    	}
    	$(document).ready(function(){
    		fn_comment_init();
    	});
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
                <col style="width:10%;">
                <col style="width:20%;">
            </colgroup>
            <tbody>
            	<tr>
                    <th scope="row">추천 프로그램<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td colspan="3">
                        <input type="text" id="paramKey4" name="paramKey4" class="datepicker" onChange="datepicker_start('paramKey4','paramKey5')" style="width: 150px; cursor: pointer;" vali-text="추천 프로그램 시작일을 선택해주새요." readonly="readonly" value="${resultData.startDate}"/>
						~
						<input type="text" id="paramKey5" name="paramKey5" class="datepicker" onChange="datepicker_start('paramKey4','paramKey5')" style="width: 150px; cursor: pointer;" vali-text="추천 프로그램 종료일을 선택해주새요." readonly="readonly" value="${resultData.endDate}"/>
						<div style="margin-top:5px; ">
                           <label for="paramKey4" style="color: gray; font-size: 14px;"> ※ 설정한 기간동안 추천 프로그램에 노출됩니다</label>
                       </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">사용여부 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td colspan="3">
                        <input type="radio" id="paramKey1_1" name="paramKey1" <c:if test="${resultData.useAt eq 'Y' or vo.act eq 'regist'}">checked="checked"</c:if> value="Y" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_1">사용</label>
                    	<input type="radio" id="paramKey1_2" name="paramKey1" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if> value="N" vali-text="사용여부를 선택해주세요."><label style="margin-left: 10px" for="paramKey1_2">미사용</label>
                    </td>
                </tr>
                <tr>
                	<th scope="row">교육대상 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
					<td colspan="3">
						<select id="paramKey2" name="paramKey2" class="join_select1" vali-text="교육대상을 선택해주세요." style="width:300px;">
							<option value="">선택</option> 
							<c:forEach items="${targetList}" var="list" varStatus="status">
								<option value="${list.no}"<c:if test="${resultData.targetRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
							</c:forEach>
						</select>
					</td>
                </tr>
                <tr>
                	<th scope="row">관련교과 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
					<td colspan="3">
						<select id="paramKey3" name="paramKey3" class="join_select1" vali-text="관련교과를 선택해주세요." style="width:300px;">
							<option value="">선택</option> 
							<c:forEach items="${subjectList}" var="list" varStatus="status">
								<option value="${list.no}"<c:if test="${resultData.subjectRef eq list.no}">selected="selected"</c:if>>${list.dataName}</option>
							</c:forEach>
						</select>
					</td>
                </tr>
                <tr>
                    <th scope="row">제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td colspan="3">
                        <input type="text" id="paramKey6" name="paramKey6" style="width: 100%;" value="${resultData.title}" vali-text="제목을 입력해주새요."/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">키워드 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td colspan="3">
                        <input type="text" id="paramKey7" name="paramKey7" style="width: 100%;" value="${resultData.keyword}" vali-text="키워드를 입력해주새요."/>
                        <div style="margin-top:5px; ">
                           <label for="paramKey7" style="color: gray; font-size: 14px;"> ※ 키워드 입력 시 ‘,’로 구분하여 입력 예) 키워드1,키워드2,키워드3</label>
                       </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">1. 통계 제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey8" name="paramKey8" style="width: 100%;" value="${resultData.statText1}" vali-text="통계 제목을 입력해주새요."/>
                    </td>
                    <th scope="row">점수 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey9" name="paramKey9" style="width: 100%;" class="stat_point" value="${resultData.statPoint1}" vali-text="점수를 입력해주새요."/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">2. 통계 제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey10" name="paramKey10" style="width: 100%;" value="${resultData.statText2}" vali-text="통계 제목을 입력해주새요."/>
                    </td>
                    <th scope="row">점수 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey11" name="paramKey11" style="width: 100%;" class="stat_point" value="${resultData.statPoint2}" vali-text="점수를 입력해주새요."/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">3. 통계 제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey12" name="paramKey12" style="width: 100%;" value="${resultData.statText3}" vali-text="통계 제목을 입력해주새요."/>
                    </td>
                    <th scope="row">점수 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey13" name="paramKey13" style="width: 100%;" class="stat_point" value="${resultData.statPoint3}" vali-text="점수를 입력해주새요."/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">4. 통계 제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey14" name="paramKey14" style="width: 100%;" value="${resultData.statText4}" vali-text="통계 제목을 입력해주새요."/>
                    </td>
                    <th scope="row">점수 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey15" name="paramKey15" style="width: 100%;" class="stat_point" value="${resultData.statPoint4}" vali-text="점수를 입력해주새요."/>
                    </td>
                </tr>
                <tr>
                    <th scope="row">5. 통계 제목 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey16" name="paramKey16" style="width: 100%;" value="${resultData.statText5}" vali-text="통계 제목을 입력해주새요."/>
                    </td>
                    <th scope="row">점수 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td>
                        <input type="text" id="paramKey17" name="paramKey17" style="width: 100%;" class="stat_point" value="${resultData.statPoint5}" vali-text="점수를 입력해주새요."/>
                        <div style="margin-top:5px; ">
                           <label for="paramKey17" style="color: gray; font-size: 14px;"> ※ 점수는 0점~5점 사이의 소수점 2번째 자리 까지 입력 가능합니다.</label>
                       </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">세부역량</th>
                    <td colspan="3">
                    	<textarea id="paramKey18" name="paramKey18" editor="Y" style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.detail}" escapeXml="false"/></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row">프로그램 소개</th>
                    <td colspan="3">
                    	<textarea id="paramKey19" name="paramKey19" editor="Y" style="width: 100%; height: 300px; resize: none;" ><c:out value="${resultData.content}" escapeXml="false"/></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row">목차 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
                    <td colspan="3" id="indexRow">
                    	<c:choose>
                    		<c:when test="${empty resultList1}">
                    			<input type="hidden" name="paramKeyList1" value="0"/>
	                    		<input type="text" name="paramKeyList2" style="width: 80%;" vali-text="목차를 입력해주새요."/>
                    			<a onClick="fn_add_index();" style="cursor:pointer" class="fr_btn">추가</a>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach items="${resultList1}" var="list" varStatus="status">
                    				<div>
			                    		<input type="hidden" name="paramKeyList1" value="${list.no}"/>
			                    		<input type="text" name="paramKeyList2" style="width: 80%;" value="${list.content}" vali-text="목차를 입력해주새요."/>
			                    		<c:choose>
			                    			<c:when test="${status.count eq '1'}">
			                    				<a onClick="fn_add_index();" style="cursor:pointer" class="fr_btn">추가</a>			
			                    			</c:when>
			                    			<c:otherwise>
			                    				<a href="javascript:void(0);" onclick="fn_remove_index(this,'${list.no}');" style="cursor: pointer;" class="right btn delete">삭제</a>
			                    			</c:otherwise>
			                    		</c:choose>
			                    	</div>
		                    	</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                   </td>
                </tr>
                <tr>
                    <th scope="row">관련 자료 링크</th>
                    <td colspan="3" id="linkRow">
                    	<c:choose>
                    		<c:when test="${empty resultList2}">
                    			<input type="hidden" name="paramKeyList3" value="0"/>
	                    		<input type="text" name="paramKeyList4" style="width: 80%;" class="unCheck" placeholder="제목"/>
                    			<a onClick="fn_add_link();" style="cursor:pointer" class="fr_btn">추가</a>
                    			<input type="text" name="paramKeyList5" style="width: 80%;" class="unCheck" placeholder="링크"/>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach items="${resultList2}" var="list" varStatus="status">
                    				<div>
			                    		<input type="hidden" name="paramKeyList3" value="${list.no}"/>
			                    		<input type="text" name="paramKeyList4" style="width: 80%;" value="${list.title}" vali-text="링크를 입력해주새요."/>
			                    		<c:choose>
			                    			<c:when test="${status.count eq '1'}">
			                    				<a onClick="fn_add_link();" style="cursor:pointer" class="fr_btn">추가</a>			
			                    			</c:when>
			                    			<c:otherwise>
			                    				<a href="javascript:void(0);" onclick="fn_remove_link(this,'${list.no}');" style="cursor: pointer;" class="right btn delete">삭제</a>
			                    			</c:otherwise>
			                    		</c:choose>
			                    		<input type="text" name="paramKeyList5" style="width: 80%;" value="${list.link}" vali-text="링크를 입력해주새요."/>
			                    	</div>
		                    	</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                   </td>
                </tr>
                <tr>
					<th scope="row">썸네일 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
					<td colspan="3">
						<input type="hidden" id="fileVali2" name="fileVali2" class="check custom" vali-text="썸네일을 업로드해주세요."/>
						<c:out value="${cFn:kssFileInclude('fileDataList2', 1, 'png,jpg,jpeg', 100, 'MB', true, fileList2)}" escapeXml="false"/>
					</td>
				</tr>
                <tr>
					<th scope="row">교재 파일 <img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
					<td colspan="3">
						<input type="hidden" id="fileVali1" name="fileVali1" class="check custom" vali-text="첨부파일을 업로드해주세요."/>
						<c:out value="${cFn:kssFileInclude('fileDataList1', 1, 'pdf', 500, 'MB', true, fileList1)}" escapeXml="false"/>
					</td>
				</tr>
            </tbody>
        </table>

        <!-- // board_write -->
    </div>
    <div class="caption_title">
	 	· 댓글
	</div>
	<table class="board_list th_bgc">
		<colgroup>
			<col style="width:15%;">
			<col style="width:auto;">
			<col style="width:15%;">
			<col style="width:10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">작성자</th>
				<th scope="col">내용</th>
				<th scope="col">작성일</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody id="commentTable">
		</tbody>
	</table>
	<table class="board_write basic">
		<caption>댓글 작성</caption>
		<colgroup>
			<col style="width:20%;">
	        <col style="width:auto;">
	    </colgroup>
      	<tbody>
      		<tr>
              	<th scope="row">댓글 내용</th>
              	<td colspan="3">
              		<textarea id="commentId" style="width: 100%; height: 100px; resize: none;" class="unCheck"></textarea> 
              		<a href="javascript:void(0);" style="float:right;" onClick="fn_write();" style="cursor:pointer" class="fr_btn">작성</a>
				</td>
			</tr>
		</tbody>
	</table>
</form:form>

<div class="btn_wrap">
	<a href="javascript:void(0);" onclick="fn_edit();" style="cursor: pointer;" class="right btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}" /></a>
	<c:if test="${vo.act eq	'modify'}">
		<a href="javascript:void(0);" onclick="fn_remove();" style="cursor: pointer;" class="right btn delete">삭제</a>
	</c:if>	
    <a href="javascript:void(0);" onclick="fn_cancel();" style="cursor: pointer;" class="right btn cancel">목록</a>
</div>