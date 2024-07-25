<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<head>
<script type="text/javascript" defer="defer">
	function fn_edit(act, idx, secret) {
		<c:choose>
			<c:when test="${boardData.viewAuth eq 'A'}">
				alert('관리자만 접근가능합니다.');
				return;
			</c:when>
			<c:when test="${boardData.viewAuth eq 'U' and empty usrSession}">
				alert('로그인 후 이용해주세요.');
				return;
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${boardData.secretAt eq 'Y'}">
						if(secret == 'Y') {
							var inputData = prompt('비밀번호를 입력하세요.');

							if(inputData) {
								var data = {'idx':idx, 'inputData':inputData};
								fn_cmmn_ajax('/cms/board/secret.ajax', true, data, 'text', function(result) {
									if(result == 'Y') {
										$('#act').val(act);
										$('#idx').val(idx);
										$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
										$('#cmmnForm').submit();
									} else {1
										alert('비밀번호가 틀렸습니다.\n다시 입력해주세요.');
										return;
									}
								}, true);
							} else if(inputData != null) {
								alert('비밀번호를 입력해주세요.');
								return;
							}
						} else {
							$('#act').val(act);
							$('#idx').val(idx);
							$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
							$('#cmmnForm').submit();
						}
					</c:when>
					<c:otherwise>
						$('#act').val(act);
						$('#idx').val(idx);
						$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
						$('#cmmnForm').submit();
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	}
	
	function fn_search() {
		$('#act').remove();
		$('#pageIndex').val('1');
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}
	
	function fn_regist() {
		$('#act').val('regist');
		$('#cmmnForm').attr('action', "${vo.selfPath}board.do");
		$('#cmmnForm').submit();
	}
	
	function fn_cate_top_click(obj, search) {
		$('#'+search).val($(obj).attr('data'));
		$('.cate_top_'+search).removeClass('on');
		$(obj).parent().addClass('on');
	}
	
	function fn_cmmn_list_page(pageNo) {
		$('#act').remove();
		$('#pageIndex').val(pageNo);
		$('#cmmnForm').attr('action', "${vo.selfURI}");
		$('#cmmnForm').submit();
	}
	
	function fn_cms_category(obj) {
		$(obj).parent().parent().parent().find('button').removeClass('chk');
		$(obj).addClass('chk');
		$(obj).parent().parent().parent().prev().val($(obj).attr('data'));
	}
	
	$('#searchKeyword').on('keypress', function() {
		if (window.event.keyCode == 13) {
			fn_search();
		}
	});
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="get">
<input type="hidden" name="menuPos" value="${menuPos}"/>
<input type="hidden" id="act" name="act"/>
<input type="hidden" id="idx" name="idx"/>

<div class="cont_wrap">
	<div class="cont_each">
