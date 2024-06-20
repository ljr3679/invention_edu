<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_pw_ch(obj) {
		if($(obj).hasClass('btn')){
			$('#ch_btn').removeClass('btn');
			$('#ch_btn').addClass('btn_off');
			$("#paramKey3").attr('disabled',false);
			$('#pw_text').text('비밀번호 변경취소');
		}else if($(obj).hasClass('btn_off')){
			$('#ch_btn').removeClass('btn_off');
			$('#ch_btn').addClass('btn');
			$('#paramKey3').attr('disabled',true);
			$('#paramKey3').val('');
			$('#pw_text').text('비밀번호 변경하기');
		}
	}
	
	function fn_id_check() {
		if (/^[A-Za-z0-9+]{6,12}$/.test($('#paramKey2').val())) {
			var chk_num = $('#paramKey2').val().search(/[0-9]/g);
			var chk_eng = $('#paramKey2').val().search(/[a-z]/gi);
			if (chk_num < 0 || chk_eng < 0) {
				alert('아이디는 숫자와 영문자를 혼용해주세요.');
				$('#check1').val('N');
				return false;
			}
			
			var data = {'id' : $('#paramKey2').val()};
			fn_cmmn_ajax("${vo.selfPath}id_check.ajax", true, data, 'text', function(result) {
				if(result == 'T') {
					$('#paramKey2').attr('disabled', 'disabled');
					$('#check_id').css('display', '');
					$('#check1').val('Y');	
				} else {
					alert('이미 가입된 아이디입니다.');
				}
			});
		} else {
			alert('아아디 입력규칙을 확인해주세요.');
			$('#check1').val('N');
			return;
		}
	}
	
	function fn_egov_pw_ck(val) {
		var hm = $('#searchPw');
		var ser = val.search(/^(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,12}$/);
		
		if(ser == 0) {
			hm.html('');
			$('#check2').val('Y');
		}
		else {
			hm.html('비밀번호를 확인하여 주십시오.');
			$('#check2').val('N');
		}
		
	}

	function fn_email_check(email) { 
		if(!/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g.test(email)) return false;
	    else return true;
	}
	
	function custom_check(obj, index) {
		var id = $(obj).attr('id');
		switch (id) {
			case 'check1':
				if(!$('#check1').val() || $('#check1').val() == 'N') return false;
				break;
			case 'check2':
				if(!$('#paramKey3').prop('disabled') && (!$('#check2').val() || $('#check2').val() == 'N')) return false;
				break;
			case 'check3':
				if($('#paramKey6').val().split('-').length != 3) return false;
				break;
			case 'check4':
				return fn_email_check($('#paramKey7').val());
				break;
		}
		
		return true;
	}
	
	function fn_edit() {
		if(fn_validation_check($('#cmmnForm'), custom_check)) {
			var msg = "${vo.act eq 'regist' ?'등록' :'수정'}";
			if(confirm(msg+' 하시겠습니까?')) {
				var account = $('#paramKey20').val();
				if(account == 'S') $('#paramKey21').val('ALL'); 
				else {
					var result = new Array();
					$.each($('input[name="siteGbn"]:checked'), function(index, item) {
						result.push('['+$(item).val()+']');
					});
					$('#paramKey21').val(result.join());	
				}
				$('#paramKey2').removeAttr('disabled');
				$('#cmmnForm').attr('action', '${vo.selfPath}edit.act');
				$('#cmmnForm').submit();
			}
		}
	}
	
	function fn_cancel() {
		$('#act').val('');
		$('#idx').val('');
		$('#cmmnForm').attr('action', '${vo.selfPath}accountMng.do');
		$('#cmmnForm').submit();
	}
	
	function fn_site_manager(val) {
		if(val == 'S') {
			$('input[name="siteGbn"]').prop('checked', true);
			$('input[name="siteGbn"]').attr('disabled', 'disabled');
		} else {
			$('input[name="siteGbn"]').prop('checked', false);
			$('input[name="siteGbn"]').removeAttr('disabled');
		}
	}
