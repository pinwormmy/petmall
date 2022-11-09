package com.mall.petshop.product;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

// 근데 이걸 컨트롤러 두는게 맞냐? 리팩토링할때 정리좀해라

@Slf4j
@Controller
public class ThumbnailController {

	static final int THUMB_WIDTH = 600;
	static final int THUMB_HEIGHT = 600;

	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {
		UUID uid = UUID.randomUUID();
		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + ymdPath;
		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);
		File image = new File(imgPath + File.separator + newFileName);
		if (image.exists())
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(image);
		return newFileName;
	}

	public static String calcPath(String uploadPath) {
				
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);

		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {		
		
		if (new File(paths[paths.length - 1]).exists()) 
			return;		

		for (String path : paths) {

			File dirPath = 
					new File(uploadPath + path);
			if (!dirPath.exists()) {
				log.debug("생성된 폴더 : {}", dirPath);
				dirPath.mkdirs();
			}

		}
	}
}
