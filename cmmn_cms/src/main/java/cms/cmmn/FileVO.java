package cms.cmmn;

import cms.util.Serialize;

public class FileVO {
	
	private String fileName;
	private String newFileName;
	private String filePath;
	private String extension;
	private Long fileSize;
	private String mimeType;
	private int downCnt;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return Serialize.build(this);
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public Long getFileSize() {
		return fileSize;
	}
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	public String getMimeType() {
		return mimeType;
	}
	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}
	public int getDownCnt() {
		return downCnt;
	}
	public void setDownCnt(int downCnt) {
		this.downCnt = downCnt;
	}
	
}
