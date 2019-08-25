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
	
	public static byte[] fileToBinary(File file) {
	    String out = new String();
	    FileInputStream fis = null;
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	 
	    try {
	        fis = new FileInputStream(file);
	    } catch (FileNotFoundException e) {
	        System.out.println("Exception position : FileUtil - fileToString(File file)");
	    }
	 
	    int len = 0;
	    byte[] buf = new byte[1024];
	    try {
	        while ((len = fis.read(buf)) != -1) {
	            baos.write(buf, 0, len);
	        }
	 
	        byte[] fileArray = baos.toByteArray();
	        out = new String(base64Enc(fileArray));
	 
	        fis.close();
	        baos.close();
	    } catch (IOException e) {
	        System.out.println("Exception position : FileUtil - fileToString(File file)");
	    }
	 
	    return out.getBytes();
	}
	 
	public static byte[] base64Enc(byte[] buffer) {
	    return Base64.encodeBase64(buffer);
	}

	public Map<String, Object> getByteImage(int userId){
		Map<String,Object> map =imageMapper.getByteImage(userId);
		if(map!=null)System.out.println(map);
		return map;
	}


}
