<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->

<div class="list-header">
	<label>Total : </label><span><c:out value="${paginationInfo.totalRecordCount}"/></span>
	<label>Page : </label><span><c:out value="${paginationInfo.currentPageNo}"/>&nbsp;/&nbsp;<c:out value="${paginationInfo.lastPageNo}"/></span>
</div>

<div class="list-search">
	<form id="searchForm" name="searchForm" action="/kosie/judge/" method="get">
		<div class="search-order">
			<a href="javascript:void(0);" onClick="fn_orderby('B');" class="btn-sort active" title=" 좋아요 오름차순 정렬">
				<p style="">좋아요 오름차순</p>
			</a>
			<a href="javascript:void(0);" onClick="fn_orderby('C');" class="btn-sort active" title=" 종아요 내림차순 정렬">
				<p style="">좋아요 내림차순</p>
			</a>
			<a href="javascript:void(0);" onClick="fn_orderby('D');" class="btn-sort active" title=" 접수번호 정렬">접수번호</a>
		</div>
		<div class="search-keyword">
			<div class="input-group">
				<div class="input-group-btn">
					<div class="btn-group bootstrap-select">
						<select id="searchValue3" name="searchValue3" class="selectpicker">
							<option value="1" <c:if test="${vo.searchValue3 eq '1'}">selected="selected"</c:if>>접수번호</option>
							<option value="2" <c:if test="${vo.searchValue3 eq '2'}">selected="selected"</c:if>>발명명칭</option>
						</select>
					</div>
				</div>
				<div class="input-group-btn">
					<input type="text" id="searchKeyword" name="searchKeyword" value="${vo.searchKeyword}" class="form-control" placeholder="검색어를 입력하세요." title="검색어를 입력하세요.">
					<button type="submit" onClick="fn_cmmn_search();" class="btn btn-default">
						<i class="xi-search"></i>
					</button>
				</div>
			</div>
		</div>
		<div>
		</div>
	</form>
</div>

<div class="bbs_list">
	<c:forEach items="${resultList}" var="list" varStatus="status">
		<div class="list_pac">
			<div class="list_thumb">
				<a href="javascript:popupOpen('${list.no}');" class="goView img_on" style="background-image: url('/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do');">
					<!-- 배경이미지가 있을시에 img_on class추가 -->
					<%-- <img src="/images/site/${fn:substring(list.attachReName, 0, fn:indexOf(list.attachReName, list.attachExtension)-1)}/${list.attachExtension}/loader.do" alt="대표이미지"> --%>
					<img src="/images/home/kor/user/judge/noimg.jpg" onerror="this.src='/images/home/kor/user/judge/noimg.jpg'" alt="대표이미지">
				</a>
			</div>
			<p class="list_title">
				<a href="javascript:popupOpen('${list.no}');" class="goView" title="명칭테스트"><c:out value="${list.title}"  escapeXml="false"/> </a>
			</p>
			<p class="list_num">접수번호 <c:out value="${list.regNo}"/> </p>
			<div class="click-area">
				<span title="좋아요 수" style="font-size:13px;font-weight:500;color:#fa4545;"><c:out value="${list.likeCnt}" /></span>
				<!-- 선택전 버튼 -->
				<button class="heart" title="좋아요" onclick="fn_like('${list.no}','${usrSession.no}',this);">
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30px" height="27px">
						<image x="0px" y="0px" width="30px" height="27px" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAbCAQAAADB9PeaAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQfmBQsSBiP4t/ukAAABcUlEQVQ4y53SwWvPcRzH8Ue/pvxirTgqLsRBkuSidjFaK6L4B+YgKy7sTI4cxclBNCuR1EQO1q9WDruIYhaHnSyK02QLL4evn/389vtt39/vefr0en2e9en9/lCnxxmvRMRb563/11Sc9fpv88Y5VU0M+SliyrhJSyKOgyMWxW8142p+iTjRqI6Iz441JId8EKccFfMGG5pBc2J0+WJMWsl9EU9bNBP1d1Us+ao1C9KmmRM9nBb9ba7ssb9Ns1dcYMaibvjiG/G4K3lMKnjflTxPBb1dydVCPtCVvANqbdexOt99rLiLfR2ru1TdYIN42bH8RPTBLbG7I3WbeFAc14lPHcmzsryjk+JOafW6GG4OLpdSR8Xt5vCRuLSmelG8aFVMiJurqlfbqRRzn7KpZbfRc3FvrWfFwIr8oIUyU+n3Q1z7L7si4nCZefZ6KGbsBFtNi2c2l1ELhkUMGRAxUl4s2GJaxDvbO1ULxuo/uDV/AMrggXZrDQ8vAAAAAElFTkSuQmCC" />
					</svg>
					<p>좋아요</p>
				</button>
			</div>
		</div>
	</c:forEach>
</div>
	
<!-- <div class="dataTables_paginate"> -->
<%-- 	<ui:pagination paginationInfo="${paginationInfo}" type="user" jsFunction="fn_cmmn_page" /> --%>
<%-- 	<form:hidden path="pageIndex" /> --%>
<!-- </div> -->
