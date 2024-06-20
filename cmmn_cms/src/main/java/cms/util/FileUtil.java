package cms.util;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.io.FilenameUtils;
import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import cms.cmmn.FileVO;
import cms.data.StaticData;
import net.coobird.thumbnailator.Thumbnails;

@Component("fileUtil")
public class FileUtil {

	public void makeZip(File target, String fileName) {
		String directoryName = target.getName();
		File outputDirectory = new File(StaticData.getInstance().getAttachPath());
		
		if(!outputDirectory.exists()) outputDirectory.mkdirs();
		else outputDirectory = null;
		
		File outputZip = new File(StaticData.getInstance().getAttachPath()+File.separatorChar+fileName);
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ZipArchiveOutputStream zaos = null;
		
		
		int bufferSize = 1024;
		byte[] buffers = new byte[bufferSize];
		
		try {
			fos = new FileOutputStream(outputZip);
			bos = new BufferedOutputStream(fos);
			zaos = new ZipArchiveOutputStream(bos);
			
			for(File f : getFileLists(target)) {
				if(f.getAbsolutePath().equals(outputZip.getAbsolutePath())) continue;
 				zaos.setEncoding("UTF-8");
				
				fis = new FileInputStream(f.getAbsolutePath());
				bis = new BufferedInputStream(fis, bufferSize);
				
				zaos.putArchiveEntry(new ZipArchiveEntry(f.getAbsolutePath().substring(f.getAbsolutePath().indexOf("\\"+directoryName+"\\"), f.getAbsolutePath().length())));
				
				int length;
				while((length = bis.read(buffers, 0, bufferSize)) != -1) {
					zaos.write(buffers, 0, length);
				}
				
				bis.close();
				bis = null;
				fis.close();
				fis = null;
				zaos.closeArchiveEntry();
			}
		} catch(Exception e) {
			e.getStackTrace();
		} finally {
			try {
				if(zaos != null) {
					zaos.close();
					zaos = null;
				}
				
				if(bis != null) {
					bis.close();
					bis = null;
				}
				
				if(fis != null) {
					fis.close();
					fis = null;
				}
				
				if(bos != null) {
					bos.close();
					bos = null;
				}
				
				if(fos != null) {
					fos.close();
					fos = null;
				}
			} catch(Exception e) {
				e.getStackTrace();
			}
		}
	}
	
	private List<File> getFileLists(File target, List<File>... files) {
		List<File> fileLists = files.length > 0 ?files[0] :new ArrayList<File>();
		
		if(target.isDirectory()) {
			File[] fs = target.listFiles();
			
			if(fs != null && fs.length > 0) {
				for(File f : fs) {
					getFileLists(f, fileLists);
				}
			}
		} else fileLists.add(target);

		return fileLists;
	}
	
	public List<String> makeZip(List<File> fileList, List<String> fileNameList, List<String> uniqueKeyList, String fileName) {
		List<String> makeZipUnique = new ArrayList<>();
		
		File outputDirectory = new File(StaticData.getInstance().getAttachPath());
		
		if(!outputDirectory.exists()) outputDirectory.mkdirs();
		else outputDirectory = null;
		
		File outputZip = new File(StaticData.getInstance().getAttachPath()+File.separatorChar+fileName);
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ZipArchiveOutputStream zaos = null;
		
		
		int bufferSize = 1024;
		byte[] buffers = new byte[bufferSize];
		
		try {
			fos = new FileOutputStream(outputZip);
			bos = new BufferedOutputStream(fos);
			zaos = new ZipArchiveOutputStream(bos);
			
			for(int i=0; i<fileList.size(); i++) {
				File f = fileList.get(i);
				String name = fileNameList.get(i);
				String unique = uniqueKeyList.get(i);
				
				if(!f.exists()) continue;
				if(f.getAbsolutePath().equals(outputZip.getAbsolutePath())) continue;
				zaos.setEncoding("UTF-8");
				
				fis = new FileInputStream(f.getAbsolutePath());
				bis = new BufferedInputStream(fis, bufferSize);
				
				zaos.putArchiveEntry(new ZipArchiveEntry(name));
				
				int length;
				while((length = bis.read(buffers, 0, bufferSize)) != -1) {
					zaos.write(buffers, 0, length);
				}
				
				bis.close();
				bis = null;
				fis.close();
				fis = null;
				zaos.closeArchiveEntry();
				makeZipUnique.add(unique);
			}
		} catch(Exception e) {
			e.getStackTrace();
		} finally {
			try {
				if(zaos != null) {
					zaos.close();
					zaos = null;
				}
				
				if(bis != null) {
					bis.close();
					bis = null;
				}
				
				if(fis != null) {
					fis.close();
					fis = null;
				}
				
				if(bos != null) {
					bos.close();
					bos = null;
				}
				
				if(fos != null) {
					fos.close();
					fos = null;
				}
			} catch(Exception e) {
				e.getStackTrace();
			}
		}
		
		return makeZipUnique;
	}
	
