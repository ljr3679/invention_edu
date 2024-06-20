###UPDATE NOTE

##2021-05-28 UPDATE
	1. 파일 시스템 개편
		- Drag & Drop 지원
		- 다중업로드 지원
		- 다운로드 수 및  mime type 정보 추가
	ex) <c:out value="${cFn:kssFileInclude('fileDataList1', 3, null, 10, 'KB', true, fileList)}" escapeXml="false"/>

##2021-07-08 UPDATE
	1. 지도 공통 추가
		- 각 id 값에 맞추어 데이터 삽입
		- picker map 지원 (사용시 위도 경도 true 및 id 값이 pickerMap 인 div 필요)
	
	ex) 주소검색 onclick -> fn_post_office(ture or false); -> ture : 위도 경도 사용 , false : 위도 경도 미사용
		지도 사용 jsp 페이지에 스크립트 추가
		<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@globals['gbls.kakao.key']" />&libraries=services,clusterer"></script>
		
		- 우편번호 id : zipCode
		- 주소 id : address
		- 상세주소 id : addressDetail
		- 위도 id : latitude
		- 경도 id : longitude
		- picker map div id : pickerMap
	
##2021-07-22 UPDATE
	1. HandlerMapping Custom
		- 사이트 구분 값 추가 및 언어 구분 값 재정의
			1. 관리자 및 ajax 호출은 POST 강제
			2. CMS 및 특정 컨트롤러 제외 URL에 사이트 구분 값 및 언어 구분 값 추가
		- mvc:annotation-driven 사용을 제외한 후 수동으로 각 bean들을 추가 mapping
		- 컨트롤러에서 view render는 패키지 구조에 따라 mapping
		- 패키지 구조에 따라 중복 컨트롤러 생성 가능
	
	2. AOP 사용으로 컨트롤러 진입 전 후 action을 재조정
		1. CommonVO 활용성 대폭 높힘
			- 각 컨트롤러 return Class를 void로 조정 (Servlet을 수정하여 rendering시 CommonVO안의 returnPage를 참조 하도록)
			- action 컨트롤러는 기능은 그대로 action.jsp를 활용
			- model에 담아 주지 않아도 CommonVO는 vo명으로 parameter 추가
			
	[준비중]
	1. 특정 파라미터 존재시에만 사이트 접근 가능(특정 파라미터값은 암호화된 값으로 강제적으로 request에 담아둘 예정) -> HttpServletRequestWrapper 클래스 재정의 및 servlet - service 단계 수정
	2. 등록되지 않은 URI 접근시 공통 에러페이지 재조정 -> 퍼블요청단계
	3. AOP 페이징 처리
	4. AOP 사용자 세션 접근 공통화 -> 처리 완료
	5. hibernate conntection pool 생성
	6. 휴지통 기능 
	
	
##2021-10-25 UPDATE
	1. datasource config 수정 (global.properties 에서 dbms 타입 변환시 추가적인 작업 없도록 조정)
	2. 2021-07-22 update note에 있던 AOP 사용자 세션 접근 공통화 처리 완료
	3. 사용자 또는 관리자에서 사용하는 Drag & Drop 미지원하는 파일 묘듈 버그 수정
	4. api 모듈 추가
		- email
		- sms
		- nice -> 사용법은 추 후 정리(아직은 dasom프로젝트 참조)
		
##2021-10-28 UPDATE
	1. menu builder 생성
		- 별도 java project로 존재 -> 추후 exe파일로 추출 예정
		- 등록된 고정 메뉴에 대해 java(ctr, svc, impl) / xml(dbms에 따라) / jsp 파일을 자동으로 default로 생성 -> 추 후 테이블 코멘트에 따라 유동적으로 query 및 view 생성 예정
	
##2021-11-13 UPDATE
	1. SmartEditor 단일 업로드 오류 수정
		- 기존 smartEditor에서 제공해주는 단일 업로드 sample소스가 현 프로젝트 셋팅과 상이해서 발생하는 문제인지 넘겨오는  parameter parsing 과정에서 정상적인 작동을 하지 않고 있었음.
			-> 로직을 새로 만들어 정상작동 되도록 수정
	2. 추가된 공통 파일 업로드 폼에 zip 다운로드 기능 추가
		- 기존 library와 zip 다운로드에 필요한 library가 충돌나 버전 업데이트 진행
	3. 이미지 자동 thumbnail
		- 사이즈가 과한 이미지가 업로드 될 경우 표출될 시 브라우저에 부담이 가 버벅이는 현상을 방지
	4. util 추가 (pattern, format)
		- Pattern(정규식), Format(형변환 - 자료형 형변환이 아닌 문자식 변경) Utility 파일을 추가
		- 앞으로 각 성격에 맞는 utility들로 별도 분리해서 관리 예정
	5. oracle 리스트 파일 쿼리 오류 수정
		- 기존 inline view 쿼리가 전체 데이터 중 단건만 호출되도록 되는 오류를 발견 -> 각 identifier에 맞는 key_ref 중 랭크를 매겨 최상단 데이터 1건식 호출되도록 수정
	
##2021-12-05 UPDATE
	1. action handler 추가
		- 공통 컨트롤러에 페이지 이동을 위한 공통 handler 추가
	
	2. UsrInterceptor 수정
		- 사이트에서 필수값 요구
			-> 누락 및 validate에 어긋날 경우 request에서 배제
	
	3. interceptor 수정
		- 조건 추가
	
##2021-12-13 UPDATE
	1. log4j JNDI -> LDAP 호출 이슈
		- 취약점 대비 log4j load 할 수 없도록 라이브러리 내 JndiLookup class를 제거
		
##2021-12-14 UPDATE
	1. 게시판 복사 기능 추가