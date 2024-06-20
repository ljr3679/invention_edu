

		function fn_mail(domain) {
			$("#email2").val(domain);
		}
		
		function fn_email_ch(val) {
			if(val == "0") $("#email2").val("");
			else $("#email2").val(val);
		}
		
		
		
		function fn_line_delete(obj,type){
			$(obj).parent().remove();
			if(type == 'B') countB--;
			else countA--;
		}
		
			
		function formSubmit(event,act) {
			if(act == 'modify') {
				function fn_line_delete(obj,type){
					$(obj).parent().remove();
					if(type == 'B') countB--;
					else countA--;
				}
			}
			
			if($("#paramKey4").val() == ""){
				alert("생년월일을(를) 입력해주세요.");
				$("#paramKey4").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if(!/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/.test($('#paramKey4').val())){
				alert("생년월일을(를) 잘못 입력했습니다.");
				$("#paramKey4").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if($("#paramKey6").val() == ""){
				alert("휴대폰 번호을(를) 입력해주세요.");
				$("#paramKey6").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if (!/^010\d{3,4}\d{4}$/.test($('#paramKey6').val())) {
				alert('휴대폰 번호 형식이 아닙니다.');
				$(this.event.target).prop('disabled', false);
				$('#paramKey6').focus();
				return false;
			} 
			
			var email1 = $('#email1').val();
			var email2 = $('#email2').val();
			$('#paramKey7').val(email1+"@"+email2);
			
				
// 			if(email1.indexOf('@') != -1) {
// 				alert("이메일ID만 입력해주세요.");
// 				$("#email1").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
			if(/[\{\}\[\]\/?,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g.test($('#email1').val())){
				alert("이메일 ID에 특수 문자 사용이 불가능합니다.");
				$("#email1").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if(!email1 || !email2){
				alert("이메일을(를) 입력해주세요.");
				$("#email1").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if($("#paramKey8").val() == ""){
				alert("소속을(를) 입력해주세요.");
				$("#departmentCheck").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if($("#paramKey9").val() == ""){
				alert("직위을(를) 입력해주세요.");
				$("#paramKey9").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if(countA==0) {
				alert("학력을(를) 입력해주세요.");
				$("#addBtn1").focus();
				$(event.target).prop('disabled',false);
				return false;
			} else if(countA > 0) {
				for (var i = 1; i <= countA; i++) {
					if ($("#data2_"+i).val() == "") {
						alert("학위을(를) 입력해주세요.");
						$("#addBtn1").focus();
						$(event.target).prop('disabled',false);
						return false;
					}
					if ($("#data3_"+i).val() == "") {
						alert("취득연도을(를) 입력해주세요.");
						$("#addBtn1").focus();
						$(event.target).prop('disabled',false);
						return false;
					}
					if ($("#data4_"+i).val() == "") {
						alert("세부전공을(를) 입력해주세요.");
						$("#addBtn1").focus();
						$(event.target).prop('disabled',false);
						return false;
					}
				}
			}
			
// 			if(countA != null && countA == 0){
// 				alert("학력을(를) 입력해주세요.");
// 				$("#addBtn1").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
// 			if(countA == 0){
// 				alert("학력을(를) 입력해주세요.");
// 				$("#addBtn1").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}

// 			if($("#data2_"+countA).val() == "") {
// 				alert("학위을(를) 입력해주세요.");
// 				$("#addBtn1").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
// 			if($("#data3_"+countA).val() == "") {
// 				alert("취득연도을(를) 입력해주세요.");
// 				$("#addBtn1").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
// 			if($("#data4_"+countA).val() == "") {
// 				alert("세부전공을(를) 입력해주세요.");
// 				$("#addBtn1").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
			if($("#paramKey10").val() == ""){
				alert("발명교사 인증제 취득여부을(를) 입력해주세요.");
				$("#acqAtCheck").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if($("#paramKey11").val() == "" && $("#paramKey12").val() == "" && $("#paramKey13").val() == ""  ){
				alert("발명교사 인증제 번호을(를) 입력해주세요.");
				$("#paramKey11").focus();
				$(event.target).prop('disabled',false);
				return false;
			}
			
			if(countB > 0) {
				for (var i = 1; i <= countB; i++) {
					if ($("#data5_"+i).val() == "") {
						alert("연도을(를) 입력해주세요.");
						$("#addBtn2").focus();
						$(event.target).prop('disabled',false);
						return false;
					}
					if ($("#data6_"+i).val() == "") {
						alert("프로그램명을(를) 입력해주세요.");
						$("#addBtn2").focus();
						$(event.target).prop('disabled',false);
						return false;
					}
					if ($("#data7_"+i).val() == "") {
						alert("차시을(를) 입력해주세요.");
						$("#addBtn2").focus();
						$(event.target).prop('disabled',false);
						return false;
					}
				}
			}
			
// 			if($("#data5_"+countB).val() == "") {
// 				alert("연도을(를) 입력해주세요.");
// 				$("#addBtn2").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
// 			if($("#data6_"+countB).val() == "") {
// 				alert("프로그램명을(를) 입력해주세요.");
// 				$("#addBtn2").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
// 			if($("#data7_"+countB).val() == "") {
// 				alert("차시을(를) 입력해주세요.");
// 				$("#addBtn2").focus();
// 				$(event.target).prop('disabled',false);
// 				return false;
// 			}
			
//			var acqAuthNum1 = $('#acqAuthNum1').val();
//			var acqAuthNum2 = $('#acqAuthNum2').val();
//			var acqAuthNum3 = $('#acqAuthNum3').val();
//			$('#acqAuthNum').val(acqAuthNum1+"-"+acqAuthNum2+"-"+acqAuthNum3);
//			if(act == 'modify'){
//				if(confirm("수정 하시겠습니까?")){
//					$('#cmmnForm').attr("action","/pool/contact/edit.Act");
//					$('#cmmnForm').submit();
//				}
//			}else{
//				if(confirm("등록 하시겠습니까?")){
//					$('#cmmnForm').attr("action","/pool/contact/edit.Act");
//					$('#cmmnForm').submit();
//				}
//			}
			return true;
			
		}
