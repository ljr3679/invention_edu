<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_edit() {
		$.each($('textarea[editor=Y]'), function(index, item) {
			//oEditors.getById[$(item).attr('id')].exec("UPDATE_CONTENTS_FIELD", []);
			$('textarea[editor=Y]').html(CKEDITOR.instances.paramKey20.getData());
		});
		
		if(!checkUrlForm($('#paramKey3').val())) {
			alert('연결주소가 URL 형식이 아닙니다.');
			$(event.target).prop('disabled',false);
			return;
		}

		//urlNmCheck();

		if ($('#checkUrlNm').val() != 'Y') {
			alert('중복체크를 해야합니다.');
			$(event.target).prop('disabled',false);
			return;
		}		
		
		
		if(fn_validation_check($('#cmmnForm'))) {
			if(confirm('저장 하시겠습니까?')) {
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
	
	
	function checkUrlForm(strUrl) {
	    var expUrl = /^http[s]?\:\/\//i;
	    return expUrl.test(strUrl);
	}	

	function urlNmCheckReset() {
		$('#checkUrlNm').val('N');
	}	

	function urlNmCheck() {

		if ($('#paramKey2').val() ==  "") {
			alert("단축주소를 입력하세요.");
		} else {
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "/cmsManager/home/kor/url/checkUrlNm.act",
				data : {'paramKey2': $('#paramKey2').val()},
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					if (data == true) {
						$('#checkUrlNm').val('Y');
						alert("등록가능한 단축주소입니다.");
					} else {
						$('#checkUrlNm').val('N');
						alert("중복된 단축주소입니다.");
					}
				},
				error : function(e) {
					$('#checkUrlNm').val('N');
				},
				done : function(e) {
				}
			});
		}
	}	
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex"/><!-- 페이징 -->
<form:hidden path="searchValue1" /> <!-- 메뉴명 -->
<form:hidden path="searchKeyword" /> <!-- 메뉴명 -->
<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:atuo;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">제목</th>
			<td>
				<input type="text" id="paramKey1" name="paramKey1" class="form-control" placeholder="제목" value="${resultData.title}" style="width: 100%;" />
			</td>
		</tr>
		<tr>
			<th scope="row">단축주소</th>
			<td>
				<div class="input-group">
					http://iped.kr/
					<input type="text" id="paramKey2" name="paramKey2" class="form-control" placeholder="단축주소" onkeypress="urlNmCheckReset()" value="${resultData.urlNm}" />
					<span class="input-group-btn">
						<a class="btn" type="button" onclick="urlNmCheck()">중복체크</a>
						<input type="hidden" id="checkUrlNm" value="<c:if test='${resultData.urlNm!=""}'>Y</c:if><c:if test='${resultData.urlNm==""}'>N</c:if>">
					</span>
				</div>

			</td>
		</tr>
		<tr>
			<th scope="row">연결주소</th> 
			<td>
				<input type="text" id="paramKey3" name="paramKey3"  class="form-control" placeholder="연결주소" value="${resultData.urlOrg}" style="width: 100%;" />
			</td>
		</tr>
		
	</tbody>
</table>

<!-- // board_write -->
<div class="btn_wrap">
	<a href="javascript:void(0);" onClick="fn_edit();" class="btn">저장</a>
	<c:if test="${vo.act eq	'modify'}">
		<a href="javascript:void(0);" onclick="fn_remove();" style="cursor: pointer;" class="right btn delete">삭제</a>
	</c:if>		
	<a href="javascript:void(0);" onClick="fn_cancel();" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->
