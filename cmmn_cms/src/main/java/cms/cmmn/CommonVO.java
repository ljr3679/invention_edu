package cms.cmmn;

import java.io.Serializable;
import java.util.List;

import cms.constant.Const;
import cms.util.Serialize;

@SuppressWarnings("serial")
public class CommonVO extends PagingVO implements Serializable {
	
	/** SEARCH */
	private String searchKeyword = "";
	private String searchKeyword2 = "";
	private String searchKeyword3 = "";
	private String searchKeyword4 = "";
	private String searchValue1 = "";
	private String searchValue2 = "";
	private String searchValue3 = "";
	private String searchValue4 = "";
	private String searchValue5 = "";
	private String searchValue6 = "";
	private String searchValue7 = "";
	private String searchValue8 = "";
	private String searchValue9 = "";
	private String searchValue10 = "";
	private String searchValue11 = "";
	private String searchDate1 = "";
	private String searchDate2 = "";
	private String searchDate3 = "";
	private String searchDate4 = "";
	private String searchDate5 = "";
	private String searchDate6 = "";
	private String searchDate7 = "";
	private String searchDate8 = "";
	
	private List<?> searchValueList1;
	private List<?> searchValueList2;
	private List<?> searchValueList3;
	private List<?> searchValueList4;
	/** SEARCH */
	
	/** TAB */
	private String tabPos = "";
	private String tabPos2 = "";
	private String tabPos3 = "";
	/** TAB */
	
	/** SITE */
	private String siteCode = "";
	private String langCode = "";
	private String menuPos = "";
	private String returnPage = "";
	private String forwardPage = "";
	private String redirectPage = "";
	private String selfPath = "";
	private String selfURI = "";
	private String systemMsg = "";
	private String access = "";
	private String pagingAt = "";
	private String pos = "";
	private String prev = "";
	private String prevTitle = "";
	private String next = "";
	private String nextTitle = "";
	private String downReason = "";
	/** SITE */
	
	/** PARAMETER */
	private String act = "";
	private String act2 = "";
	private String act3 = "";
	private String act4 = "";
	private String idx = "";
	private String idx2 = "";
	private String idx3 = "";
	private String idx4 = "";
	private String title = "";
	private String board_code = "";
	private String board_codes = "";
	private String paramKey1 = "";
	private String paramKey2 = "";
	private String paramKey3 = "";
	private String paramKey4 = "";
	private String paramKey5 = "";
	private String paramKey6 = "";
	private String paramKey7 = "";
	private String paramKey8 = "";
	private String paramKey9 = "";
	private String paramKey10 = "";
	private String paramKey11 = "";
	private String paramKey12 = "";
	private String paramKey13 = "";
	private String paramKey14 = "";
	private String paramKey15 = "";
	private String paramKey16 = "";
	private String paramKey17 = "";
	private String paramKey18 = "";
	private String paramKey19 = "";
	private String paramKey20 = "";
	private String paramKey21 = "";
	private String paramKey22 = "";
	private String paramKey23 = "";
	private String paramKey24 = "";
	private String paramKey25 = "";
	private String paramKey26 = "";
	private String paramKey27 = "";
	private String paramKey28 = "";
	private String paramKey29 = "";
	private String paramKey30 = "";
	private String paramKey31 = "";
	private String paramKey32 = "";
	private String paramKey33 = "";
	private String paramKey34 = "";
	private String paramKey35 = "";
	private String paramKey36 = "";
	private String paramKey37 = "";
	private String paramKey38 = "";
	private String paramKey39 = "";
	private String paramKey40 = "";
	private String paramKey41 = "";
	private String paramKey42 = "";
	private String paramKey43 = "";
	private String paramKey44 = "";
	private String paramKey45 = "";
	private String paramKey46 = "";
	private String paramKey47 = "";
	private String paramKey48 = "";
	private String paramKey49 = "";
	private String paramKey50 = "";
	
	private List<?> paramKeyList1;
	private List<?> paramKeyList2;
	private List<?> paramKeyList3;
	private List<?> paramKeyList4;
	private List<?> paramKeyList5;
	private List<?> paramKeyList6;
	private List<?> paramKeyList7;
	private List<?> paramKeyList8;
	private List<?> paramKeyList9;
	private List<?> paramKeyList10;
	/** PARAMETER */
	
	/** MEMBER */
	private String writer = "";
	
	private String usr_idx = "";
	private String usr_id = "";
	private String usr_nm = "";
	
