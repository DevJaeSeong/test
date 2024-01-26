package egovframework.config.security.mapper;

import org.apache.ibatis.annotations.Mapper;

import egovframework.config.security.vo.UserDetailVo;
import egovframework.config.security.vo.UserVo;

@Mapper
public interface SecurityMapper {

	UserVo getUserByIdForLogin(String userId) throws Exception;
	UserDetailVo getUserDetailById(String userId) throws Exception;
}