</script>
</head>
<body>
<!-- right start -->
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="act"/>
<form:hidden path="pageIndex" />
<form:hidden path="searchValue1" />
<form:hidden path="searchValue2" />
<form:hidden path="searchKeyword" />
<input type="hidden" id="title" name="title" value="${resultData.name} [${resultData.id}]"/>
<input type="hidden" id="paramKey10" name="paramKey10" value="A"/>
<input type="hidden" id="paramKey21" name="paramKey21" value=""/>

<!-- board_write -->
<table class="board_write basic">
	<caption>작성</caption>
	<colgroup>
		<col style="width:20%;">
		<col style="width:40%;">
		<col style="width:20%;">
		<col style="width:20%;">
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">등록자</th>
			<td>
				<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}"><c:out value="${admSession.name} [${admSession.id}]"/></c:when>
						<c:otherwise><c:out value="${resultData.registerName} [${resultData.registerId}]"/></c:otherwise>
					</c:choose>
				</p>
			</td>
			<th scope="row">등록일</th>
			<td>
				<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
							<c:out value="${sysYear}"/>
						</c:when>
						<c:otherwise><c:out value="${resultData.regDate}"/></c:otherwise>
					</c:choose>
				</p>
			</td>
		</tr>
		<tr>
			<th scope="row">수정자</th>
			<td>
				<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">-</c:when>
						<c:when test="${vo.act eq 'modify' and empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modifierName} [${resultData.modifierId}]"/></c:otherwise>
					</c:choose>
				</p>
			</td>
			<th scope="row">수정일</th>
			<td>
				<p>
					<c:choose>
						<c:when test="${vo.act eq 'regist'}">-</c:when>
						<c:when test="${vo.act eq 'modify' and empty resultData.modDate}">-</c:when>
						<c:otherwise><c:out value="${resultData.modDate}"/></c:otherwise>
					</c:choose>
				</p>
			</td>
		</tr>
		<tr>
			<th scope="row">사용여부<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<div class="on_iblock" style="margin-right: 20px;">
					<input type="radio" id="radio_1" name="paramKey1" value="Y" class="unCheck" <c:if test="${empty resultData or resultData.useAt eq 'Y'}">checked="checked"</c:if>/><label for="radio_1">사용</label>
				</div>
				<div class="on_iblock">
					<input type="radio" id="radio_2" name="paramKey1" value="N" class="unCheck" <c:if test="${resultData.useAt eq 'N'}">checked="checked"</c:if>/><label for="radio_2">미사용</label>
				</div>
			</td>
		</tr>
		<c:choose>
			<c:when test="${admSession.account eq 'S'}">
		<tr>
			<th scope="row">관리자 권한</th>
			<td colspan="3">
				<select id="paramKey20" name="paramKey20" class="join_select1" style="width: 200px;" onChange="fn_site_manager(this.value);">
					<option value="S" <c:if test="${resultData.account eq 'S'}">selected="selected"</c:if>>슈퍼관리자</option>
					<option value="A" <c:if test="${resultData.account eq 'A'}">selected="selected"</c:if>>관리자</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">사이트</th>
			<td colspan="3">
				<c:forEach items="${admSession.siteInfo}" var="site" varStatus="status">
					<input type="checkbox" name="siteGbn" vali-text="1개 이상의 사이트를 선택해주세요." <c:if test="${empty resultData or resultData.account eq 'S'}">disabled="disabled"</c:if> <c:if test="${empty resultData or resultData.account eq 'S' or cFn:arrIndexOf(resultData.siteCodeList, site.value.siteCode) ne -1}">checked="checked"</c:if> value="${site.value.siteCode}" id="site${status.count}_${status2.count}"/><label for="site${status.count}_${status2.count}"><c:out value="${site.value.siteTxt}"/></label>
				</c:forEach>
			</td>
		</tr>			
			</c:when>
			<c:otherwise>
		<tr>
			<th scope="row">관리자 권한</th>
			<td colspan="3">
				<input type="hidden" name="paramKey20" value="${not empty resultData ?resultData.acccount :'A'}"/>
				<c:out value="${resultData.account eq 'S' ?'슈퍼관리자' :'관리자'}"/>
			</td>
		</tr>
		<tr>
			<th scope="row">사이트<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<c:forEach items="${admSession.siteInfo}" var="site" varStatus="status">
					<input type="checkbox" name="siteGbn" vali-text="1개 이상의 사이트를 선택해주세요." <c:if test="${resultData.account eq 'S'}">disabled="disabled"</c:if> <c:if test="${resultData.account eq 'S' or cFn:arrIndexOf(resultData.siteCodeList, site.value.siteCode) ne -1}">checked="checked"</c:if> value="${site.value.siteCode}" id="site${status.count}_${status2.count}"/><label for="site${status.count}_${status2.count}"><c:out value="${site.value.siteTxt}"/></label>
				</c:forEach>
			</td>
		</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<th scope="row">아이디<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<c:choose>
					<c:when test="${vo.act eq 'modify'}">
						<c:out value="${resultData.id}"/>
					</c:when>
					<c:otherwise>
						<input type="text" style="width: 200px;" id="paramKey2" name="paramKey2" value="${resultData.id}" vali-text="아이디를 입력해주세요." class="mr_10"><a onClick="fn_id_check();" style="cursor: pointer;" class="btn">중복확인</a> 
						<input type="hidden" id="check1" name="check1" class="check custom" vali-text="중복체크를 확인해주세요."/>
						<br/>
						<span class="write_sup_txt">아이디는 영문+숫자조합 6~12자리로 입력하세요.</span><br/>
						<span id="searchId"></span>
					</c:otherwise>
				</c:choose>
				<div id="check_id" class="text sty_01" style="display: none;">사용가능한 아이디입니다.</div>
			</td colspan="3">
		</tr>
		<tr>
			<th scope="row">비밀번호<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<input type="password" style="width: 200px;" id="paramKey3" name="paramKey3" onkeyup="fn_egov_pw_ck(this.value)" autocomplete="new-password" vali-text="비밀번호를 입력해주세요." <c:if test="${vo.act eq 'modify'}">disabled="disabled"</c:if> class="mr_10"> 
				<input type="hidden" id="check2" name="check2" class="check custom" vali-text="비밀번호 양식을 확인해주세요."/>
				<c:if test="${vo.act eq 'modify'}"><a onClick="fn_pw_ch(this);" id="ch_btn" style="cursor: pointer;" class="btn"><span id="pw_text">비밀번호 변경하기</span></a></c:if>
				<br/><span class="write_sup_txt">영소문자, 숫자, 특수문자 (!@#$%^&*)조합으로 6~12자리</span><br/>
				<span id="searchPw"></span>
			</td>
		</tr>
		<tr>
			<th scope="row">성명<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<input type="text" style="width: 200px;" id="paramKey4" name="paramKey4" value="${resultData.name}" vali-text="성명을 입력해주세요." placeholder="홍길동">
			</td>
		</tr>
		<tr>
			<th scope="row">권한명<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<select name="paramKey5" id="paramKey5" class="join_select1 unCheck" style="min-width: 200px;">
					<c:forEach items="${accountList}" varStatus="status" var="list">
						<option value="${list.no}"<c:if test="${resultData.menuAuthorityNo eq list.no}">selected="selected"</c:if>>${list.title}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">휴대폰번호<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<input class="vali_phone" type="text" style="width: 200px;" id="paramKey6" name="paramKey6"  maxlength="13" value="${resultData.phone}" vali-text="휴대폰번호를 입력해주세요." placeholder="010-1234-1234"> 
				<input type="hidden" id="check3" name="check3" class="check custom" vali-text="휴대폰번호 양식을 확인해주세요."/>
			</td>
		</tr>
		<tr>
			<th scope="row">이메일<img src="/images/cmmn/star.png" class="th_star" alt="필수 입력"></th>
			<td colspan="3">
				<input class="vali_email" type="text" style="width: 330px;" id="paramKey7" name="paramKey7" value="${resultData.email}" vali-text="이메일을 입력해주세요." placeholder="test@test.com">
				<input type="hidden" id="check4" name="check4" class="check custom" vali-text="이메일 양식을 확인해주세요."/>
			</td>
		</tr>
	</tbody>
</table>
<!-- // board_write -->
<div class="btn_wrap">
	<a onClick="fn_edit();" style="cursor: pointer;" class="btn"><c:out value="${vo.act eq 'regist' ?'등록' :'수정'}"/></a>
	<a onClick="fn_cancel();" style="cursor: pointer;" class="btn cancel">목록</a>
</div>
</form:form>	
<!-- // right end -->			
</body>
<!-- header end -->