	@SuppressWarnings("finally")
	public FileVO uploadForStream(String directory, String file, InputStream is, Integer fileSize) throws Exception {
		FileVO vo = new FileVO();
		FileOutputStream os = null;
		
		try {
			File directoryFile = directoryCheck(directory);
			
			String fileExtension = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
			String newName = getNewName();
			String fileFullPath = directoryFile.getAbsolutePath()+File.separator+newName+"."+fileExtension;
			
			os = new FileOutputStream(fileFullPath);
			int read;
			byte b[] = new byte[4096];
			
			while((read = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, read);
			}
			
			os.flush();
			
			vo.setFileName(file);
			vo.setNewFileName(newName);
			vo.setExtension(fileExtension);
			vo.setFilePath(directoryFile.getAbsolutePath());
			vo.setFileSize(fileSize.longValue());
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(is != null) is.close();
			if(os != null) os.close();
			
			return vo;
		}
	}
	
	public List<FileVO> uploadForMultipartFileList(List<MultipartFile> fileList) throws Exception {
		List<FileVO> files = new ArrayList<FileVO>();
		
		if(fileList != null && fileList.size() > 0) {
			for(MultipartFile file : fileList) {
				if(!file.isEmpty()) {
					FileVO fileVO = new FileVO();
					
					String newName = getNewName();
					String orgName = file.getOriginalFilename();
					String extension = orgName.substring(orgName.lastIndexOf(".")).toLowerCase();
					
					File uploadFile = saveFile(file, StaticData.getInstance().getAttachPath(), newName+extension);
					
					fileVO.setFileName(orgName);
					fileVO.setNewFileName(newName+extension);
					fileVO.setExtension(extension.substring(1, extension.length()));
					fileVO.setFileSize(file.getSize());
					fileVO.setMimeType(uploadFile != null ?new Tika().detect(uploadFile) :"Unkown");
					
					files.add(fileVO);
				}
			}
		}
		
		return files;
	}
	
	public void deleteFileList(List<String> fileList) throws Exception {
		if(fileList != null && fileList.size() > 0) {
			for(String file : fileList) {
				File deleteFile = new File(StaticData.getInstance().getAttachPath()+File.separator+file);
				if(deleteFile.exists() && !deleteFile.isDirectory()) deleteFile.delete();
			}	
		}
	}
	
	private File saveFile(MultipartFile file, String basePath, String fileName) throws Exception {
		File file1 = null;
        if (!(file == null || file.getName().equals("") || file.getSize() < 1)) {
        	String serverFullPath = directoryCheck(basePath).getAbsolutePath()+File.separator+fileName;
        	  
            file1 = new File(serverFullPath);
            try {
                file.transferTo(file1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return file1;
    }
	
	private File directoryCheck(String directory) {
		File file = new File(directory);
		if(!file.exists()) file.mkdirs();
		return file;
	}
	
	private String getNewName() {
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        return ft.format(new Date()) + (int) (Math.random() * 10);
    }

}