<%-- 		<c:if test="${boardData.searchAt eq 'Y'}"> --%>
<!-- 			<div class="search_wrap"> -->
<!-- 				<div class="base flex"> -->
<%-- 					<c:if test="${not empty textSearch}"> --%>
<!-- 						<label for="searchValue1">카테고리</label> -->
<!-- 						<select name="searchValue1" id="searchValue1"> -->
<!-- 							<option value="0">전체</option> -->
<%-- 							<c:forEach items="${textSearch}" var="list" varStatus="status"> --%>
<%-- 								<option value="${list.field}" <c:if test="${list.field eq vo.searchValue1}">selected="selected"</c:if>><c:out value="${list.title}"/></option> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
<%-- 					</c:if> --%>
<%-- 					<form:input path="searchKeyword" placeholder="검색어를 입력하세요." class="search_word"/> --%>
<!-- 					<button type="button" class="btn_search" onClick="fn_search();">검색 <i class="xi-search"></i></button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 		</c:if> --%>
		<c:if test="${boardData.searchAt eq 'Y'}">
			<div class="search_wrap">
				<div class="base">
					<div class="flex">
						<c:if test="${not empty textSearch}">
							<label for="searchValue1">카테고리</label>
							<select name="searchValue1" id="searchValue1">
								<option value="0">전체</option>
								<c:forEach items="${textSearch}" var="list" varStatus="status">
									<option value="${list.field}" <c:if test="${list.field eq vo.searchValue1}">selected="selected"</c:if>><c:out value="${list.title}"/></option>
								</c:forEach>
							</select>
						</c:if>
						<form:input path="searchKeyword" placeholder="검색어를 입력하세요." class="search_word"/>
					</div>
				</div>
				<c:if test="${not empty categorySearch or not empty dateSearch}">
					<c:set var="detail_box" value="false"/>
					<div class="detail" style="display: none;">
						<c:forEach items="${categorySearch}" var="list" varStatus="status">
							<c:set var="cateIdx" value="${fn:substring(list.field, 13, fn:length(list.field))}"/>
							<c:set var="getCateName" value="category${cateIdx}Name"/>
							<c:set var="getCateChildren" value="${list.field}Children"/>
							<c:set var="searchValue" value="searchValue${(cateIdx * 2)+1}"/>
							<c:set var="searchValueChild" value="searchValue${(cateIdx * 2)+2}"/>
							<c:set var="cateList" value="${cateIdx eq 1 ?categoryList1 :cateIdx eq 2 ?categoryList2 :cateIdx eq 3 ?categoryList3 :categoryList4}"/>
							<c:choose>
								<c:when test="${list.option eq 'R'}">
								</c:when>
								<c:when test="${list.option eq 'S'}">
									<div class="flex">
										<label for="categori"><c:out value="${list.title}" escapeXml="false"/></label>
										<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/>
										<select id="${searchValue}" name="${searchValue}">
											<option value="">전체</option>
											<c:forEach items="${cateList}" var="cate" varStatus="varStatus2">
												<option value="${cate.no}" <c:if test="${cate.no eq vo[searchValue]}">selected="selected"</c:if>><c:out value="${cate.dataName}"/></option>
											</c:forEach>
										</select>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						
						<c:forEach items="${dateSearch}" var="date" varStatus="status">
						<c:set var="dateType" value="${fn:indexOf(date.field, 'dateField') ne -1 ?'01' :'02'}"/>
						<div class="flex">
							<label for="categori"><c:out value="${date.title}"/></label>
							<div class="calendar_wrap">
								<c:choose>
									<c:when test="${dateType eq '01'}">
										<c:set var="dateIdx" value="${fn:substring(date.field, 9, fn:length(date.field))}"/>
										<c:set var="searchDate" value="searchDate${dateIdx}"/>
										<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/>
										<input type="text" id="${searchDate}" name="${searchDate}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 일자 (yyyy-mm-dd)" value="${vo[searchDate]}" style="cursor: pointer;">
									</c:when>
									<c:when test="${dateType eq '02'}">
										<c:set var="dateIdx" value="${fn:substring(date.field, 14, fn:length(date.field))}"/>
										<c:choose>
											<c:when test="${dateIdx eq 1}">
												<c:set var="searchDateStart" value="searchDate5"/>
												<c:set var="searchDateEnd" value="searchDate6"/>
											</c:when>
											<c:when test="${dateIdx eq 2}">
												<c:set var="searchDateStart" value="searchDate7"/>
												<c:set var="searchDateEnd" value="searchDate8"/>
											</c:when>
										</c:choose>
										<c:set var="detail_box" value="${detail_box or not empty vo[searchDateStart] or not empty vo[searchDateEnd] ?true :false}"/>
										<div class="calendar"><input type="text" id="${searchDateStart}" name="${searchDateStart}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 시작 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateStart]}" style="cursor: pointer;" ></div>
										<div class="calendar"><input type="text" id="${searchDateEnd}" name="${searchDateEnd}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 종료 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateEnd]}" style="cursor: pointer;"></div>
									</c:when>
								</c:choose>
							</div>
						</div>
						</c:forEach>
					</div>
				</c:if>
				<div class="btn_area"><button type="button" class="btn_search" onClick="fn_search();">검색 <i class="xi-search"></i></button></div>
				<c:if test="${not empty categorySearch or not empty dateSearch}">
					<div class="btn_bottom">
						<button type="button" class="btn_open">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 179.61 36.13" width="200px" height="45px">
								<polygon points="159.61 36.13 20 36.13 0 0 179.61 0 159.61 36.13" style="fill:#317baa" />
								<text transform="translate(57.61 23.74)" style="font-size:14px;fill:#fff;font-family:'CoreDream', 'sans-serif';font-weight:500">상세보기</text>
								<polygon class="pointcursor" points="129.12 17.42 124.19 22.35 119.27 17.42 129.12 17.42" style="fill:#fff" />
							</svg>
						</button>
						<button type="button" class="btn_close">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 179.61 36.13" width="220px" height="50px">
								<polygon points="159.61 36.13 20 36.13 0 0 179.61 0 159.61 36.13" style="fill:#317baa" />
								<text transform="translate(57.61 23.74)" style="font-size:14px;fill:#fff;font-family:'CoreDream', 'sans-serif';font-weight:500">닫기</text>
								<polygon class="pointcursor" points="129.12 17.42 124.19 22.35 119.27 17.42 129.12 17.42" style="fill:#fff" />
							</svg>
						</button>
					</div>
				</c:if>
			</div>
		</c:if>
		
		<div class="table_top_nav">
			<div class="left_area page_num"><i class="xi-file-text-o"></i> 총 <span class="point_blue"><c:out value="${boardData.pagingAt eq 'Y' ?paginationInfo.totalRecordCount :fn:length(resultList)}"/></span>개</div>
			
			<div class="right_area page_num">
				<select id="searchValue11" name="searchValue11" class="slt_data fr" style="width:150px" onChange="fn_search();">
					<option value="" <c:if test="${empty vo.searchValue11}">selected="selected"</c:if>><c:out value="정렬순서"/></option>
					<option value="1" <c:if test="${1 eq vo.searchValue11}">selected="selected"</c:if>><c:out value="최신순"/></option>
					<option value="2" <c:if test="${2 eq vo.searchValue11}">selected="selected"</c:if>><c:out value="조회순"/></option>
				</select>
			</div>
		</div>
							
		<div class="board_wrap mobile">
			<ul>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<li>
						<c:forEach items="${boardData.listViewFields}" var="field" varStatus="status2">
							<c:choose>
								<c:when test="${field eq 'no'}">
									<c:choose>
										<c:when test="${list.isTop eq 'Y'}">
											<div class="teg">
												<span class="teg_notice">공지</span>
											</div>
										</c:when>
									</c:choose>
								</c:when>
								<c:when test="${field eq 'title'}">
									<a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer">
										<c:if test="${boardData.secretAt eq 'Y' and not empty list.secret}">[비밀글]</c:if>
										<c:if test="${list.isNew eq 'Y'}"><span class="text"></c:if><c:out value="${list.title}" escapeXml="false"/><c:if test="${list.isNew eq 'Y'}"></span></c:if>
									</a>
									<div class="title">
										<a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer">
											<c:if test="${boardData.secretAt eq 'Y' and not empty list.secret}">[비밀글]</c:if>
											<c:if test="${list.isNew eq 'Y'}"><span class="text"></c:if><c:out value="${list.title}" escapeXml="false"/><c:if test="${list.isNew eq 'Y'}"></span></c:if>
										</a>
										<i class="file xi-paperclip"><span class="hide">파일</span></i>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<div class="order_list">
							<dl>
								<dt>조회수</dt>
								<dd><a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer"><c:out value="${list.cnt}"/></a></dd>
							</dl>
							<dl>
								<dt>글쓴이</dt>
								<dd><a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer"><c:out value="${list.writer}" escapeXml="false"/></a></dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd><a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer"><c:out value="${list.regDate}"/></a></dd>
							</dl>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="board_wrap web">
			<table>
				<colgroup>
		            <c:forEach items="${boardData.listViewPercents}" var="list" varStatus="status">
		            <c:if test="${boardData.listViewFields[status.index] ne 'useAt'}">
						<col style="width: ${list}%;">
					</c:if>
					</c:forEach>
				</colgroup>
				<thead>
				  <tr>
				        <c:forEach items="${boardData.listViewTitles}" var="list" varStatus="status">
				        <c:if test="${boardData.listViewFields[status.index] ne 'useAt'}">
							<th><c:out value="${list eq 'no' ?'No' :list}"/></th>
						</c:if>
						</c:forEach>
				    </tr>
				</thead>
				<tbody>
				  <c:forEach items="${resultList}" var="list" varStatus="status">
					<tr <c:if test="${list.isTop eq 'Y'}">class="red"</c:if>>
						<c:forEach items="${boardData.listViewFields}" var="field" varStatus="status2">
						<c:if test="${field ne 'useAt'}">
						<td class="${boardData.listViewClasses[status2.index]}" <c:if test="${field eq 'title'}">style="text-align:left"</c:if> >
							<c:choose>
								<c:when test="${field eq 'no'}">
									<a href="javascript:void(0);" onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');">
										<fmt:formatNumber value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageUnit + status.count)}" pattern="#,###"/>
									</a>
								</c:when>
								<c:when test="${field eq 'register'}">
									<a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer"><c:out value="${list.writer}" escapeXml="false"/></a>
								</c:when>
								<c:when test="${field eq 'title'}">
									<c:if test="${list.isNew eq 'Y'}"><span class="teg_new">new</span></c:if> 
									<c:if test="${list.isTop eq 'Y'}"><span class="teg_notice">공지</span></c:if>
									<a href="javascript:void(0);" onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');">
										<c:if test="${boardData.secretAt eq 'Y' and not empty list.secret}">[비밀글]</c:if>
										<c:out value="${list.title}" escapeXml="false"/>
									</a>
								</c:when>
								<c:when test="${field eq 'attachFile'}">
									<c:choose>
										<c:when test="${not empty list.attachName}">
											<a onclick="cmmn_file_down('${list.attachName}','${list.attachReName}');" style="cursor: pointer;"><img src="/images/cmmn/file/filetype/${list.extension}.gif" onerror="this.src='/images/cmmn/file/filetype/unknown.gif'" alt="첨부파일"></a>
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${field eq 'useAt'}">
									<a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer"><c:out value="${list.useAt eq 'Y'?'사용' :'미사용'}"/></a>
								</c:when>
								<c:when test="${fn:indexOf(field, 'categoryField') ne -1}">
									<c:set var="cateIdx" value="${fn:substring(field, 13, fn:length(field))}"/>
									<c:set var="getCate" value="category${cateIdx}Name"/>
									<c:set var="getCateChild" value="category${cateIdx}ChildName"/>
									<a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer">
										<c:out value="${list.get(getCate)}" escapeXml="false"/>
										<c:if test="${not empty list.get(getCateChild)}">
										 > <c:out value="${list.get(getCateChild)}" escapeXml="false"/>
										</c:if>
									</a>
								</c:when>
								<c:when test="${fn:indexOf(field, 'dateArrayField') ne -1}">
		                                <c:set var="startDate" value="${field}Start"/>
		                                <c:set var="endDate" value="${field}End"/>
		                                <a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer">
		                                        <c:out value="${list.get(startDate)} ~ ${list.get(endDate)}" escapeXml="false"/>
		                                </a>
		                        </c:when>
		                        <c:when test="${field eq 'answerAt'}">
			                    	<c:choose>
			                    		<c:when test="${boardData.answerAt eq 'Y' and not empty list.answer and list.answer ne '<p>&nbsp;</p>'}">
			                    			[답변완료]
			                    		</c:when>
			                    		<c:otherwise>
			                    			[답변 미완료]
			                    		</c:otherwise>
			                    	</c:choose>
			                    </c:when>
								<c:otherwise>
									<a onClick="fn_edit('detail', '${list.no}', '${not empty list.secret ?'Y' :'N'}');" style="cursor:pointer"><c:out value="${list.get(field)}" escapeXml="false"/></a>
								</c:otherwise>
							</c:choose>
						</td>
						</c:if>
						</c:forEach>
					</tr>
					</c:forEach>
					<c:if test="${empty resultList}">
					<tr>
						<td id="empty_row">등록된 게시물이 없습니다.</td>
						<script>$('#empty_row').attr('colspan',$('#empty_row').parent().parent().parent().find('th').length);</script>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%-- <c:if test="${boardData.searchAt eq 'Y'}"> --%>
