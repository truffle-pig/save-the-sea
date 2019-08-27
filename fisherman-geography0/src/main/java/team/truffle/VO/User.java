package team.truffle.VO;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class User {
	
	int id;
	String name;
	int fishbowl_id;
	int point;
	String email;
	MultipartFile img;
	
	
	

}
