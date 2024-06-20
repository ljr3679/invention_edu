package cms.file;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ai.org.apache.poi.util.IOUtils;
import cms.data.StaticData;
import cms.util.Logs;

@Controller
public class ImageViewLoader {
	
	@RequestMapping(value="/images/editor/{dir}/{file}/{ext}/loader.do")
	public @ResponseBody byte[] editorImageLoader(
			HttpServletResponse response,
			@PathVariable(value="dir") String dir,
			@PathVariable(value="file") String file,
			@PathVariable(value="ext") String ext
			) throws Exception{
		
		String fileFullPath = StaticData.getInstance().getEditorPath();
		fileFullPath += dir;
		fileFullPath += File.separator;
		fileFullPath += file+"."+ext;
		
		File image = new File(fileFullPath);
		if(image.exists()) return IOUtils.toByteArray(new FileInputStream(image));
		else return null;	
	}
	
	@RequestMapping(value="/images/site/{file}/{ext}/loader.do")
	public @ResponseBody byte[] siteImageLoader(
			HttpServletResponse response,
			@PathVariable(value="file") String file,
			@PathVariable(value="ext") String ext
			) throws Exception{		

		String fileFullPath = StaticData.getInstance().getAttachPath();
		fileFullPath += file+"."+ext;
		
		File image = new File(fileFullPath);
		if(image.exists()) return IOUtils.toByteArray(new FileInputStream(image));
		else return null;	
	}

}
