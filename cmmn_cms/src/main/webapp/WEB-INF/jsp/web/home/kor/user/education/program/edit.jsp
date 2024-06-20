<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<link rel="stylesheet" type="text/css" href="/css/home/kor/user/sub.css">
<link rel="stylesheet" type="text/css" href="/css/home/kor/user/sub_respond.css">
<link rel="stylesheet" href="/css/home/kor/user/sub.css" type="text/css">
<link rel="stylesheet" href="/css/home/kor/user/sub_respond.css" type="text/css">
<link rel="stylesheet" href="/css/home/kor/user/sub2.css" type="text/css">
<link rel="stylesheet" href="/css/home/kor/user/sub_respond2.css" type="text/css">
<link rel="stylesheet" href="/css/home/kor/user/sub3.css" type="text/css">
<link rel="stylesheet" href="/css/home/kor/user/sub_respond3.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script>
$(function(){
	var title;
	var title1;
	var title2;
	var title3;
	var title4;
	var title5;
	var point1;
	var point2;
	var point3;
	var point4;
	var point5;
	fn_cmmn_ajax('${vo.selfPath}stat_info.ajax', false, {'no':$('#idx').val()}, 'json', function(res) {
		if(res) {
			var result = res.result;
			var statInfo = res.statInfo; 
			switch (result) {
				case '200':
					title = statInfo.title;
					title1 = statInfo.statText1;
					title2 = statInfo.statText2;
					title3 = statInfo.statText3;
					title4 = statInfo.statText4;
					title5 = statInfo.statText5;
					point1 = statInfo.statPoint1;
					point2 = statInfo.statPoint2;
					point3 = statInfo.statPoint3;
					point4 = statInfo.statPoint4;
					point5 = statInfo.statPoint5;
					break;
				case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
			}
		} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
	});
	var context = document.getElementById('myChart')
	.getContext('2d');
	var myChart = new Chart(context, {
	type: 'radar',
	data: {
	  labels: [title1, title2, title3, title4, title5],
	  datasets: [
		{
		  label: title,
		  fill: true,
		  backgroundColor: "rgba(10,167,208,0.2)",
		  borderColor: "rgba(10,167,208,1)",
		  pointBorderColor: "#fff",
		  pointBackgroundColor: "rgba(10,167,208,1)",
		  data: [point1, point2, point3, point4, point5],
			
		},
		
	  ]
	},
		options: {
			legend: {
				display: false,
			},
			tooltips: {
				callbacks: {
				   label: function(tooltipItem) {
						  return tooltipItem.yLabel;
				   }
				}
			},
		    scales: {
		        r: {
		            angleLines: {
		                display: true
		            },
		            suggestedMin: 0,
		            suggestedMax: 5
		        }
		    }			

		}
	});
});
function fn_cancel(){
    $('#idx').remove();
    $('#cmmnForm').attr('action', '${vo.selfPath}index.do');
    $('#cmmnForm').submit();
}

