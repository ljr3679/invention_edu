package cms.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cms.cmmn.CommonVO;
import cms.cmmn.svc.CommonSvc;
import cms.constant.Const;
import cms.data.StaticData;
import cms.enc.EncryptModule;
import cms.file.svc.FileDataSvc;
import cms.util.FileUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class FileDownload {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FileDownload.class);
	
	@Resource(name="commonSvc")
	private CommonSvc commonSvc;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@Resource(name="fileDataSvc")
	private FileDataSvc fileDataSvc;
	
	@Resource(name="encryptModule")
	private EncryptModule encryptModule;
	
    /**
     * 파일(첨부파일, 이미지등) 다운로드.
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping(value = "fileDownload.do" , method=RequestMethod.POST)
    public void fileDownload(
    		HttpServletRequest request,
    		HttpServletResponse response
    		) throws Exception {
        String path = StaticData.getInstance().getAttachPath();
    	
        String uniqueKey = request.getParameter("uniqueKey");
        String filename = request.getParameter("filename");
        String downname = request.getParameter("downname");
        
        String realPath = "";
        
        if (filename == null || "".equals(filename)) {
            filename = downname;
        }
        
        try {
            filename = URLEncoder.encode(filename, Const.CHARSET).replaceAll("\\+", "%20");
            downname = URLDecoder.decode(downname, Const.CHARSET).replaceAll("\\+", "%20");

        } catch (UnsupportedEncodingException ex) {
            LOGGER.error("UnsupportedEncodingException");
        }
        
        if(downname.contains("../")) downname = downname.replace("../", "");
        if(downname.contains("..")) downname = downname.replace("..", "");
        
        realPath = path + File.separator + downname;
        File file1 = new File(realPath);
        if (!file1.exists()) {
        	response.setCharacterEncoding(Const.CHARSET);
			response.setContentType("text/html; charset="+Const.CHARSET);
			PrintWriter pw = response.getWriter();
			pw.print("<script>alert('해당 파일이 존재하지 않습니다.');history.back();</script>");
			pw.flush();
			pw.close();
        } else {
        	response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
            try {
            	if(uniqueKey != null && !uniqueKey.equals("")) {
            		String numPattern = "^[0-9]+$";
            		if(!uniqueKey.matches(numPattern)) uniqueKey = encryptModule.decryptAREA(uniqueKey);
            		
            		fileDataSvc.updateFileDownloadCountDataInfo(uniqueKey);
            	}
            	
                OutputStream os = response.getOutputStream();
                FileInputStream fis = new FileInputStream(realPath);
                
                int ncount = 0;
                byte[] bytes = new byte[512];

                while ((ncount = fis.read(bytes)) != -1 ) {
                    os.write(bytes, 0, ncount);
                }
                fis.close();
                os.close();
                
            } catch (FileNotFoundException ex) {
            	LOGGER.error("FileNotFoundException");
            } catch (IOException ex) {
            	LOGGER.error("IOException");
            }
        }
    }
    
    /**
     * 파일(첨부파일, 이미지등) Zip 다운로드.
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping(value = "/zipFileDownload.do" , method=RequestMethod.POST)
    public void zipFileDownload(
    		HttpServletRequest request,
    		HttpServletResponse response
    		) throws Exception {
    	
        String path = StaticData.getInstance().getAttachPath();
        String zipname = request.getParameter("zipname");
        String[] uniqueKeyArr = request.getParameterValues("uniqueKey");
        
        try {
        	zipname = URLDecoder.decode(zipname, Const.CHARSET).replaceAll("\\+", "%20");
        } catch (UnsupportedEncodingException ex) {
            LOGGER.error("UnsupportedEncodingException");
        }
        
        if (uniqueKeyArr.length == 0) {
        	response.setCharacterEncoding(Const.CHARSET);
			response.setContentType("text/html; charset="+Const.CHARSET);
			PrintWriter pw = response.getWriter();
			pw.print("<script>alert('해당 파일이 존재하지 않습니다.');history.back();</script>");
			pw.flush();
			pw.close();
        } else {
        	List<File> fileList = new ArrayList<>();
        	List<String> fileNameList = new ArrayList<>();
        	List<String> uniqueKeyList = new ArrayList<>();
        	for(String uniqueKey : uniqueKeyArr) uniqueKeyList.add(encryptModule.decryptAREA(uniqueKey));
        	EgovMap map = new EgovMap();
        	map.put("uniqueKeyList", uniqueKeyList);
        	List<EgovMap> fileDataList = (List<EgovMap>) fileDataSvc.selectFileDataList(map);
        	for(EgovMap fileInfo : fileDataList) {
        		String attachName = String.valueOf(fileInfo.get("attachName"));
        		String attachReName = String.valueOf(fileInfo.get("attachReName"));
        		
        		fileList.add(new File(path+File.separatorChar+attachReName));
        		fileNameList.add(attachName);
        	}
        	
        	List<String> makeZipUnique = fileUtil.makeZip(fileList, fileNameList, uniqueKeyList, zipname);
        	for(String unique : makeZipUnique) fileDataSvc.updateFileDownloadCountDataInfo(unique);
        	
        	response.setHeader("Content-Disposition", "attachment; filename=\"" + zipname + "\"");
            try {
            	File zipFile = new File(StaticData.getInstance().getAttachPath()+File.separatorChar+zipname);
            	if(zipFile.exists()) {
            		OutputStream os = response.getOutputStream();
                    FileInputStream fis = new FileInputStream(zipFile);
                    
                    int ncount = 0;
                    byte[] bytes = new byte[512];

                    while ((ncount = fis.read(bytes)) != -1 ) {
                        os.write(bytes, 0, ncount);
                    }
                    fis.close();
                    os.close();
                    
                    zipFile.delete();
            	} else {
            		response.setCharacterEncoding(Const.CHARSET);
        			response.setContentType("text/html; charset="+Const.CHARSET);
        			PrintWriter pw = response.getWriter();
        			pw.print("<script>alert('해당 파일이 존재하지 않습니다.');history.back();</script>");
        			pw.flush();
        			pw.close();
            	}
            } catch (FileNotFoundException ex) {
            	LOGGER.error("FileNotFoundException");
            } catch (IOException ex) {
            	LOGGER.error("IOException");
            }
        }
    }
    
    /** 사용자 > 발명교육콘텐츠 > 교수자료 및 발간콘텐츠 > 발명교육백서  */
    
    @RequestMapping(value = "paperDownload.do" , method=RequestMethod.POST)
    public void paperDownload(
    		HttpServletRequest request,
    		HttpServletResponse response
    		) throws Exception {
    	
        String downname = "2-1.발명교육백서 _발명교육사_최종_인쇄.pdf";
        String filePath = request.getServletContext().getRealPath("/resources/downloads/") + downname;
        //System.out.println("filePath:::: " + filePath);
        
        File file1 = new File(filePath);
        if (!file1.exists()) {
        	response.setCharacterEncoding(Const.CHARSET);
			response.setContentType("text/html; charset="+Const.CHARSET);
			PrintWriter pw = response.getWriter();
			pw.print("<script>alert('해당 파일이 존재하지 않습니다.');history.back();</script>");
			pw.flush();
			pw.close();
        } else {
        	response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(downname,"UTF-8") + "\"");
        	response.setHeader("Content-Transter-Encoding", "binary");
            try {
                OutputStream os = response.getOutputStream();
                FileInputStream fis = new FileInputStream(filePath);
                
                int ncount = 0;
                byte[] bytes = new byte[512];

                while ((ncount = fis.read(bytes)) != -1 ) {
                    os.write(bytes, 0, ncount);
                }
                fis.close();
                os.close();
                
            } catch (FileNotFoundException ex) {
            	LOGGER.error("FileNotFoundException");
            } catch (IOException ex) {
            	LOGGER.error("IOException");
            }
        }
    }
}