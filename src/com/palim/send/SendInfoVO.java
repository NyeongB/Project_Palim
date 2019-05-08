package com.palim.send;

public class SendInfoVO {	
	
	//이메일정보
	private final String host = "smtp.ajou.ac.kr";
	private final String user   = "dbstjr1109";
	private final String password  = "!dbstjr1109";//내비밀번호
	
	//핸드폰정보
	private String api_key = "NCSICLT86MH5UUYS";
    private String api_secret = "K7RPU7ZN8HWFMGDMIBJNN42ICWCHPMNL";
	
	public String getApi_key() {
		return api_key;
	}

	public void setApi_key(String api_key) {
		this.api_key = api_key;
	}

	public String getApi_secret() {
		return api_secret;
	}

	public void setApi_secret(String api_secret) {
		this.api_secret = api_secret;
	}

	public String getHost() {
		return host;
	}
	
	public String getUser() {
		return user;
	}
	public String getPassword() {
		return password;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((host == null) ? 0 : host.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SendInfoVO other = (SendInfoVO) obj;
		if (host == null) {
			if (other.host != null)
				return false;
		} else if (!host.equals(other.host))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}
	
	
}
