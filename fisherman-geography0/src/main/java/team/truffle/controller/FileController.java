package team.truffle.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import team.truffle.DLModel;
import org.springframework.ui.Model;
import team.truffle.service.FileService;

@Controller
public class FileController {

	@Autowired
	FileService fileService;

	//img 태그에서 src를 이용하여 사용자 프로필 이미지를 보여줄 때
	@RequestMapping(value = "/profileImageDisplay", method = RequestMethod.GET)
	public void showImage(@RequestParam("id") Integer userId, HttpServletResponse response,HttpServletRequest request) 
			throws ServletException, IOException{


		Map<String,Object> userIMG =fileService.getByteImage(userId);  
		byte[] userImg=(byte[])userIMG.get("img");

		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		InputStream inputStream = new ByteArrayInputStream(userImg);
		IOUtils.copy(inputStream, response.getOutputStream());
		System.out.print(userImg.length); 

		response.getOutputStream().close();
	}

	@RequestMapping(value = "/fileUpload") // method = RequestMethod.GET 
	public String fileUpload(HttpServletRequest req, HttpServletResponse rep,HttpSession session) { 

		//파일이 저장될 path 설정
		String path = "c://aaa"; 
		Random random = new Random();
		Map returnObject = new HashMap();
		ByteArrayOutputStream  baos = null;  
		try { 
			// MultipartHttpServletRequest 생성 
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
			Iterator iter = mhsr.getFileNames(); 

			MultipartFile mfile = null; 
			String fieldName = ""; 
			List resultList = new ArrayList(); 
			// 디렉토리가 없다면 생성 
			File dir = new File(path); 
			if (!dir.isDirectory()) { dir.mkdirs(); } 

			// 값이 나올때까지
			while (iter.hasNext()) { 
				fieldName = (String) iter.next(); 
				// 내용을 가져와서 
				mfile = mhsr.getFile(fieldName); 
				String origName; 
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); 
				//한글꺠짐 방지
				// 파일명이 없다면
				if ("".equals(origName)) { continue; } 
				// 파일 명 변경(uuid로 암호화) 
				// 전체이름에서 확장자 찾아내기
				String ext = origName.substring(origName.lastIndexOf('.')); 
				String uuid=getUuid();
				String saveFileName = uuid + ext; 
				// 설정한 path에 파일저장
				File serverFile = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFile);

				BufferedImage img = ImageIO.read(serverFile);
				baos = new ByteArrayOutputStream();
				ImageIO.write(img, "jpg", baos); 
				System.out.println("baos에 저장완료");
				Map<String,Object> userIMG=new HashMap<String, Object>();
				userIMG.put("img",  baos.toByteArray());
				userIMG.put("userId", uuid);
				System.out.println("맵에 저장완료");

				fileService.saveFishImageToDB(userIMG);
				System.out.println("이미지 저장 쿼리문 실행");

				session.setAttribute("imageId", uuid);

				Map<String,Object> file = new HashMap<String,Object>();
				file.put("origName", origName); 
				file.put("sfile", serverFile); 
				resultList.add(file); 
			} 
			returnObject.put("files", resultList); 
			returnObject.put("params", mhsr.getParameterMap()); 
		}
		catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace(); }
		catch (IllegalStateException e) {
			// TODO Auto-generated 	catch block
			e.printStackTrace(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} return "redirect:/classification2"; 
	} 
	//랜덤으로 uuid생성 
	public static String getUuid() { return UUID.randomUUID().toString().replaceAll("-", ""); }



	@RequestMapping(value="/classification2")
	public String classification2(Model model) throws Exception{
		
		DLModel dlm =new DLModel();
		double prediction=dlm.handle();
		model.addAttribute("prediction", prediction);

		return "classification2";

	}



	@RequestMapping(value = "/fishImageDisplay", method = RequestMethod.GET)
	public void showImage(@RequestParam("imageId") String imageId,HttpServletResponse response,HttpServletRequest request) 
			throws ServletException, IOException{


		Map<String,Object> userIMG =fileService.getFishByteImage(imageId);  
		System.out.println("디비에서 불러오는 거 성공");
		byte[] userImg=(byte[])userIMG.get("img");
		System.out.println("바이트배열로 변경 성공");
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		InputStream inputStream = new ByteArrayInputStream(userImg);
		IOUtils.copy(inputStream, response.getOutputStream());
		System.out.print(userImg.length); 

		response.getOutputStream().close();
	}

}
