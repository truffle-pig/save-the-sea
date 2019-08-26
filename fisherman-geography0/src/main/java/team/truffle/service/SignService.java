package team.truffle.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import team.truffle.VO.User;
import team.truffle.mapper.SignMapper;

@Service
public class SignService {
	
	@Autowired
	private SignMapper signMapper;
	
	public int signUp(User user) {
		return signMapper.signUp(user);
	}
	
	public User userLogin(Map<String, Object> loginMap) {
		return signMapper.userLogin(loginMap);
	}

	

}
