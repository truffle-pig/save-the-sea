package team.truffle.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.imageio.ImageIO;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import team.truffle.VO.User;
import team.truffle.dto.LoggedInUser;
import team.truffle.service.FileService;
import team.truffle.service.KakaoAPI;
import team.truffle.service.SignService;

@Controller
public class MainController {

	@Autowired
	private KakaoAPI kakao;

	@Autowired
	private FileService fileService;

	@Autowired
	private SignService signService;
	
//맨 처음 접속하는 페이지
	@RequestMapping(value="/")
	public String index() {

		return "intro";
	}
//로그인 페이지
	@RequestMapping(value="/login")
	public String login(@RequestParam("code") String code,HttpSession session) {

		//접근 코드 얻기
		String access_Token = kakao.getAccessToken(code);

		//유저 별명과 이메일 정보 맵 객체 획득
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller(user) : " + userInfo);

		//유저 프로필 이미지 정보 담은 맵 객체 획득
		HashMap<String, Object> profile = kakao.getProfile(access_Token);
		System.out.println("login Controller(profile) : " + profile);

		//로그인한 유저 정보 저장할 유저 객체 생성
		User user=new User();

		//등록된 계정이 아닌 경우  User 테이블에 계정등록
		if(signService.userLogin(userInfo)==null) {
			user.setId(Integer.parseInt((String) userInfo.get("id")));
			user.setName((String) userInfo.get("nickname"));
			user.setEmail((String) userInfo.get("email"));
			signService.signUp(user);
			int userId=Integer.parseInt((String) userInfo.get("id"));

			ByteArrayOutputStream  baos = null;  
			try {
				//url에서 프로필 이미지 끌어와서 로컬에 저장
				URL url = new URL((String) profile.get("profileImageURL"));
				BufferedImage img = ImageIO.read(url);
				baos = new ByteArrayOutputStream();
				ImageIO.write(img, "jpg", baos); 
				ImageIO.write(img, "jpg", new File("C:/data/userProfile.jpg"));

				//파일 형태를 byte[]로 변환한 다음 user테이블에 저장
				Map<String,Object> userIMG=new HashMap<String, Object>();
				userIMG.put("IMAGE",  baos.toByteArray());
				userIMG.put("USERID",  userId);
				System.out.println("맵에 저장완료");
				fileService.saveProfileImage(userIMG);
				System.out.println("이미지 저장 쿼리문 실행");


			} catch (IOException e) {
				e.printStackTrace();
			}



		}
		//이미 등록된 계정인 경우 디비에서 불러와서 user 객체에 저장
		else {
			user=signService.userLogin(userInfo);
		}
		System.out.println(user.toString());
		//로그인한 유저 객체에 앞에서 저장한 User 정보 넣기
		LoggedInUser liu =new LoggedInUser();
		liu.setUserId(user.getId());
		liu.setEmail(user.getEmail());
		liu.setName(user.getName());
		System.out.println(liu.toString());



		//클라이언트의 이메일이 존재할 때 세션에 해당 로그인된 유저 객체과 토큰 등록
		if (userInfo.get("email") != null) {
			
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("loginUser", liu); //세션에 로그인 정보 넣어두기.
			session.setAttribute("user", user); 
		}
		return "login";
	}
//로고 누르면 메인 페이지 이동	
	@RequestMapping(value="/main")
	public String mainPage() {
		
		return "login";

	}
	
//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "intro";
	}
//탈퇴
	@RequestMapping(value="/disconnect")
	public String disconnect(HttpSession session) {
		kakao.kakaoDisconnect((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "index";
	}

//	@RequestMapping(value="/getByteImage")
//	public ResponseEntity<byte[]> getByteImage(HttpSession session) {
//
//
//		Map<String, Object> map=(Map<String, Object>) session.getAttribute("map");
//		byte[] imageContent = (byte[]) map.get("img");
//		final HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.IMAGE_JPEG);
//		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.CREATED);
//	}

	

	@RequestMapping(value="/recommend")
	public String recommend() {
		
		return "recommend";

	}
	
	@RequestMapping(value="/classification")
	public String classification() {
		
		return "classification1";

	}
	
	@RequestMapping(value="/fishbowl")
	public String fishbowl(HttpSession session,Model model) {
		
		User user=(User)session.getAttribute("user");
		model.addAttribute("user", user);
		return "fishbowl";

	}
	
	@RequestMapping(value="/point")
	public String point() {
		
		return "point";

	}



}
