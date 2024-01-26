package egovframework.web.general.account.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class CreateAccountVo {
	
    @NotBlank(message = "아이디 입력값이 없습니다.")
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "아이디는 영어 대문자, 소문자, 숫자만 사용가능합니다.")
	private String userId;

    @NotBlank(message = "비밀번호 입력값이 없습니다.")
    @Length(min = 8, message = "비밀번호는 길이가 8이상 이여야합니다.")
    @Pattern(
        regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
        message = "비밀번호는 영어 대문자, 소문자, 숫자, 특수기호 가 반드시 포함되어야 합니다."
    )
	private String password;
	
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
