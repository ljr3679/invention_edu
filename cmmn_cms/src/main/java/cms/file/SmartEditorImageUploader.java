package cms.file;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cms.cmmn.FileVO;
import cms.data.StaticData;
import cms.util.DateUtil;
import cms.util.FileUtil;
import cms.util.Logs;

@Controller
public class SmartEditorImageUploader {

	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@Resource(name="dateUtil")
	private DateUtil dateUtil;
	
	@RequestMapping(value="/sm/editor/single/fileUpload.do")
	public @ResponseBody String editorSingleFileUploader(
			HttpServletRequest request
			) throws Exception {
		
		String fileInfo = "";
		
		String fileName = request.getHeader("file-name");
		String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		
		String[] allowFile = { "jpg", "png", "bmp", "gif" };
		
		int cnt = 0;
		for(String file : allowFile) {
			if (fileExtension.equals(file)) {
				cnt++;
			}
		}
		
		if (cnt == 0) {
			return "NOTALLOW_"+fileName;
		} else {
			String fileSize = request.getHeader("file-size");
			String filePath = StaticData.getInstance().getEditorPath()+dateUtil.getCurrentDate("yyyyMMdd");
			FileVO vo = fileUtil.uploadForStream(filePath, fileName, request.getInputStream(), Integer.parseInt(fileSize));
			
			fileInfo += "&bNewLine=true";	
			fileInfo += "&sFileName=" + vo.getFileName();
			fileInfo += "&sFileURL=/images/editor/"+dateUtil.getCurrentDate("yyyyMMdd")+"/"+vo.getNewFileName()+"/"+vo.getExtension()+"/loader.do";
		}
		
		return fileInfo;
	}
	
	@RequestMapping(value="/sm/editor/multi/fileUpload.do")
	public void editorMultiFileUploader(
			MultipartHttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
		
		String return1 = "";
		String return2 = "";
		String return3 = "";
		String name = "";
		
		if (ServletFileUpload.isMultipartContent(request)) {
		    String callback = request.getParameter("callback");
	    	String callback_func = request.getParameter("callback_func");
		    return1 = callback;
	    	return2 = "?callback_func="+callback_func;
	    	
	    	int fileCnt = 0;
		    Iterator it = request.getFileNames();
		    while(it.hasNext()) {
		    	fileCnt++;
		    	MultipartFile mf = request.getFile(String.valueOf(it.next()));
		    	String fileName = mf.getOriginalFilename();
		    	String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		    	String fileSize = String.valueOf(mf.getSize());
		    	String[] allowFile = { "jpg", "png", "bmp", "gif" };
				int cnt = 0;
				for(String file : allowFile) {
					if (fileExtension.equals(file)) {
						cnt++;
					}
				}
		    	
				if (cnt == 0) {
					return3 = "&errstr="+name;
				} else {
					String filePath = StaticData.getInstance().getEditorPath()+dateUtil.getCurrentDate("yyyyMMdd");
					FileVO vo = fileUtil.uploadForStream(filePath, fileName, mf.getInputStream(), Integer.parseInt(fileSize));	
					
			    	return3 += "&bNewLine=true";	
					return3 += "&sFileName=" + vo.getFileName();
					return3 += "&sFileURL=/images/editor/"+dateUtil.getCurrentDate("yyyyMMdd")+"/"+vo.getNewFileName()+"/"+vo.getExtension()+"/loader.do";
				}
		    }
		    
		    if(fileCnt == 0) return3 = "&errstr="+name;
		}
		
		response.sendRedirect(return1+return2+return3);
	}
	
}
