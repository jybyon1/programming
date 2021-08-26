package vo;

import org.springframework.web.multipart.MultipartFile;

public class RecommendVo {

	//upload된 임시파일을 관리할 spring객체
	MultipartFile photo;
	
	int		c_idx;
	String	c_name;
	String	c_tel;
	String	c_zipcode;
	String	c_addr;
	String	c_addr_detail;
	
	int		c_parking;
	int		c_alcohol;
	int		c_nokidz;
	String	c_ip;
	String	c_photo;
	double   r_star_avg;
	
	
	
	public double getR_star_avg() {
		return r_star_avg;
	}
	public void setR_star_avg(double r_star_avg) {
		this.r_star_avg = r_star_avg;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getC_zipcode() {
		return c_zipcode;
	}
	public void setC_zipcode(String c_zipcode) {
		this.c_zipcode = c_zipcode;
	}
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public String getC_addr_detail() {
		return c_addr_detail;
	}
	public void setC_addr_detail(String c_addr_detail) {
		this.c_addr_detail = c_addr_detail;
	}
	public int getC_parking() {
		return c_parking;
	}
	public void setC_parking(int c_parking) {
		this.c_parking = c_parking;
	}
	public int getC_alcohol() {
		return c_alcohol;
	}
	public void setC_alcohol(int c_alcohol) {
		this.c_alcohol = c_alcohol;
	}
	public int getC_nokidz() {
		return c_nokidz;
	}
	public void setC_nokidz(int c_nokidz) {
		this.c_nokidz = c_nokidz;
	}
	public String getC_ip() {
		return c_ip;
	}
	public void setC_ip(String c_ip) {
		this.c_ip = c_ip;
	}
	public String getC_photo() {
		return c_photo;
	}
	public void setC_photo(String c_photo) {
		this.c_photo = c_photo;
	}
	
	
	
	
}