	private String adm_idx = "";
	private String adm_id = "";
	private String adm_nm = "";
	private String adm_auth = "";
	/** MEMBER */
	
	/** FILE */
	private String identifier = "";
	private String identifier2 = "";
	private String identifier3 = "";
	private String identifier4 = "";
	private List<?> fileDataList1;
	private List<?> fileDataList2;
	private List<?> fileDataList3;
	private List<?> fileDataList4;
	private List<?> fileDataList5;
	private List<?> fileDataList6;
	private List<?> fileDataList7;
	private List<?> fileDataList8;
	private List<?> fileDataList9;
	private List<?> fileDataList10;
	private List<?> fileDataRmList;
	private List<?> fileDataNameRmList;
	/** FILE */
	
	@Override
	public String toString() {
		return Serialize.build(this);
	}
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchKeyword2() {
		return searchKeyword2;
	}
	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}
	public String getSearchKeyword3() {
		return searchKeyword3;
	}
	public void setSearchKeyword3(String searchKeyword3) {
		this.searchKeyword3 = searchKeyword3;
	}
	public String getSearchKeyword4() {
		return searchKeyword4;
	}
	public void setSearchKeyword4(String searchKeyword4) {
		this.searchKeyword4 = searchKeyword4;
	}
	public String getSearchValue1() {
		return searchValue1;
	}
	public void setSearchValue1(String searchValue1) {
		this.searchValue1 = searchValue1;
	}
	public String getSearchValue2() {
		return searchValue2;
	}
	public void setSearchValue2(String searchValue2) {
		this.searchValue2 = searchValue2;
	}
	public String getSearchValue3() {
		return searchValue3;
	}
	public void setSearchValue3(String searchValue3) {
		this.searchValue3 = searchValue3;
	}
	public String getSearchValue4() {
		return searchValue4;
	}
	public void setSearchValue4(String searchValue4) {
		this.searchValue4 = searchValue4;
	}
	public String getSearchValue5() {
		return searchValue5;
	}
	public void setSearchValue5(String searchValue5) {
		this.searchValue5 = searchValue5;
	}
	public String getSearchValue6() {
		return searchValue6;
	}
	public void setSearchValue6(String searchValue6) {
		this.searchValue6 = searchValue6;
	}
	public String getSearchValue7() {
		return searchValue7;
	}
	public void setSearchValue7(String searchValue7) {
		this.searchValue7 = searchValue7;
	}
	public String getSearchValue8() {
		return searchValue8;
	}
	public void setSearchValue8(String searchValue8) {
		this.searchValue8 = searchValue8;
	}
	public String getSearchValue9() {
		return searchValue9;
	}
	public void setSearchValue9(String searchValue9) {
		this.searchValue9 = searchValue9;
	}
	public String getSearchValue10() {
		return searchValue10;
	}
	public void setSearchValue10(String searchValue10) {
		this.searchValue10 = searchValue10;
	}
	public String getSearchValue11() {
		return searchValue11;
	}
	public void setSearchValue11(String searchValue11) {
		this.searchValue11 = searchValue11;
	}
	public String getSearchDate1() {
		return searchDate1;
	}
	public void setSearchDate1(String searchDate1) {
		this.searchDate1 = searchDate1;
	}
	public String getSearchDate2() {
		return searchDate2;
	}
	public void setSearchDate2(String searchDate2) {
		this.searchDate2 = searchDate2;
	}
	public String getSearchDate3() {
		return searchDate3;
	}
	public void setSearchDate3(String searchDate3) {
		this.searchDate3 = searchDate3;
	}
	public String getSearchDate4() {
		return searchDate4;
	}
	public void setSearchDate4(String searchDate4) {
		this.searchDate4 = searchDate4;
	}
	public String getSearchDate5() {
		return searchDate5;
	}
	public void setSearchDate5(String searchDate5) {
		this.searchDate5 = searchDate5;
	}
	public String getSearchDate6() {
		return searchDate6;
	}
	public void setSearchDate6(String searchDate6) {
		this.searchDate6 = searchDate6;
	}
	public String getSearchDate7() {
		return searchDate7;
	}
	public void setSearchDate7(String searchDate7) {
		this.searchDate7 = searchDate7;
	}
	public String getSearchDate8() {
		return searchDate8;
	}
	public void setSearchDate8(String searchDate8) {
		this.searchDate8 = searchDate8;
	}
	public List<?> getSearchValueList1() {
		return searchValueList1;
	}
	public void setSearchValueList1(List<?> searchValueList1) {
		this.searchValueList1 = searchValueList1;
	}
	public List<?> getSearchValueList2() {
		return searchValueList2;
	}
	public void setSearchValueList2(List<?> searchValueList2) {
		this.searchValueList2 = searchValueList2;
	}
	public List<?> getSearchValueList3() {
		return searchValueList3;
	}
	public void setSearchValueList3(List<?> searchValueList3) {
		this.searchValueList3 = searchValueList3;
	}
	public List<?> getSearchValueList4() {
		return searchValueList4;
	}
	public void setSearchValueList4(List<?> searchValueList4) {
		this.searchValueList4 = searchValueList4;
	}
	public String getTabPos() {
		return tabPos;
	}
	public void setTabPos(String tabPos) {
		this.tabPos = tabPos;
	}
	public String getTabPos2() {
		return tabPos2;
	}
	public void setTabPos2(String tabPos2) {
		this.tabPos2 = tabPos2;
	}
	public String getTabPos3() {
		return tabPos3;
	}
	public void setTabPos3(String tabPos3) {
		this.tabPos3 = tabPos3;
	}
	public String getSiteCode() {
		return siteCode;
	}
	public void setSiteCode(String siteCode) {
		this.siteCode = siteCode;
	}
	public String getLangCode() {
		return langCode;
	}
	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}
	public String getMenuPos() {
		return menuPos;
	}
	public void setMenuPos(String menuPos) {
		this.menuPos = menuPos;
	}
	public String getSelfPath() {
		return selfPath;
	}
	public void setSelfPath(String selfPath) {
		this.selfPath = selfPath;
	}
	public String getSelfURI() {
		return selfURI;
	}
	public void setSelfURI(String selfURI) {
		this.selfURI = selfURI;
	}
	public String getSystemMsg() {
		return systemMsg;
	}
	public void setSystemMsg(String systemMsg) {
		this.systemMsg = systemMsg;
	}
	public String getReturnPage() {
		return returnPage;
	}
	public void setReturnPage(String returnPage) {
		this.returnPage = returnPage;
	}
	public String getForwardPage() {
		return forwardPage;
	}
	public void setForwardPage(String forwardPage) {
		this.forwardPage = forwardPage;
	}
	public String getRedirectPage() {
		return redirectPage;
	}
	public void setRedirectPage(String redirectPage) {
		this.redirectPage = redirectPage;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	public String getPagingAt() {
		return pagingAt;
	}
	public void setPagingAt(String pagingAt) {
		this.pagingAt = pagingAt;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getPrev() {
		return prev;
	}
	public void setPrev(String prev) {
		this.prev = prev;
	}
	public String getNext() {
		return next;
	}
	public void setNext(String next) {
		this.next = next;
	}
	public String getDownReason() {
		return downReason;
	}
	public void setDownReason(String downReason) {
		this.downReason = downReason;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
	public String getAct2() {
		return act2;
	}
	public void setAct2(String act2) {
		this.act2 = act2;
	}
	public String getAct3() {
		return act3;
	}
	public void setAct3(String act3) {
		this.act3 = act3;
	}
	public String getAct4() {
		return act4;
	}
	public void setAct4(String act4) {
		this.act4 = act4;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getIdx2() {
		return idx2;
	}
	public void setIdx2(String idx2) {
		this.idx2 = idx2;
	}
	public String getIdx3() {
		return idx3;
	}
	public void setIdx3(String idx3) {
		this.idx3 = idx3;
	}
	public String getIdx4() {
		return idx4;
	}
	public void setIdx4(String idx4) {
		this.idx4 = idx4;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoard_code() {
		return board_code;
	}
	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}
	public String getBoard_codes() {
		return board_codes;
	}
	public void setBoard_codes(String board_codes) {
		this.board_codes = board_codes;
	}
	public String getParamKey1() {
		return paramKey1;
	}
	public void setParamKey1(String paramKey1) {
		this.paramKey1 = paramKey1;
	}
	public String getParamKey2() {
		return paramKey2;
	}
	public void setParamKey2(String paramKey2) {
		this.paramKey2 = paramKey2;
	}
	public String getParamKey3() {
		return paramKey3;
	}
	public void setParamKey3(String paramKey3) {
		this.paramKey3 = paramKey3;
	}
	public String getParamKey4() {
		return paramKey4;
	}
	public void setParamKey4(String paramKey4) {
		this.paramKey4 = paramKey4;
	}
	public String getParamKey5() {
		return paramKey5;
	}
	public void setParamKey5(String paramKey5) {
		this.paramKey5 = paramKey5;
	}
	public String getParamKey6() {
		return paramKey6;
	}
	public void setParamKey6(String paramKey6) {
		this.paramKey6 = paramKey6;
	}
	public String getParamKey7() {
		return paramKey7;
	}
	public void setParamKey7(String paramKey7) {
		this.paramKey7 = paramKey7;
	}
	public String getParamKey8() {
		return paramKey8;
	}
	public void setParamKey8(String paramKey8) {
		this.paramKey8 = paramKey8;
	}
	public String getParamKey9() {
		return paramKey9;
	}
	public void setParamKey9(String paramKey9) {
		this.paramKey9 = paramKey9;
	}
	public String getParamKey10() {
		return paramKey10;
	}
	public void setParamKey10(String paramKey10) {
		this.paramKey10 = paramKey10;
	}
	public String getParamKey11() {
		return paramKey11;
	}
	public void setParamKey11(String paramKey11) {
		this.paramKey11 = paramKey11;
	}
	public String getParamKey12() {
		return paramKey12;
	}
	public void setParamKey12(String paramKey12) {
		this.paramKey12 = paramKey12;
	}
	public String getParamKey13() {
		return paramKey13;
	}
	public void setParamKey13(String paramKey13) {
		this.paramKey13 = paramKey13;
	}
	public String getParamKey14() {
		return paramKey14;
	}
	public void setParamKey14(String paramKey14) {
		this.paramKey14 = paramKey14;
	}
	public String getParamKey15() {
		return paramKey15;
	}
	public void setParamKey15(String paramKey15) {
		this.paramKey15 = paramKey15;
	}
	public String getParamKey16() {
		return paramKey16;
	}
	public void setParamKey16(String paramKey16) {
		this.paramKey16 = paramKey16;
	}
	public String getParamKey17() {
		return paramKey17;
	}
	public void setParamKey17(String paramKey17) {
		this.paramKey17 = paramKey17;
	}
	public String getParamKey18() {
		return paramKey18;
	}
	public void setParamKey18(String paramKey18) {
		this.paramKey18 = paramKey18;
	}
	public String getParamKey19() {
		return paramKey19;
	}
	public void setParamKey19(String paramKey19) {
		this.paramKey19 = paramKey19;
	}
	public String getParamKey20() {
		return paramKey20;
	}
	public void setParamKey20(String paramKey20) {
		this.paramKey20 = paramKey20;
	}
	public String getParamKey21() {
		return paramKey21;
	}
	public void setParamKey21(String paramKey21) {
		this.paramKey21 = paramKey21;
	}
	public String getParamKey22() {
		return paramKey22;
	}
	public void setParamKey22(String paramKey22) {
		this.paramKey22 = paramKey22;
	}
	public String getParamKey23() {
		return paramKey23;
	}
	public void setParamKey23(String paramKey23) {
		this.paramKey23 = paramKey23;
	}
	public String getParamKey24() {
		return paramKey24;
	}
	public void setParamKey24(String paramKey24) {
		this.paramKey24 = paramKey24;
	}
	public String getParamKey25() {
		return paramKey25;
	}
	public void setParamKey25(String paramKey25) {
		this.paramKey25 = paramKey25;
	}
	public String getParamKey26() {
		return paramKey26;
	}
	public void setParamKey26(String paramKey26) {
		this.paramKey26 = paramKey26;
	}
	public String getParamKey27() {
		return paramKey27;
	}
	public void setParamKey27(String paramKey27) {
		this.paramKey27 = paramKey27;
	}
	public String getParamKey28() {
		return paramKey28;
	}
	public void setParamKey28(String paramKey28) {
		this.paramKey28 = paramKey28;
	}
	public String getParamKey29() {
		return paramKey29;
	}
	public void setParamKey29(String paramKey29) {
		this.paramKey29 = paramKey29;
	}
	public String getParamKey30() {
		return paramKey30;
	}
	public void setParamKey30(String paramKey30) {
		this.paramKey30 = paramKey30;
	}
	public String getParamKey31() {
		return paramKey31;
	}
	public void setParamKey31(String paramKey31) {
		this.paramKey31 = paramKey31;
	}
	public String getParamKey32() {
		return paramKey32;
	}
	public void setParamKey32(String paramKey32) {
		this.paramKey32 = paramKey32;
	}
	public String getParamKey33() {
		return paramKey33;
	}
	public void setParamKey33(String paramKey33) {
		this.paramKey33 = paramKey33;
	}
	public String getParamKey34() {
		return paramKey34;
	}
	public void setParamKey34(String paramKey34) {
		this.paramKey34 = paramKey34;
	}
	public String getParamKey35() {
		return paramKey35;
	}
	public void setParamKey35(String paramKey35) {
		this.paramKey35 = paramKey35;
	}
	public String getParamKey36() {
		return paramKey36;
	}
	public void setParamKey36(String paramKey36) {
		this.paramKey36 = paramKey36;
	}
	public String getParamKey37() {
		return paramKey37;
	}
	public void setParamKey37(String paramKey37) {
		this.paramKey37 = paramKey37;
	}
	public String getParamKey38() {
		return paramKey38;
	}
	public void setParamKey38(String paramKey38) {
		this.paramKey38 = paramKey38;
	}
	public String getParamKey39() {
		return paramKey39;
	}
	public void setParamKey39(String paramKey39) {
		this.paramKey39 = paramKey39;
	}
	public String getParamKey40() {
		return paramKey40;
	}
	public void setParamKey40(String paramKey40) {
		this.paramKey40 = paramKey40;
	}
	public String getParamKey41() {
		return paramKey41;
	}
	public void setParamKey41(String paramKey41) {
		this.paramKey41 = paramKey41;
	}
	public String getParamKey42() {
		return paramKey42;
	}
	public void setParamKey42(String paramKey42) {
		this.paramKey42 = paramKey42;
	}
	public String getParamKey43() {
		return paramKey43;
	}
	public void setParamKey43(String paramKey43) {
		this.paramKey43 = paramKey43;
	}
	public String getParamKey44() {
		return paramKey44;
	}
	public void setParamKey44(String paramKey44) {
		this.paramKey44 = paramKey44;
	}
	public String getParamKey45() {
		return paramKey45;
	}
	public void setParamKey45(String paramKey45) {
		this.paramKey45 = paramKey45;
	}
	public String getParamKey46() {
		return paramKey46;
	}
	public void setParamKey46(String paramKey46) {
		this.paramKey46 = paramKey46;
	}
	public String getParamKey47() {
		return paramKey47;
	}
	public void setParamKey47(String paramKey47) {
		this.paramKey47 = paramKey47;
	}
	public String getParamKey48() {
		return paramKey48;
	}
	public void setParamKey48(String paramKey48) {
		this.paramKey48 = paramKey48;
	}
	public String getParamKey49() {
		return paramKey49;
	}
	public void setParamKey49(String paramKey49) {
		this.paramKey49 = paramKey49;
	}
	public String getParamKey50() {
		return paramKey50;
	}
	public void setParamKey50(String paramKey50) {
		this.paramKey50 = paramKey50;
	}
	public List<?> getParamKeyList1() {
		return paramKeyList1;
	}
	public void setParamKeyList1(List<?> paramKeyList1) {
		this.paramKeyList1 = paramKeyList1;
	}
	public List<?> getParamKeyList2() {
		return paramKeyList2;
	}
	public void setParamKeyList2(List<?> paramKeyList2) {
		this.paramKeyList2 = paramKeyList2;
	}
	public List<?> getParamKeyList3() {
		return paramKeyList3;
	}
	public void setParamKeyList3(List<?> paramKeyList3) {
		this.paramKeyList3 = paramKeyList3;
	}
	public List<?> getParamKeyList4() {
		return paramKeyList4;
	}
	public void setParamKeyList4(List<?> paramKeyList4) {
		this.paramKeyList4 = paramKeyList4;
	}
	public List<?> getParamKeyList5() {
		return paramKeyList5;
	}
	public void setParamKeyList5(List<?> paramKeyList5) {
		this.paramKeyList5 = paramKeyList5;
	}
	public List<?> getParamKeyList6() {
		return paramKeyList6;
	}
	public void setParamKeyList6(List<?> paramKeyList6) {
		this.paramKeyList6 = paramKeyList6;
	}
	public List<?> getParamKeyList7() {
		return paramKeyList7;
	}
	public void setParamKeyList7(List<?> paramKeyList7) {
		this.paramKeyList7 = paramKeyList7;
	}
	public List<?> getParamKeyList8() {
		return paramKeyList8;
	}
	public void setParamKeyList8(List<?> paramKeyList8) {
		this.paramKeyList8 = paramKeyList8;
	}
	public List<?> getParamKeyList9() {
		return paramKeyList9;
	}
	public void setParamKeyList9(List<?> paramKeyList9) {
		this.paramKeyList9 = paramKeyList9;
	}
	public List<?> getParamKeyList10() {
		return paramKeyList10;
	}
	public void setParamKeyList10(List<?> paramKeyList10) {
		this.paramKeyList10 = paramKeyList10;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getUsr_idx() {
		return usr_idx;
	}
	public void setUsr_idx(String usr_idx) {
		this.usr_idx = usr_idx;
	}
	public String getUsr_id() {
		return usr_id;
	}
	public void setUsr_id(String usr_id) {
		this.usr_id = usr_id;
	}
	public String getUsr_nm() {
		return usr_nm;
	}
	public void setUsr_nm(String usr_nm) {
		this.usr_nm = usr_nm;
	}
	public String getAdm_idx() {
		return adm_idx;
	}
	public void setAdm_idx(String adm_idx) {
		this.adm_idx = adm_idx;
	}
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
	public String getAdm_nm() {
		return adm_nm;
	}
	public void setAdm_nm(String adm_nm) {
		this.adm_nm = adm_nm;
	}
	public String getAdm_auth() {
		return adm_auth;
	}
	public void setAdm_auth(String adm_auth) {
		this.adm_auth = adm_auth;
	}
	public String getIdentifier() {
		return identifier;
	}
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}
	public String getIdentifier2() {
		return identifier2;
	}
	public void setIdentifier2(String identifier2) {
		this.identifier2 = identifier2;
	}
	public String getIdentifier3() {
		return identifier3;
	}
	public void setIdentifier3(String identifier3) {
		this.identifier3 = identifier3;
	}
	public String getIdentifier4() {
		return identifier4;
	}
	public void setIdentifier4(String identifier4) {
		this.identifier4 = identifier4;
	}
	public List<?> getFileDataList1() {
		return fileDataList1;
	}
	public void setFileDataList1(List<?> fileDataList1) {
		this.fileDataList1 = fileDataList1;
	}
	public List<?> getFileDataList2() {
		return fileDataList2;
	}
	public void setFileDataList2(List<?> fileDataList2) {
		this.fileDataList2 = fileDataList2;
	}
	public List<?> getFileDataList3() {
		return fileDataList3;
	}
	public void setFileDataList3(List<?> fileDataList3) {
		this.fileDataList3 = fileDataList3;
	}
	public List<?> getFileDataList4() {
		return fileDataList4;
	}
	public void setFileDataList4(List<?> fileDataList4) {
		this.fileDataList4 = fileDataList4;
	}
	public List<?> getFileDataList5() {
		return fileDataList5;
	}
	public void setFileDataList5(List<?> fileDataList5) {
		this.fileDataList5 = fileDataList5;
	}
	public List<?> getFileDataList6() {
		return fileDataList6;
	}
	public void setFileDataList6(List<?> fileDataList6) {
		this.fileDataList6 = fileDataList6;
	}
	public List<?> getFileDataList7() {
		return fileDataList7;
	}
	public void setFileDataList7(List<?> fileDataList7) {
		this.fileDataList7 = fileDataList7;
	}
	public List<?> getFileDataList8() {
		return fileDataList8;
	}
	public void setFileDataList8(List<?> fileDataList8) {
		this.fileDataList8 = fileDataList8;
	}
	public List<?> getFileDataList9() {
		return fileDataList9;
	}
	public void setFileDataList9(List<?> fileDataList9) {
		this.fileDataList9 = fileDataList9;
	}
	public List<?> getFileDataList10() {
		return fileDataList10;
	}
	public void setFileDataList10(List<?> fileDataList10) {
		this.fileDataList10 = fileDataList10;
	}
	public List<?> getFileDataRmList() {
		return fileDataRmList;
	}
	public void setFileDataRmList(List<?> fileDataRmList) {
		this.fileDataRmList = fileDataRmList;
	}
	public List<?> getFileDataNameRmList() {
		return fileDataNameRmList;
	}
	public void setFileDataNameRmList(List<?> fileDataNameRmList) {
		this.fileDataNameRmList = fileDataNameRmList;
	}
	
}
