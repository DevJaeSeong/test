package egovframework.config.security.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class UserDetailVo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String userName;
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	private String phoneNumFirst;
	private String phoneNumMiddle;
	private String phoneNumLast;
	private String emailId;
	private String emailDomain;
	private String postCode;
	private String adress;
	private String adressDetail;
}
