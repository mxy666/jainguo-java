package com.jianguo.bean;

public class T_user_login_Bean {

	//ÓÃ»§µÇÂ¼±í
	private int id;//ID
	private String tel;//ÃÜÂë
	private String password;//µç»°
	private String qqwx_token;//QQ
	private int status;//×´Ì¬
	private int resume;//ÊÇ·ñÌîĞ´¼òÀú
	private String qiniu;//ÆßÅ£
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getStatus() {
		return status;
	}
	public void setQqwx_token(String qqwx_token) {
		this.qqwx_token = qqwx_token;
	}
	public String getQqwx_token() {
		return qqwx_token;
	}
	public void setQiniu(String qiniu) {
		this.qiniu = qiniu;
	}
	public String getQiniu() {
		return qiniu;
	}
	public void setResume(int resume) {
		this.resume = resume;
	}
	public int getResume() {
		return resume;
	}
	
}
