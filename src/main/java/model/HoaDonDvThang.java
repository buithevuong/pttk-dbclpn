package model;

import java.util.Date;
import java.util.List;

public class HoaDonDvThang {

	private Long id;
	private String tendichvu;
	private Date ngaybatdau;
	private int soluong;
	private float thanhtien;
	private boolean dathanhtoan;
	private Date thoigian;
	private List<DichVuSuDung> dsdichvusudung;

	public HoaDonDvThang() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTendichvu() {
		return tendichvu;
	}

	public void setTendichvu(String tendichvu) {
		this.tendichvu = tendichvu;
	}

	public Date getNgaybatdau() {
		return ngaybatdau;
	}

	public void setNgaybatdau(Date ngaybatdau) {
		this.ngaybatdau = ngaybatdau;
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

	public boolean isDathanhtoan() {
		return dathanhtoan;
	}

	public void setDathanhtoan(boolean dathanhtoan) {
		this.dathanhtoan = dathanhtoan;
	}

	public Date getThoigian() {
		return thoigian;
	}

	public void setThoigian(Date thoigian) {
		this.thoigian = thoigian;
	}

	public List<DichVuSuDung> getDsdichvusudung() {
		return dsdichvusudung;
	}

	public void setDsdichvusudung(List<DichVuSuDung> dsdichvusudung) {
		this.dsdichvusudung = dsdichvusudung;
	}

}
