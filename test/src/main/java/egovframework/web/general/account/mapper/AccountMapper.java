package egovframework.web.general.account.mapper;

import org.apache.ibatis.annotations.Mapper;

import egovframework.web.general.account.vo.CreateAccountVo;

@Mapper
public interface AccountMapper {

	int insertUser(CreateAccountVo createAccountVo) throws Exception;
	boolean isExistsUserId(String userId) throws Exception;
}
