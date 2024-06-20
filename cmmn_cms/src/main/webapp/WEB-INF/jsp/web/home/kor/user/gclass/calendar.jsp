<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="today1" />


<head></head>
<body>
<div class="edu-calendar pt75" id="eduListItem">
	<div class="edu-calendar__title">
		<div class="title">
			<a href="#" class="prev">이전달</a>
			<p></p>
			<a href="#" class="next">다음달</a>
		</div>
		<div class="items">
			<div class="edu-calendar__tab">
				<a href="#" class="calendar active">달력보기</a>
				<a href="#" class="list">리스트보기</a>
			</div>

			<div class="edu-calendar__category active">
				<p class="red">원격강의</p>
				<p class="green">발표회</p>
				<p class="black">현지실습</p>
				<p class="gray">종료</p>
			</div>		
		</div>
	</div>

	<!-- 달력보기 -->
	<div class="edu-calendar__item active">
		<div id="calendar"></div>
	</div>

	<!-- 리스트 보기 -->
	<div class="edu-calendar__item">

		<div style="width:100%; overflow:auto">
			<table class="board-list" style="width:2400px;" >
				<caption>리스트게시판</caption>
				<colgroup>
					<col width="50">
					<col width="100">
					<col width="100">
					<col width="50">
					<col width="100">
					<col width="100">
					<col width="200">
					<col width="300">
					<col width="300">
					<col width="80">
					<col width="80">
					<col width="80">
					<col width="80">
					<col width="80">
					<col width="80">
					<col width="80">
					<col width="80">
					<col width="80">
					<col width="80">						
					
				</colgroup>
				<thead>
				<tr>
					<th>코드</th>
					<th>학교</th>
					<th>프로그램</th>
					<th>학생수</th>
					<th>시간</th>
					<th>리더</th>
					<th>담당교사</th>
					<th>개요</th>
					<th>운영보고서</th>
					<th>수업01</th>
					<th>수업02</th>
					<th>수업03</th>
					<th>수업04</th>
					<th>수업05</th>
					<th>수업06</th>
					<th>수업07</th>
					<th>수업08</th>
					<th>수업09</th>
					<th>수업10</th>					
				</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${gclassList}" varStatus="status">
						<tr>
							<td><c:out value="${result.classCd}"/></td>
							<td><c:out value="${result.schoolNm}"/></td>
							<td><c:out value="${result.progrmCd}"/></td>
							<td><c:out value="${result.studentCnt}"/></td>
							<td><c:out value="${result.eduStartTime}"/>~<c:out value="${result.eduEndTime}"/></td>
							<td><c:out value="${result.chargeReader}"/></td>
							<td><c:out value="${result.chargeTeam}"/></td>
							<td><c:out value="${result.classTitle}"/></td>
							<td><a href="<c:out value='${result.reportsUrl}'/>" target="_blank"><c:out value="${result.reportsUrl}"/></a></td>
							<td class="<c:out value='${result.eduKind1}'/>"><c:out value="${result.gclass1}"/></td>
							<td class="<c:out value='${result.eduKind2}'/>"><c:out value="${result.gclass2}"/></td>
							<td class="<c:out value='${result.eduKind3}'/>"><c:out value="${result.gclass3}"/></td>
							<td class="<c:out value='${result.eduKind4}'/>"><c:out value="${result.gclass4}"/></td>
							<td class="<c:out value='${result.eduKind5}'/>"><c:out value="${result.gclass5}"/></td>
							<td class="<c:out value='${result.eduKind6}'/>"><c:out value="${result.gclass6}"/></td>
							<td class="<c:out value='${result.eduKind7}'/>"><c:out value="${result.gclass7}"/></td>
							<td class="<c:out value='${result.eduKind8}'/>"><c:out value="${result.gclass8}"/></td>
							<td class="<c:out value='${result.eduKind9}'/>"><c:out value="${result.gclass9}"/></td>
							<td class="<c:out value='${result.eduKind10}'/>"><c:out value="${result.gclass10}"/></td>					
						</tr>	
					</c:forEach>				
				</tbody>
			</table>
		</div>

	
	</div>
</div>