<%-- <div class="cont_wrap ${not empty categorySearch or not empty dateSearch ?' details_sch' :''}"> --%>
<!-- 	<div class="sch_box"> -->
<!-- 		<div class="box"> -->
<!-- 			<div class="row"> -->
<%-- 			<c:if test="${not empty textSearch}"> --%>
<!-- 				<label for="searchValue1">키워드</label> -->
<!-- 				<div class="slt_box"> -->
<!-- 					<select id="searchValue1" name="searchValue1"> -->
<!-- 						<option value="0">전체</option> -->
<%-- 						<c:forEach items="${textSearch}" var="list" varStatus="status"> --%>
<%-- 							<option value="${list.field}" <c:if test="${list.field eq vo.searchValue1}">selected="selected"</c:if>><c:out value="${list.title}"/></option> --%>
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<div class="input_box"> -->
<%-- 					<form:input path="searchKeyword" placeholder="검색어를 입력하세요."/> --%>
<!-- 				</div> -->
<%-- 			</c:if> --%>
<!-- 			</div> -->
<!-- 			<button type="button" onClick="fn_search();" class="st_sch_btn"><span class="ico">검색</span></button> -->
<!-- 		</div> -->
		
<%-- 		<c:if test="${not empty categorySearch or not empty dateSearch}"> --%>
<%-- 		<c:set var="detail_box" value="false"/> --%>
<!-- 		<div class="box" style="display: none;"> -->
<!-- 			<div class="com_data_box"> -->
<%-- 				<c:forEach items="${categorySearch}" var="list" varStatus="status"> --%>
<%-- 				<c:set var="cateIdx" value="${fn:substring(list.field, 13, fn:length(list.field))}"/> --%>
<%-- 				<c:set var="getCateName" value="category${cateIdx}Name"/> --%>
<%-- 				<c:set var="getCateChildren" value="${list.field}Children"/> --%>
<%-- 				<c:set var="searchValue" value="searchValue${(cateIdx * 2)+1}"/> --%>
<%-- 				<c:set var="searchValueChild" value="searchValue${(cateIdx * 2)+2}"/> --%>
<%-- 				<c:set var="cateList" value="${cateIdx eq 1 ?categoryList1 :cateIdx eq 2 ?categoryList2 :cateIdx eq 3 ?categoryList3 :categoryList4}"/> --%>
				
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${list.option eq 'R'}"> --%>
<!-- 							<div class="com_data chk_list_area"> -->
<!-- 								<div class="tit_box"> -->
<%-- 									<div class="tit"><c:out value="${list.title}"/></div> --%>
<!-- 								</div> -->
<!-- 								<div class="chk_list"> -->
<%-- 									<c:set var="detail_box" value="${not empty vo[searchValue] ?true :false}"/> --%>
<%-- 									<input type="hidden" id="${searchValue}" name="${searchValue}" value="${vo[searchValue]}"/> --%>
<!-- 									<ul class="list"> -->
<!-- 										<li> -->
<!-- 											<div class="btn_box"> -->
<%-- 												<button type="button" class="btn<c:if test="${empty vo[searchValue]}"> chk</c:if>" onClick="fn_cms_category(this);" data="">전체</button> --%>
<!-- 											</div> -->
<!-- 										</li> -->
<%-- 										<c:forEach items="${cateList}" var="cate" varStatus="varStatus2"> --%>
<!-- 										<li> -->
<!-- 											<div class="btn_box"> -->
<%-- 												<button type="button" class="btn<c:if test="${cate.no eq vo[searchValue]}"> chk</c:if>" onClick="fn_cms_category(this);" data="${cate.no}"><c:out value="${cate.dataName}"/></button> --%>
<!-- 											</div> -->
<!-- 										</li> -->
<%-- 										</c:forEach> --%>
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${list.option eq 'S'}"> --%>
<!-- 							<div class="com_data slt_area"> -->
<!-- 								<div class="tit_box"> -->
<%-- 									<div class="tit"><c:out value="${list.title}"/></div> --%>
<!-- 								</div> -->
<!-- 								<div class="slt_box"> -->
<%-- 									<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/> --%>
<%-- 									<select id="${searchValue}" name="${searchValue}"> --%>
<!-- 										<option value="">전체</option> -->
<%-- 										<c:forEach items="${cateList}" var="cate" varStatus="varStatus2"> --%>
<%-- 											<option value="${cate.no}" <c:if test="${cate.no eq vo[searchValue]}">selected="selected"</c:if>><c:out value="${cate.dataName}"/></option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:when> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>
				
