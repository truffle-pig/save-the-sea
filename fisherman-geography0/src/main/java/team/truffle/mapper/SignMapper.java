package team.truffle.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import team.truffle.VO.User;

@Mapper
public interface SignMapper {

	int signUp(User user);

	User userLogin(Map<String, Object> loginMap);

	

}
