package team.truffle.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ImageMapper {

	Map<String, Object> getByteImage(int userId);

}
