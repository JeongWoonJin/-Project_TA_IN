package com.project.tain.membermanage.model.vo;

import java.sql.Date;

public class mLikeVO {
	private String m_id;
	private	Date l_date;
	private String b_id;
	private String b_img1;
	private String b_img2;
	private String b_img3;
	private String b_img4;
	private String b_img5;
	private String b_img6;
	private String b_img7;
	private String b_img8;
	private String b_img9;
	private String b_img10;
	
	public mLikeVO() {
	}
	
	public mLikeVO(String m_id, Date l_date, String b_id, String b_img1, String b_img2, String b_img3, String b_img4,
			String b_img5, String b_img6, String b_img7, String b_img8, String b_img9, String b_img10) {
		super();
		this.m_id = m_id;
		this.l_date = l_date;
		this.b_id = b_id;
		this.b_img1 = b_img1;
		this.b_img2 = b_img2;
		this.b_img3 = b_img3;
		this.b_img4 = b_img4;
		this.b_img5 = b_img5;
		this.b_img6 = b_img6;
		this.b_img7 = b_img7;
		this.b_img8 = b_img8;
		this.b_img9 = b_img9;
		this.b_img10 = b_img10;
	}
	
	@Override
	public String toString() {
		return "mLikeVO [m_id=" + m_id + ", l_date=" + l_date + ", b_id=" + b_id + ", b_img1=" + b_img1 + ", b_img2="
				+ b_img2 + ", b_img3=" + b_img3 + ", b_img4=" + b_img4 + ", b_img5=" + b_img5 + ", b_img6=" + b_img6
				+ ", b_img7=" + b_img7 + ", b_img8=" + b_img8 + ", b_img9=" + b_img9 + ", b_img10=" + b_img10 + "]";
	}

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getL_date() {
		return l_date;
	}
	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public String getB_img1() {
		return b_img1;
	}
	public void setB_img1(String b_img1) {
		this.b_img1 = b_img1;
	}
	public String getB_img2() {
		return b_img2;
	}
	public void setB_img2(String b_img2) {
		this.b_img2 = b_img2;
	}
	public String getB_img3() {
		return b_img3;
	}
	public void setB_img3(String b_img3) {
		this.b_img3 = b_img3;
	}
	public String getB_img4() {
		return b_img4;
	}
	public void setB_img4(String b_img4) {
		this.b_img4 = b_img4;
	}
	public String getB_img5() {
		return b_img5;
	}
	public void setB_img5(String b_img5) {
		this.b_img5 = b_img5;
	}
	public String getB_img6() {
		return b_img6;
	}
	public void setB_img6(String b_img6) {
		this.b_img6 = b_img6;
	}
	public String getB_img7() {
		return b_img7;
	}
	public void setB_img7(String b_img7) {
		this.b_img7 = b_img7;
	}
	public String getB_img8() {
		return b_img8;
	}
	public void setB_img8(String b_img8) {
		this.b_img8 = b_img8;
	}
	public String getB_img9() {
		return b_img9;
	}
	public void setB_img9(String b_img9) {
		this.b_img9 = b_img9;
	}
	public String getB_img10() {
		return b_img10;
	}
	public void setB_img10(String b_img10) {
		this.b_img10 = b_img10;
	}
}
