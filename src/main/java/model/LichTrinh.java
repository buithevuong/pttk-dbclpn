package model;

import java.util.List;

public class LichTrinh {

	private Long id;
	private String mota;
	private List<DichVuSuDung> dsdichvusudung;

	public LichTrinh() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public List<DichVuSuDung> getDsdichvusudung() {
		return dsdichvusudung;
	}

	public void setDsdichvusudung(List<DichVuSuDung> dsdichvusudung) {
		this.dsdichvusudung = dsdichvusudung;
	}

}
