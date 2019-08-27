package team.truffle.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.truffle.mapper.ImageMapper;

@Service
public class FileService {
	
	@Autowired
	ImageMapper imageMapper;
	
	//유저 프로필 사진 디비에 저장
	public void saveProfileImage(Map<String, Object> userIMG) {
		imageMapper.saveProfileImage(userIMG);
	}
	
	//유저Id로 프로필사진 불러오기
	public Map<String, Object> getByteImage(int userId){
		Map<String,Object> map =imageMapper.getByteImage(userId);
		if(map!=null)System.out.println(map);
		return map;
	}
	//사용자가 올린 물고기 사진 디비에 저장
	public void saveFishImageToDB(Map<String, Object> userIMG) {
		imageMapper.saveFishImageToDB(userIMG);
		
	}
	//uuId로 물고기사진 불러오기
	public Map<String, Object> getFishByteImage(String imageId) {
		return imageMapper.getFishByteImage(imageId);
	}

	
	


}
