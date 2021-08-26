package vo;

public class BoardVo {
	
	int no;
	
	int    b_idx;
	String b_subject;
	String b_content;
	String b_photo;
    int    b_readhit;
    String b_ip;
    String b_regdate;
    String b_use_yn;
    
    int    i_idx;
    String i_name;
    
    int    comment_count;  
    
    public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
    
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
	public String getB_photo() {
		return b_photo;
	}
	public void setB_photo(String b_photo) {
		this.b_photo = b_photo;
	}
	
	public int getB_readhit() {
		return b_readhit;
	}
	public void setB_readhit(int b_readhit) {
		this.b_readhit = b_readhit;
	}
	
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	
	public String getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	
	public String getB_use_yn() {
		return b_use_yn;
	}
	public void setB_use_yn(String b_use_yn) {
		this.b_use_yn = b_use_yn;
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
    
}
