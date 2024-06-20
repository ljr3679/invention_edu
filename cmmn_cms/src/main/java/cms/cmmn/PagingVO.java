package cms.cmmn;

import java.io.Serializable;

import cms.util.Serialize;

public class PagingVO implements Serializable {

	/** PAGING */
	private String pagingYn = "Y";
	private int pageIndex = 1;
	private int pageUnit = 10;
	private int pageSize = 10;
	private int firstIndex = 1;
	private int lastIndex = 1;
	private int recordCountPerPage = 10;
	private int lastPageNo = 1;
	
	private String pagingYn2 = "Y";
	private int pageIndex2 = 1;
	private int pageUnit2 = 10;
	private int pageSize2 = 10;
	private int firstIndex2 = 1;
	private int lastIndex2 = 1;
	private int recordCountPerPage2 = 10;
	/** PAGING */
	
	@Override
	public String toString() {
		return Serialize.build(this);
	}
	
	public String getPagingYn() {
		return pagingYn;
	}
	public void setPagingYn(String pagingYn) {
		this.pagingYn = pagingYn;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public String getPagingYn2() {
		return pagingYn2;
	}
	public void setPagingYn2(String pagingYn2) {
		this.pagingYn2 = pagingYn2;
	}
	public int getPageIndex2() {
		return pageIndex2;
	}
	public void setPageIndex2(int pageIndex2) {
		this.pageIndex2 = pageIndex2;
	}
	public int getPageUnit2() {
		return pageUnit2;
	}
	public void setPageUnit2(int pageUnit2) {
		this.pageUnit2 = pageUnit2;
	}
	public int getPageSize2() {
		return pageSize2;
	}
	public void setPageSize2(int pageSize2) {
		this.pageSize2 = pageSize2;
	}
	public int getFirstIndex2() {
		return firstIndex2;
	}
	public void setFirstIndex2(int firstIndex2) {
		this.firstIndex2 = firstIndex2;
	}
	public int getLastIndex2() {
		return lastIndex2;
	}
	public void setLastIndex2(int lastIndex2) {
		this.lastIndex2 = lastIndex2;
	}
	public int getRecordCountPerPage2() {
		return recordCountPerPage2;
	}
	public void setRecordCountPerPage2(int recordCountPerPage2) {
		this.recordCountPerPage2 = recordCountPerPage2;
	}

	public int getLastPageNo() {
		return lastPageNo;
	}

	public void setLastPageNo(int lastPageNo) {
		this.lastPageNo = lastPageNo;
	}
	
}