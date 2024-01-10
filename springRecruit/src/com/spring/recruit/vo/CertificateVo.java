package com.spring.recruit.vo;

public class CertificateVo {

	
	private int certSeq;
	private int seq;
	private String qualifiName;
	private String acquDate;
	private String organizeName;
	
	
	
	public int getCertSeq() {
		return certSeq;
	}
	public void setCertSeq(int certSeq) {
		this.certSeq = certSeq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getQualifiName() {
		return qualifiName;
	}
	public void setQualifiName(String qualifiName) {
		this.qualifiName = qualifiName;
	}
	public String getAcquDate() {
		return acquDate;
	}
	public void setAcquDate(String acquDate) {
		this.acquDate = acquDate;
	}
	public String getOrganizeName() {
		return organizeName;
	}
	public void setOrganizeName(String organizeName) {
		this.organizeName = organizeName;
	}
	@Override
	public String toString() {
		return "CertificateVo [certSeq=" + certSeq + ", seq=" + seq + ", qualifiName=" + qualifiName + ", acquDate="
				+ acquDate + ", organizeName=" + organizeName + "]";
	}
	
	
	
	
	
	
}
