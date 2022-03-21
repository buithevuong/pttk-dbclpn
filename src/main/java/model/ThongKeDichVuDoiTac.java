package model;

import java.util.Date;

public class ThongKeDichVuDoiTac extends DichVuDoiTac {

	private long tongLuotDung;
	private float tongChiPhi;
	private Date batDau;
	private Date ketThuc;

	public ThongKeDichVuDoiTac() {
		super();
	}

	public long getTongLuotDung() {
		return tongLuotDung;
	}

	public void setTongLuotDung(long tongLuotDung) {
		this.tongLuotDung = tongLuotDung;
	}

	public float getTongChiPhi() {
		return tongChiPhi;
	}

	public void setTongChiPhi(float tongChiPhi) {
		this.tongChiPhi = tongChiPhi;
	}

	public Date getBatDau() {
		return batDau;
	}

	public void setBatDau(Date batDau) {
		this.batDau = batDau;
	}

	public Date getKetThuc() {
		return ketThuc;
	}

	public void setKetThuc(Date ketThuc) {
		this.ketThuc = ketThuc;
	}

}