<%-- 				<c:forEach items="${dateSearch}" var="date" varStatus="status"> --%>
<%-- 				<c:set var="dateType" value="${fn:indexOf(date.field, 'dateField') ne -1 ?'01' :'02'}"/> --%>
<!-- 				<div class="com_data period_area"> -->
<!-- 					<div class="tit_box"> -->
<%-- 						<div class="tit"><c:out value="${date.title}"/></div> --%>
<!-- 					</div> -->
<!-- 					<div class="period_box"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${dateType eq '01'}"> --%>
<%-- 								<c:set var="dateIdx" value="${fn:substring(date.field, 9, fn:length(date.field))}"/> --%>
<%-- 								<c:set var="searchDate" value="searchDate${dateIdx}"/> --%>
<%-- 								<c:set var="detail_box" value="${detail_box or not empty vo[searchValue] ?true :false}"/> --%>
<%-- 								<input type="text" id="${searchDate}" name="${searchDate}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 일자 (yyyy-mm-dd)" value="${vo[searchDate]}" style="cursor: pointer;"> --%>
<%-- 							</c:when> --%>
<%-- 							<c:when test="${dateType eq '02'}"> --%>
<%-- 								<c:set var="dateIdx" value="${fn:substring(date.field, 14, fn:length(date.field))}"/> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${dateIdx eq 1}"> --%>
<%-- 										<c:set var="searchDateStart" value="searchDate5"/> --%>
<%-- 										<c:set var="searchDateEnd" value="searchDate6"/> --%>
<%-- 									</c:when> --%>
<%-- 									<c:when test="${dateIdx eq 2}"> --%>
<%-- 										<c:set var="searchDateStart" value="searchDate7"/> --%>
<%-- 										<c:set var="searchDateEnd" value="searchDate8"/> --%>
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
<%-- 								<c:set var="detail_box" value="${detail_box or not empty vo[searchDateStart] or not empty vo[searchDateEnd] ?true :false}"/> --%>
<%-- 								<input type="text" id="${searchDateStart}" name="${searchDateStart}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 시작 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateStart]}" style="cursor: pointer;" > --%>
<!-- 								<span class="etc">~</span> -->
<%-- 								<input type="text" id="${searchDateEnd}" name="${searchDateEnd}" class="date_inp datepicker" placeholder="연도-월-일" title="검색 종료 일자 (yyyy-mm-dd)" onChange="datepicker_start('${searchDateStart}','${searchDateEnd}')" value="${vo[searchDateEnd]}" style="cursor: pointer;"> --%>
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
<!-- 			<script type="text/javascript"> -->
<%-- // 				<c:if test="${detail_box}">setTimeout(function() {$('#detail_box').trigger('click');}, 200);</c:if> --%>
<!-- 			</script> -->
<!-- 		</div> -->
<%-- 		</c:if> --%>
<!-- 	</div> -->
	
<%-- 	<c:if test="${not empty categorySearch or not empty dateSearch}"> --%>
<!-- 	<div class="det_btn"> -->
<!-- 		<button type="button" id="detail_box" class="btn"><span class="text">상세검색</span></button> -->
<!-- 	</div> -->
<%-- 	</c:if> --%>
<!-- </div> -->
<%-- </c:if> --%>

<c:if test="${boardData.registAuth eq 'E' or (boardData.registAuth eq 'U' and not empty usrSession)}">
<div class="btn_area">
	<a href="javascript:void(0);" onClick="fn_regist();" class="btn_color">글쓰기</a>
</div>
</c:if>

	<!-- pagination -->
	<c:if test="${boardData.pagingAt eq 'Y'}">
	<div id="paging" class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_cmmn_list_page" />
		<form:hidden path="pageIndex" />
	</div>
	</c:if>
	<!-- // pagination -->
	
</form:form>
</body>