package cms.tld;

import java.util.Arrays;
import java.util.List;

import cms.constant.Const;
import cms.data.StaticData;
import cms.enc.TextEncryptionService;
import cms.util.Logs;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class CustomTldFunctions {
	
	private static TextEncryptionService textService = new TextEncryptionService();
	
	public static Integer arrIndexOf(List<?> list, Object data) {
		if(list == null) return -1;
		else return list.indexOf(data);
    }
	
	public static String kssFileInclude(String sendParam, Integer attachCnt, String extensions, Integer maxSize, String sizeUnit, Boolean thumbnail, List<EgovMap> fileList) {
		StringBuilder sb = new StringBuilder();
		try {
			String ext = extensions != null ?extensions.equals("attach") ?StaticData.getInstance().getGlobalsProp().getProperty(Const.ATTACH_EXT) :extensions.equals("image") ?StaticData.getInstance().getGlobalsProp().getProperty(Const.IMAGE_EXT) :extensions :StaticData.getInstance().getGlobalsProp().getProperty(Const.ATTACH_EXT);
			
			sb.append("<div class=\"kssFileWarp\" uploadKey=\""+sendParam+"\" uploadCnt=\""+attachCnt+"\" uploadExt=\""+ext+"\" uploadSize=\""+maxSize+"\" uploadUnit=\""+sizeUnit+"\">");
			sb.append("<div class=\"kssFileAttach\">");
			
			String attachDescriptionTxt = "※ 첨부파일은 ";
			if(attachCnt != null && attachCnt > 0) attachDescriptionTxt += ("최대 "+attachCnt+"개");
			if(maxSize != null && maxSize > 0) {
				if(attachCnt != null && attachCnt > 0) attachDescriptionTxt += " ";
				attachDescriptionTxt += (maxSize+sizeUnit+"이하");
			}
			if(extensions != null && !extensions.equals("")) {
				if(maxSize != null && maxSize > 0) attachDescriptionTxt += " ";
				attachDescriptionTxt += (ext+" 확장자");
			}
			attachDescriptionTxt += "만 등록가능합니다.";
			if((attachCnt != null && attachCnt > 0) || (maxSize != null && maxSize > 0) || (extensions != null && !extensions.equals(""))) sb.append("<div class=\"kssFileDescription\">"+attachDescriptionTxt+"</div>");
			
			sb.append("<div>");
			sb.append("<span class=\"kssZipDownloadBtn\">ZIP 다운로드</span>");
			sb.append("<span class=\"kssFileBtn\">첨부파일 등록</span>");
			sb.append("<input type=\"file\" class=\"kssFileHidden\"/>");
			sb.append("</div>");
			sb.append("</div>");
				
			sb.append("<div class=\"kssFileDataWarp\">");
			sb.append("<div class=\"kssFileList\">");
			sb.append("<div class=\"kssFileHeader\">");
			sb.append("<span class=\"kssFileIcon\"></span>");
			sb.append("<span class=\"kssFileName\">파일명</span>");
			sb.append("<span class=\"kssFileExtension\">확장자</span>");
			sb.append("<span class=\"kssFileType\">타입</span>");
			sb.append("<span class=\"kssFileSize\">용량</span>");
			sb.append("<span class=\"kssFileDownloadCnt\">다운로드 수</span>");
			sb.append("<span class=\"kssFileDownload\">다운로드</span>");
			sb.append("<span class=\"kssFileRemove\">삭제</span>");
			sb.append("</div>");
			sb.append("<div class=\"kssFileBody\">");
			sb.append("<ul>");
			if(fileList != null) {
				for(int i=0; i<fileList.size(); i++) {
					EgovMap file = fileList.get(i);
					
					String no = String.valueOf(file.get("no"));
					String encNo = textService.encrypt(no);
					String attachName = String.valueOf(file.get("attachName"));
					String attachNaturalName = attachName.substring(0, attachName.lastIndexOf("."));
					String attachReName = String.valueOf(file.get("attachReName"));
					String extension = String.valueOf(file.get("extension"));
					String mimeType = String.valueOf(file.get("mimeType"));
					Double attachSize = Double.parseDouble(String.valueOf(file.get("attachSize")));
					String downCnt = String.valueOf(file.get("downCnt"));
					
					sb.append("<li type=\"original\" unique=\"ori_"+encNo+"\">");
					sb.append("<span class=\"kssFileIcon\" style=\"background: url(/images/cmmn/file/filetype/"+extension+".gif) 0 0 no-repeat, url(/images/cmmn/file/filetype/unknown.gif) 0 0 no-repeat;\"></span>");
					sb.append("<span class=\"kssFileName\">"+attachNaturalName+"</span>");
					sb.append("<span class=\"kssFileExtension\">"+extension+"</span>");
					sb.append("<span class=\"kssFileType\">"+mimeType+"</span>");
					sb.append("<span class=\"kssFileSize\">"+convertBToMBToGB(attachSize)+"</span>");
					sb.append("<span class=\"kssFileDownloadCnt\">"+downCnt+"</span>");
					sb.append("<span class=\"kssFileDownload\"><div onClick=\"kssFileDownloadAct(this, '"+encNo+"');\">다운로드</div></span>");
					sb.append("<span class=\"kssFileRemove\"><div onClick=\"kssFileRemoveAct(this, '"+encNo+"', '"+attachReName+"');\">삭제</div></span>");
					sb.append("</li>");
				}	
			}
			
			sb.append("</ul>");
			sb.append("</div>");
			sb.append("</div>");
			if(thumbnail) {
				sb.append("<div class=\"kssFileThumbnail\">");
				if(fileList != null) {
					for(int i=0; i<fileList.size(); i++) {
						EgovMap file = fileList.get(i);
						
						String no = String.valueOf(file.get("no"));
						String mimeType = String.valueOf(file.get("mimeType"));
						if(mimeType.startsWith("image")) {
							String encNo = textService.encrypt(no);
							String attachName = String.valueOf(file.get("attachName"));
							String attachNaturalName = attachName.substring(0, attachName.lastIndexOf("."));
							String attachReName = String.valueOf(file.get("attachReName"));
							String attachNaturalReName = attachReName.substring(0, attachReName.lastIndexOf("."));
							String extension = String.valueOf(file.get("extension"));
							
							sb.append("<div class=\"kssFileThumbnailWarp\" kssThumbnail=\"ori_"+encNo+"\">");
							sb.append("<div class=\"kssThumbnail\" onClick=\"thumbnail_layer(this, '"+attachNaturalName+"');\"><img src=\"/images/site/"+attachNaturalReName+"/"+extension+"/loader.do\"/></div>");
							sb.append("<div class=\"kssThumbnailName\">"+attachNaturalName+"</div>");
							sb.append("</div>");	
						} else continue;
					}
				}
				sb.append("</div>");	
			}
			
			sb.append("<div class=\"kssDragAndDrop\"><div><span>등록할 파일을 드롭해주세요.</span></div></div>");
			sb.append("</div>");
			sb.append("</div>");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
	
	private static String convertBToMBToGB(Double size) {
        float unit = 1024F;
        double kb = Math.round(size/Math.pow(unit, 1) * 100) / 100.0;
        double mb = Math.round(size/Math.pow(unit, 2) * 100) / 100.0;
        double gb = Math.round(size/Math.pow(unit, 3) * 100) / 100.0;

        if(gb > 1) return gb+"GB";
        else if(mb > 1) return mb+"MB";
        else return kb+"KB";
    }
	
	public static String onUserFileInclude(String tableName, String sendParam, Integer attachCnt, String extensions, Integer maxSize, String sizeUnit, List<EgovMap> fileList) {
		StringBuilder sb = new StringBuilder();
		
		String ext = 	extensions != null ?extensions.equals("attach") ?StaticData.getInstance().getGlobalsProp().getProperty(Const.ATTACH_EXT) 
						:extensions.equals("image") ?StaticData.getInstance().getGlobalsProp().getProperty(Const.IMAGE_EXT)
						:extensions
						:StaticData.getInstance().getGlobalsProp().getProperty(Const.ATTACH_EXT);
		
		
//		<div class="attach_box">
//			<div class="box">
//				<input type="file" id="attach" name="attach_v" class="attach_input">
//				<div class="attach_vbox">
//					<input type="text" id="attach_v" name="attach_v" class="attach_vinput" title="첨부파일명 보기" readonly="readonly">
//					<label for="attach_v" class="attach_btn">찾아보기</label>
//				</div>
//			</div>
//		</div>
//		<div class="delete_box">
//			<a href="#none" class="name">첨부파일제목.jpg</a>
//			<button class="btn">삭제</button>
//		</div>
		
		sb.append("<div class=\"attach_box\" id=\"tag_"+tableName+"_area\">");
		sb.append("<div class=\"box\">");
		sb.append("<input type=\"file\" id=\"tag_"+tableName+"\" style=\"width:200px;\" class=\"unCheck attach_input\" onChange=\"fn_user_file_change_event(this, '"+tableName+"', '"+sendParam+"', '"+attachCnt+"', '"+ext+"', "+maxSize+", '"+sizeUnit+"');\"/>");
		sb.append("<div class=\"attach_vbox\">");
		sb.append("<input type=\"text\" class=\"attach_vinput unCheck\" style=\"width:200px; display:inline-block\" title=\"첨부파일명 보기\" readonly=\"readonly\">");
	    sb.append("<label for=\"tag_"+tableName+"\" class=\"attach_btn\">파일찾기</label>");
		sb.append("</div>");
		sb.append("</div>");
	    sb.append("</div>");
	        
//	    sb.append("<div class=\"attach_box\" id=\"tag_"+tableName+"_area\">");
//	    sb.append("<input type=\"file\" id=\"tag_"+tableName+"\" class=\"unCheck attach_input\" onChange=\"fn_user_file_change_event(this, '"+tableName+"', '"+sendParam+"', '"+attachCnt+"', '"+ext+"', "+maxSize+", '"+sizeUnit+"');\"/>");
//	    sb.append("<div class=\"attach_vbox\">");
//	    sb.append("<input type=\"text\" class=\"attach_vinput unCheck\" title=\"첨부파일명 보기\" readonly=\"readonly\">");
//	    sb.append("<label for=\"tag_"+tableName+"\" class=\"attach_btn\">파일찾기</label>");
//	    sb.append("</div>");
//	    sb.append("</div>");
		sb.append("<table id=\""+tableName+"\" style=\"border: hidden;\">");
		if(fileList != null && fileList.size() > 0) {
			for(EgovMap file : fileList) {
				sb.append("<tr style=\"border: hidden;\">");
				sb.append("<td style=\"border: hidden; width: 100%; padding: 5px;\">");
				
				String no = String.valueOf(file.get("no"));
				String attachName = String.valueOf(file.get("attachName"));
				String attachReName = String.valueOf(file.get("attachReName"));
				String extension = String.valueOf(file.get("extension"));
				
				sb.append("<a onClick=\"cmmn_file_down('"+attachName+"','"+attachReName+"')\" style=\"cursor: pointer; background: url(/images/cmmn/file/filetype/"+extension+".gif) 0 2px no-repeat, url(/images/cmmn/file/filetype/unknown.gif) 0 2px no-repeat;\" class=\"download_txt\">"+attachName+"</a>");
				sb.append("<a onClick=\"fn_file_delete(this);\" style=\"cursor: pointer;\" class=\"fc_red\">[삭제]</a>");
				sb.append("<span style=\"display: none;\">");
				sb.append("<input type=\"hidden\" name=\"fileDataRmList\" value=\""+no+"\" disabled=\"disabled\">");
				sb.append("<input type=\"hidden\" name=\"fileDataNameRmList\" value=\""+attachReName+"\" disabled=\"disabled\">");
				sb.append("</span>");
				sb.append("</td>");
				sb.append("</tr>");
			}
		}
		
		sb.append("</table>");
		return sb.toString();
	}
	
	public static String onFileInclude(String tableName, String sendParam, Integer attachCnt, String extensions, Integer maxSize, String sizeUnit, List<EgovMap> fileList) {
		StringBuilder sb = new StringBuilder();
		
		String ext = 	extensions != null ?extensions.equals("attach") ?StaticData.getInstance().getGlobalsProp().getProperty(Const.ATTACH_EXT) 
				:extensions.equals("image") ?StaticData.getInstance().getGlobalsProp().getProperty(Const.IMAGE_EXT)
				:extensions
				:StaticData.getInstance().getGlobalsProp().getProperty(Const.ATTACH_EXT);
		
		sb.append("<input type=\"file\" class=\"unCheck\" onChange=\"fn_file_change_event(this, '"+tableName+"', '"+sendParam+"', '"+attachCnt+"', '"+ext+"', "+maxSize+", '"+sizeUnit+"');\"/>");
		sb.append("<table id=\""+tableName+"\" style=\"border: hidden; width: 100%;\">");
		if(fileList != null && fileList.size() > 0) {
			for(EgovMap file : fileList) {
				sb.append("<tr style=\"border: hidden;\">");
				sb.append("<td style=\"border: hidden; width: 100%; padding: 5px;\">");
				
				String no = String.valueOf(file.get("no"));
				String attachName = String.valueOf(file.get("attachName"));
				String attachReName = String.valueOf(file.get("attachReName"));
				String extension = String.valueOf(file.get("extension"));
				
				sb.append("<a onClick=\"cmmn_file_down('"+attachName+"','"+attachReName+"')\" style=\"cursor: pointer; background: url(/images/cmmn/file/filetype/"+extension+".gif) 0 2px no-repeat, url(/images/cmmn/file/filetype/unknown.gif) 0 2px no-repeat;\" class=\"download_txt\">"+attachName+"</a>");
				sb.append("<a onClick=\"fn_file_delete(this);\" style=\"cursor: pointer;\" class=\"fc_red\">[삭제]</a>");
				sb.append("<span style=\"display: none;\">");
				sb.append("<input type=\"hidden\" name=\"fileDataRmList\" value=\""+no+"\" disabled=\"disabled\">");
				sb.append("<input type=\"hidden\" name=\"fileDataNameRmList\" value=\""+attachReName+"\" disabled=\"disabled\">");
				sb.append("</span>");
				sb.append("</td>");
				sb.append("</tr>");
			}
		}
		
		sb.append("</table>");
		return sb.toString();
	}
	
	public static String removeTags(String text) {
		if(text == null || (text != null && text.equals(""))) return "";
    	return text.replaceAll("\\<.*?\\>", "");
	}
	
	public static String nl2br(String text) {
		if(text == null || (text != null && text.equals(""))) return "";
		
		text = text.replaceAll("\r\n", "<br>");
		text = text.replaceAll("\r", "<br>");
		text = text.replaceAll("\n", "<br>");
    	return text;
	}
	
	public static String encrypt(String text) {
		if(text == null || (text != null && text.equals(""))) return "";
		
		try {
			return textService.encrypt(text);	
		} catch(Exception e) {
			e.printStackTrace();
			return text;
		}
	}
	
	public static String decrypt(String text) {
		if(text == null || (text != null && text.equals(""))) return "";
		
		try {
			return textService.decrypt(text);	
		} catch(Exception e) {
			e.printStackTrace();
			return text;
		}
	}
	
	public static String singleCategoryNames(String category, List<EgovMap> categoryList) {
		if((category == null || (category != null && category.equals(""))) || (categoryList == null || (categoryList != null && categoryList.size() == 0))) return "";
		String resultTxt = "";
		
		for(EgovMap map : categoryList) {
			String key = String.valueOf(map.get("no"));
			String dataName = String.valueOf(map.get("dataName"));
			
			if(category.equals(key)) {
				resultTxt = dataName;
				break;
			}
		}	
		
		return resultTxt;
	}
	
	public static String multipleCategoryNames(String categorys, List<EgovMap> categoryList) {
		if((categorys == null || (categorys != null && categorys.equals(""))) || (categoryList == null || (categoryList != null && categoryList.size() == 0))) return "";
		String[] categoryArr = categorys.split(",");
		String resultTxt = "";

		for(int i=0; i<categoryArr.length; i++) {
			String cateKey = categoryArr[i];
			for(EgovMap map : categoryList) {
				String key = String.valueOf(map.get("no"));
				String dataName = String.valueOf(map.get("dataName"));
				
				if(cateKey.equals("["+key+"]")) {
					resultTxt += dataName;
					if(i != categoryArr.length-1) resultTxt += ",";
					break;
				}
			}	
		}
		
		if(!resultTxt.equals("")) {
			char lastChar = resultTxt.charAt(resultTxt.length()-1);
			if(lastChar == ',') resultTxt = resultTxt.substring(0, resultTxt.length()-1);
		}
		
		return resultTxt;
	}
	
	public static Object zeroSpace(Object data, Integer space) {
		if(data == null) return "";
		else if(space < 1) return data;
		
		return String.format("%0"+space+"d", data);
	}
	
	public static List<String> textSplitor2(String text, String splitor) {
		String[] spText = text.split("\\[-"+splitor+"-\\]");
		return Arrays.asList(spText);
	}
	
	public static String escapeXml(String text) {
		if(text == null || (text != null && text.equals(""))) return "";
		
		text = text.replace("&lt;", "<");
    	text = text.replace("&gt;", ">");
    	text = text.replace("&#40;", "(");
    	text = text.replace("&#41;", ")");
    	text = text.replace("&#35;", "#");
    	text = text.replace("&#38;", "&");
    	text = text.replace("&amp;", "&");
    	text = text.replace("&apos;", "'");
    	text = text.replace("&quot;", "\"");
    	
    	return text;
	}
	
}