function fn_comment_init() {
	$('#commentList').empty();
	fn_cmmn_ajax('${vo.selfPath}comment_init.ajax', false, {'no':$('#idx').val()}, 'json', function(res) {
		if(res) {
			var result = res.result;
			var commentList = res.commentList;
			var commentRow = "";
			switch (result) {
				case '200':
					if(commentList.length > 0){
						$.each(commentList,function(i,value){
							commentRow = "<li>"
										    +"<div class=\"box\" id=\"box_id"+value.no+"\" >"
										        +"<div class=\"comment_info\">"
										            +"<p class=\"id\">"+value.registerName+"</p>"
										            +"<p class=\"date\">"+value.regDate+"</p>"
										            +"<div class=\"edit_box\">"
										                +"<ul class=\"item_list\">"
										                    +"<li class=\"item\">"
										                        +"<button type=\"button\" onclick=\"fn_comment_edit('"+value.no+"', '"+value.siteAccountRef+"');\" class=\"btn btn_edit\">수정</button>"
										                    +"</li>"
										                    +"<li class=\"item\">"
										                        +"<button type=\"button\" onclick=\"fn_delete_comment('"+value.no+"', '"+value.siteAccountRef+"')\" class=\"btn btn_remove\">삭제</button>"
										                    +"</li>"
										                +"</ul>"
										            +"</div>"
										        +"</div>"
										        +"<div class=\"comment_txt\"><span class=\"text\">"+value.content+"</span></div>"
										    +"</div>"
										+"</li>";
							$('#commentList').append(commentRow);
							
						});
						console.log(commentList.length);
						$('#commentCnt1').text(commentList.length);
						$('#commentCnt2').text(commentList.length);
						
					} else {
						commentRow = "<li>"
									    +"<div class=\"box\">"
									        +"<div align=\"center\" class=\"no_text\">등록된 댓글이 없습니다.</div>"
									    +"</div>"
									+"</li>";
						$('#commentList').append(commentRow);
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

function fn_write() {
	if($('#commentId').val().length > 500) {
		alert('댓글이 500이하 작성가능합니다.');
	} else if($('#commentId').val().length == 0) {
		alert('댓글을 입력해주세요.');
	} else {
		fn_cmmn_ajax('${vo.selfPath}comment_insert.ajax', false, {'no':$('#idx').val(),'content':$('#commentId').val()}, 'json', function(res) {
			if(res) {
				var result = res.result;
				switch (result) {
					case '400':
						alert(res.msg);
						$('#error1').css("display","block");
						break;
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
}

function fn_scrap() {
	fn_cmmn_ajax('${vo.selfPath}scrap_regist.ajax', false, {'no':$('#idx').val()}, 'json', function(res) {
		if(res) {
			var result = res.result;
			switch (result) {
				case '400':
					alert(res.msg);
					break;
				case '200':
					alert('스크랩 등록 되었습니다.');
					location.reload();
					break;
				case '201':
					alert('스크랩 삭제 되었습니다.');
					location.reload();
					break;
				case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
			}
		} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
	});
}


function fn_writing(){
	$('#wordNum').text($('#commentId').val().length);
}
function fn_edititng(){
	$('#editWordNum').text($('#editComment').val().length);
}
function fn_comment_edit(no, userId) {
	console.log(no);
	$('.comment_edit_box').remove();
	var html = ""
	html = "<div class=\"comment_edit_box\">"
				+"<textarea class=\"comment_edit_textarea\" id=\"editComment\" title=\"수정 내용 입력\" onkeyup=\"fn_edititng();\"  ></textarea>"
				+"<p class=\"comment_word_count\" id ><span class=\"ft_c\" id=\"editWordNum\">0</span>/500</p>"
				+"<a href=\"javascript:void(0);\" onclick=\"fn_comment_update('"+no+"', '"+userId+"');\" class=\"btn\">수정</a>"
			+"</div>";
	$('#box_id'+no).append(html);
}
function fn_comment_update(no, userId) {
	if($('#editComment').val().length > 500) {
		alert('댓글이 500이하 작성가능합니다.');
	} else if($('#editComment').val().length == 0) {
		alert('댓글을 입력해주세요.');
	} else {
		fn_cmmn_ajax('${vo.selfPath}comment_update.ajax', false, {'no': no,'content':$('#editComment').val(), 'userId':userId}, 'json', function(res) {
			if(res) {
				var result = res.result;
				switch (result) {
					case '400':
						alert(res.msg);
						break;
					case '200':
						alert('수정되었습니다.');
						fn_comment_init();
						$('.comment_edit_box').remove();
						break;
					case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
				}
			} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
		});
	}
}
function fn_delete_comment(no,userId) {
	if(confirm('댓글을 삭제 하시겠습니까?')) {
		fn_cmmn_ajax('${vo.selfPath}comment_delete.ajax', false, {'no':no, 'userId':userId}, 'json', function(res) {
			if(res) {
				var result = res.result;
				var msg = res.msg;
				console.log(msg);
				switch (result) {
					case '400':
						alert(msg);
						fn_comment_init();
						break;
					case '200':
						alert('삭제되었습니다.');
						fn_comment_init();
						break;
					case '500': alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.'); break;
				}
			} else alert('서버 통신 오류입니다.\n관리자에게 문의해주세요.');
		});
	}
}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<form:hidden path="idx"/>
<form:hidden path="pageIndex"/>
<form:hidden path="searchValueList1" />
<form:hidden path="searchValueList2" />
<form:hidden path="searchValueList3" />
<form:hidden path="searchKeyword" />
<div class="cont_wrap">
	<div class="cont_each program_detail">
		<div class="program_detail_view">
			<div class="info_view">
				<div class="info_container">
					<div class="info_spec">
						<div class="info_spec_wrapper">
							<div class="img_area">
								<div class="img_container">
									<div class="img_wrapper">
										<img src="/images/site/${fn:substring(resultData.attachReName, 0, fn:indexOf(resultData.attachReName, resultData.attachExtension)-1)}/${resultData.attachExtension}/loader.do" alt="">
									</div>
								</div>
							</div>
							<div class="text_area">
								<div class="title">
               			 			<div class="text">
                   		 				<c:out value="${resultData.title}"  escapeXml="false"/>
                					</div>
            					</div>
            					<ul class="cont_dot_list">
					                <li>
					                    <div class="item_wrapper">
					                        <div class="tit">교육대상</div>
					                        <div class="text"><c:out value="${resultData.targetName}"/></div>
					                    </div>
					                </li>
					                <li>
					                    <div class="item_wrapper">
					                        <div class="tit">관련교과</div>
					                        <div class="text"><c:out value="${resultData.subjectName}"/></div>
					                    </div>
					                </li>
					                <li>
					                    <div class="item_wrapper">
					                        <div class="tit">키워드</div>
					                        <div class="text">
					                        	<c:forTokens items="${resultData.keyword}" delims="," var="mySplit">
												   #<c:out value="${mySplit} "/>
												</c:forTokens>
					                        </div>
					                    </div>
					                </li>
					            </ul>
            					<div class="btn_box">
                					<span class="comment_counter">
                    					<span class="text">
                       			 			등록된 프로그램 리뷰 
                        					<span class="ft_c" id="commentCnt1"></span> 건
                    					</span>
                					</span>
                					<c:choose>
                						<c:when test="${scrapAt eq 0}">
                							<button type="button" class="btn_scrap" onclick="fn_scrap();">
							                    <span class="text">스크랩</span>
							                </button>
                						</c:when>
                						<c:when test="${scrapAt >= 1}">
                							<button type="button" class="btn_scrap on" onclick="fn_scrap();">
							                    <span class="text">스크랩</span>
							                </button>
                						</c:when>
                					</c:choose>
					                
                					<button type="button" onclick="fn_cancel();" class='btn_base'>목록</button>
            					</div>
					        </div>
					    </div>
					</div>
					<div class="attach_view">
    					<div class="diagram">
        					<canvas id="myChart"></canvas>
        						<!-- <img src="/images/sub/diagram.png" alt=""> -->
            			</div>
            			<div class="accordion_box">
			                <button class="btn_accordion">
			                    <span class="text">교재파일</span>
			                </button>
			                <ul class="item_list">
			                	<c:forEach items="${fileList1}" var="list" varStatus="status">
			                		<li class="item">
				                        <a href="javascript:void(0);" onclick="cmmn_file_down('${list.attachName}','${list.attachReName}')" class="btn_attach_file">
				                            <span class="text"><c:out value="${list.attachName}"/></span>
				                        </a>
				                    </li>
			                	</c:forEach>
			                </ul>
			            </div>
            			<div class="accordion_box">
			                <button class="btn_accordion">
			                    <span class="text">목차</span>
			                </button>
			                <ul class="item_list">
			                	<c:forEach items="${indexList}" var="list" varStatus="status">
			                		<li class="item">
				                        <div class="num_box">
				                            <span class="num"><c:out value="${status.count}"/>.</span>
				                            <c:out value="${cFn:escapeXml(list.content)}" escapeXml="false" />
				                        </div>
				                    </li>
			                	</c:forEach>
			                </ul>
            			</div>
        			</div>
    			</div>
			</div>
			<script>
			$(function(){
			    $('.btn_accordion').on('click', function(){
			        $(this).parents('.accordion_box').toggleClass('on');
			    })
			})
			</script>
			<div class="program_content">
				<div class="content">
					<div class="title detail">세부역량</div>
						<div class="text_content">
							<c:out value="${cFn:escapeXml(resultData.detail)}" escapeXml="false"/>
                        </div>
					</div>
				<div class="content">
					<div class="title intro">프로그램 소개</div>
						<div class="text_content">
							<c:out value="${cFn:escapeXml(resultData.content)}" escapeXml="false"/>
						</div>
					</div>
					<div class="content">
						<div class="title link">관련 재료 링크</div>
                             <div class="text_content">
                                 <ul class="link_list">
                                 	<c:forEach items="${linkList}" var="list" varStatus="status">
                                 		<li class="item">
	                                         <div class="item_wrapper">
	                                             <span class="num"><c:out value="${status.count}"/>.</span>
	                                             <a href="${list.link}" class="link"><c:out value="${list.title}" escapeXml="false"/></a>
	                                         </div>
	                                     </li>
									</c:forEach>
                                 </ul>
                             </div>
						</div>
					</div>
				</div>
			</div>
			<div class="cont_each">
				<div class="comment_title program">프로그램 리뷰</div>
                <div class="comment_top_area">
					<p class="comment_top_tit">댓글 <em class="num" id="commentCnt2">0</em></p>
                </div>
				<div class="comment_box">
                          <!-- 댓글 등록 -->
					<div class="comment_regist">
    					<div class="comment_regist_form">
        					<div class="tit" id="error1" style="display:none;">로그인 후 이용해주세요.</div>
        					<textarea class="comment_regist_textarea" title="댓글 입력" cols="30" rows="5" placeholder="내용을 입력하세요." maxlength="500" id="commentId" onkeyup="fn_writing('this');"></textarea>
        					<div class="btn_box">
				            <p class="comment_word_count">
				                <span class="ft_c" id="wordNum">0</span>
				                / 500
				            </p>
            				<a href="javascript:void(0);" onclick="fn_write();" class="btn">등록</a>
        			</div>
    			</div>
			</div>
<!-- // 댓글 등록 -->

			<div class="comment_view">
				<ul class="comment_list" id="commentList"> 
				</ul>
			</div>
			
			<!-- <div class="comment_view">
				<ul class="comment_list" >
					<li>
					    <div class="box">
					        <div class="comment_info">
					            <p class="id">홍**</p>
					            <p class="date">2021-08-05 18:02</p>
					            <div class="edit_box">
					                <ul class="item_list">
					                    <li class="item">
					                        <button type="button" class="btn btn_edit">수정</button>
					                    </li>
					                    <li class="item">
					                        <button type="button" class="btn btn_remove">삭제</button>
					                    </li>
					                </ul>
					            </div>
					        </div>
					        <div class="comment_txt"><span class="text">새해 복 많이 받으세요</span></div>
					    </div>
					</li>
					<li class="modify">
					    <div class="box">
					        <div class="comment_info">
					            <p class="id">홍**</p>
					            <p class="date">2021-08-05 18:02</p>
					            <div class="edit_box">
					                <ul class="item_list">
					                    <li class="item">
					                        <button type="button" class="btn btn_edit">수정</button>
					                    </li>
					                    <li class="item">
					                        <button type="button" class="btn btn_remove">삭제</button>
					                    </li>
					                </ul>
					            </div>
					        </div>
					        <div class="comment_txt">
					            <span class="text">새해 복 많이 받으세요</span>
					        </div>
							<div class="comment_edit_box">
					    		<textarea class="comment_edit_textarea" title="수정 내용 입력"></textarea>
					    		<p class="comment_word_count">0/500</p>
					    		<a href="#" class="btn">수정</a>
							</div>
					    </div>
					</li>
				</ul>
			</div> -->



		</div>
	</div>
</div>
</form:form>
</body>