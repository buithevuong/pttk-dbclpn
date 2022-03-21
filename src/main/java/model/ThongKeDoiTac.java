package model;

import java.util.Date;

public class ThongKeDoiTac extends DoiTac {

	private long soluongtour;
	private long tongsokhach;
	private float tongdoanhthu;
	private Date batDau;
	private Date ketThuc;

	public ThongKeDoiTac() {
		super();
	}

	public long getSoluongtour() {
		return soluongtour;
	}

	public void setSoluongtour(long soluongtour) {
		this.soluongtour = soluongtour;
	}

	public long getTongsokhach() {
		return tongsokhach;
	}

	public void setTongsokhach(long tongsokhach) {
		this.tongsokhach = tongsokhach;
	}

	public float getTongdoanhthu() {
		return tongdoanhthu;
	}

	public void setTongdoanhthu(float tongdoanhthu) {
		this.tongdoanhthu = tongdoanhthu;
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

	@Override
	public String toString() {
		return getTen();
	}

}
