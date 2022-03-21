package model;

import java.util.Date;

public class DichVuDoiTac {

	private Long id;
	private float dongia;
	private Date ngaytao;
	private DichVu dichvu;
	private DoiTac doitac;

	public DichVuDoiTac() {
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

	public Date getNgaytao() {
		return ngaytao;
	}

	public void setNgaytao(Date ngaytao) {
		this.ngaytao = ngaytao;
	}

	public DichVu getDichvu() {
		return dichvu;
	}

	public void setDichvu(DichVu dichvu) {
		this.dichvu = dichvu;
	}

	public DoiTac getDoitac() {
		return doitac;
	}

	public void setDoitac(DoiTac doitac) {
		this.doitac = doitac;
	}

}
