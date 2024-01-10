package com.spring.recruit.vo;

public class EducationVo {
	
	
	private int eduSeq;
	private int seq;
	private String schoolName;
	private String division;
	private String startPeriod;
	private String endPeriod;
	private String major;
	private String grade;
	private String location;
	
	public int getEduSeq() {
		return eduSeq;
	}
	public void setEduSeq(int eduSeq) {
		this.eduSeq = eduSeq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getStartPeriod() {
		return startPeriod;
	}
	public void setStartPeriod(String startPeriod) {
		this.startPeriod = startPeriod;
	}
	public String getEndPeriod() {
		return endPeriod;
	}
	public void setEndPeriod(String endPeriod) {
		this.endPeriod = endPeriod;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "EducationVo [eduSeq=" + eduSeq + ", seq=" + seq + ", schoolName=" + schoolName + ", division="
				+ division + ", startPeriod=" + startPeriod + ", endPeriod=" + endPeriod + ", major=" + major
				+ ", grade=" + grade + ", location=" + location + "]";
	}

}
