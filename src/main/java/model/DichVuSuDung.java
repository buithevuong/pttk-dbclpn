package model;

import java.util.Date;

public class DichVuSuDung {

	private Long id;
	private float dongia;
	private int soluong;
	private float thanhtien;
	private Date ngaybatdau;
	private DichVuDoiTac dichvudoitac;

	public DichVuSuDung() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public float getDongia() {
		return dongia;
	}

	public void setDongia(float dongia) {
		this.dongia = dongia;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public float getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(float thanhtien) {
		this.thanhtien = thanhtien;
	}

	public Date getNgaybatdau() {
		return ngaybatdau;
	}

	public void setNgaybatdau(Date ngaybatdau) {
		this.ngaybatdau = ngaybatdau;
	}

	public DichVuDoiTac getDichvudoitac() {
		return dichvudoitac;
	}

	public void setDichvudoitac(DichVuDoiTac dichvudoitac) {
		this.dichvudoitac = dichvudoitac;
	}

}
