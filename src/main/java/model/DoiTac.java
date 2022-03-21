package model;

import java.util.List;

public class DoiTac {

	private Long id;
	private String ten;
	private String email;
	private String sodienthoai;
	private String mota;
	private List<DichVuDoiTac> dichvudoitac;

	public DoiTac() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSodienthoai() {
		return sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public List<DichVuDoiTac> getDichvudoitac() {
		return dichvudoitac;
	}

	public void setDichvudoitac(List<DichVuDoiTac> dichvudoitac) {
		this.dichvudoitac = dichvudoitac;
	}

}