<!-- 기본 틀 -->
<div class="calendar-items-wrap">
	<ul>

		<c:forEach var="result" items="${monthList}" varStatus="status">
			<c:set var="subResult" value="item_${status.index}" />
			<c:set var="tot" value="" />
			<c:set var="categoryColor" value="red" />
			
			<li class="category" data-startDate="<c:out value='${result.eduDate}'/>">
				<a href="#" class="<c:out value='${result.eduKind}'/>">
					<span class="wrap">
						<span class="subject"><c:out value='${result.classTitle}'/> (<c:out value='${result.num}'/>차)</span>
						<span class="charge"><c:out value='${result.charge}'/></span>
						<span class="time"><c:out value='${result.eduStartTime}'/>~<c:out value='${result.eduEndTime}'/></span>
					</span>
				</a>
				<div class="calendarPop">
					<a href="#" class="close">닫기</a>
					<ul class="calendarPop__list">
						<li class="date"><c:out value='${result.eduDate}'/></li>
						<li class="type"><c:out value='${result.progrmCd}'/></li>
						<li class="subject"><c:out value='${result.schoolNm}'/>
							<ul class="sub-history__subList">
								<li><c:out value='${result.classTitle}'/> (<c:out value='${result.num}'/>차)</li>
							</ul>
						</li>
					</ul>
					<ul class="calendarPop__subList">
						<li><c:out value='${result.eduStartTime}'/>~<c:out value='${result.eduEndTime}'/></li>
						<li><c:out value='${result.charge}'/>,<c:out value='${result.resourceKind}'/></li>
					</ul>
					<a href="<c:out value='${result.reportsUrl}'/>" target="_blank" class="apply">운영보고서</a>
				</div>		
			</li>
		</c:forEach>		
		
	</ul>
</div>


<script>
	$(document).ready(function(){
		$('#calendar').ckdatepicker({
			language: 'ko',
			keyboardNavigation : false,
			enableOnReadonly : false,
			templates: {
				leftArrow: '<a href="#" title="이전달">이전달</a>',
				rightArrow: '<a href="#" title="다음달">다음달</a>'
			},
			updateViewDate : true,
			todayHighlight : false
		});

		<c:if test="${not empty vo.searchDate1}">
		var setDate = '${vo.searchDate1}';
		setDate = setDate.split("-");
		$('#calendar').ckdatepicker('setDate', new Date(setDate[0], setDate[1]-1, 1) );
		</c:if>

		contentsInit();

		var $eduArrow = $('.edu-calendar__title .title a'),
				$eduTitle = $('.edu-calendar__title .title p'),
				$eduCategory = $('.edu-calendar__category');
		
		$eduTitle.text( $('#calendar .datepicker-days .infoWrap .datepicker-switch').text() );

		$eduArrow.on('click', function(){
			if( $(this).hasClass('prev') ){
				$('#calendar .datepicker-days .infoWrap th.prev').trigger('click');
			}else{
				$('#calendar .datepicker-days .infoWrap th.next').trigger('click');
			}
			$eduTitle.text( $('#calendar .datepicker-days .infoWrap .datepicker-switch').text() );
			return false;
		});


		var setCookie = function(name, value, exp) {
			var date = new Date();
			date.setTime(date.getTime() + exp*24*60*60*1000);
			document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
		};

		var $eduTab = $('.edu-calendar__tab a'),
				$eduItem = $('.edu-calendar__item');

		$('.edu-calendar__tab a').on('click', function(){
			$eduTab.removeClass('active');
			$(this).addClass('active');
			$eduItem.removeClass('active').eq($(this).index()).addClass('active');
			if( $(this).hasClass('calendar') ){
				//$eduCategory.addClass('active');
				setCookie("showCalendar", "Y");
			}else{
				//$eduCategory.removeClass('active');
				setCookie("showCalendar", "N");
			}
			return false;
		});

		var $cal_list = $('#calendar .datepicker-days .table-condensed tbody tr td ul .category > a');
		$cal_list.on('click',function(){
			$cal_list.removeClass('active');
			$(this).toggleClass('active');
			/*
			$(this).siblings('.calendarPop').draggable();
			*/

			$(this).siblings('.calendarPop').draggable();
			return false;
		});

		$('#calendar .datepicker-days tbody td .calendarPop .close').on('click',function(){
			$(this).closest('.calendarPop').siblings('a').removeClass('active');

			$(this).closest('.calendarPop').removeAttr('style');
			return false;
		});

		$(".reset").click(function(){
			location.href="/home/kor/gclass/calendar.do";
		});

	});

	function contentsInit(){
		$('.calendar-items-wrap > ul > li').each(function(){
			$('#calendar .datepicker-days .table-condensed tbody tr td').filter('[data-date="' + $(this).data().startdate + '"]').find('> ul').append( $(this)[0].outerHTML );
		});
	}
</script>

</body>