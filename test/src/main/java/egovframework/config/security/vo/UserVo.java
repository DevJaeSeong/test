package egovframework.config.security.vo;

import lombok.Data;

@Data
public class UserVo {

	private String userId;
	private String password;
	private String authorityId;
	private boolean accountExpired;
	private boolean accountLocked;
	private boolean credentialsExpired;
	private boolean disabled;
}
