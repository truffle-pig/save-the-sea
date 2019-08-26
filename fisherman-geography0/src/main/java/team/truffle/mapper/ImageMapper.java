package team.truffle.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ImageMapper {
	
	void saveProfileImage(Map<String, Object> userIMG);
	
	void saveFishImageToDB(Map<String, Object> userIMG);

	Map<String, Object> getByteImage(int userId);
	
	Map<String, Object> getFishByteImage(String userId);

}
