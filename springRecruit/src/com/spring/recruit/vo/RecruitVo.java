package com.spring.recruit.vo;

public class RecruitVo {

	
	private int seq;
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String email;
	private String addr;
	private String location;
	private String workType;
	private String sumbit;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getSumbit() {
		return sumbit;
	}
	public void setSumbit(String sumbit) {
		this.sumbit = sumbit;
	}
	@Override
	public String toString() {
		return "RecruitVo [seq=" + seq + ", name=" + name + ", birth=" + birth + ", gender=" + gender + ", phone="
				+ phone + ", email=" + email + ", addr=" + addr + ", location=" + location + ", workType=" + workType
				+ ", sumbit=" + sumbit + "]";
	}
	
	
}
