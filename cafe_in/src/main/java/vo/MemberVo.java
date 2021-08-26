package vo;

public class MemberVo {
	int 	i_idx;
	String	i_name;
	String	i_id;
	String	i_pwd;
	String	i_email;
	String	i_zipcode;
	String	i_addr;
	String	i_addr_detail;
	String	i_birth;
	String	i_tel;
	String	i_grade;
	String  i_ip;

	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	//추가
	public MemberVo(String i_name, String i_id, String i_pwd, String i_email, String i_zipcode, String i_addr,
			String i_addr_detail, String i_birth,String i_ip, String i_tel, String i_grade ) {
		super();
		this.i_name = i_name;
		this.i_id = i_id;
		this.i_pwd = i_pwd;
		this.i_email = i_email;
		this.i_zipcode = i_zipcode;
		this.i_addr = i_addr;
		this.i_addr_detail = i_addr_detail;
		this.i_birth = i_birth;
		this.i_ip = i_ip;
		this.i_tel = i_tel;
		this.i_grade = i_grade;
		
	}
	
	//수정
	public MemberVo(int i_idx, String i_pwd, String i_email, String i_zipcode, String i_addr, String i_addr_detail,
			String i_birth, String i_tel, String i_grade, String i_ip) {
		super();
		this.i_idx = i_idx;
		this.i_pwd = i_pwd;
		this.i_email = i_email;
		this.i_zipcode = i_zipcode;
		this.i_addr = i_addr;
		this.i_addr_detail = i_addr_detail;
		this.i_birth = i_birth;
		this.i_tel = i_tel;
		this.i_grade = i_grade;
		this.i_ip = i_ip;
	}
	
	


	
	public MemberVo(int i_idx, String i_name, String i_id, String i_pwd, String i_email, String i_zipcode,
			String i_addr, String i_addr_detail, String i_birth, String i_tel, String i_grade, String i_ip) {
		super();
		this.i_idx = i_idx;
		this.i_name = i_name;
		this.i_id = i_id;
		this.i_pwd = i_pwd;
		this.i_email = i_email;
		this.i_zipcode = i_zipcode;
		this.i_addr = i_addr;
		this.i_addr_detail = i_addr_detail;
		this.i_birth = i_birth;
		this.i_tel = i_tel;
		this.i_grade = i_grade;
		this.i_ip = i_ip;
	}


	public String getI_ip() {
		return i_ip;
	}

	public void setI_ip(String i_ip) {
		this.i_ip = i_ip;
	}
	public int getI_idx() {
		return i_idx;
	}
	public void setI_idx(int i_idx) {
		this.i_idx = i_idx;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_id() {
		return i_id;
	}
	public void setI_id(String i_id) {
		this.i_id = i_id;
	}
	public String getI_pwd() {
		return i_pwd;
	}
	public void setI_pwd(String i_pwd) {
		this.i_pwd = i_pwd;
	}
	public String getI_email() {
		return i_email;
	}
	public void setI_email(String i_email) {
		this.i_email = i_email;
	}
	public String getI_zipcode() {
		return i_zipcode;
	}
	public void setI_zipcode(String i_zipcode) {
		this.i_zipcode = i_zipcode;
	}
	public String getI_addr() {
		return i_addr;
	}
	public void setI_addr(String i_addr) {
		this.i_addr = i_addr;
	}
	public String getI_addr_detail() {
		return i_addr_detail;
	}
	public void setI_addr_detail(String i_addr_detail) {
		this.i_addr_detail = i_addr_detail;
	}
	public String getI_birth() {
		return i_birth;
	}
	public void setI_birth(String i_birth) {
		
		this.i_birth = i_birth;
	}
	public String getI_tel() {
		return i_tel;
	}
	public void setI_tel(String i_tel) {
		this.i_tel = i_tel;
	}
	public String getI_grade() {
		return i_grade;
	}
	public void setI_grade(String i_grade) {
		this.i_grade = i_grade;
	}
	
}
