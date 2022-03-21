package model;

import java.util.Date;

public class NhanVien {

	private Long id;
	private String hoten;
	private String diachi;
	private String soID;
	private String chucVu;
	private Date ngayBatDau;
	private String username;
	private String password;
	private Date ngaysinh;
	private String gioitinh;
	private String email;
	private String sodienthoai;

	public NhanVien() {
		super();
	}

	public String getSoID() {
		return soID;
	}

	public void setSoID(String soID) {
		this.soID = soID;
	}

	public String getChucVu() {
		return chucVu;
	}

	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}

	public Date getNgayBatDau() {
		return ngayBatDau;
	}

	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getNgaysinh() {
		return ngaysinh;
	}

	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}

	public String getGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
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

	@Override
	public String toString() {
		return "NhanVien [id=" + id + ", hoten=" + hoten + ", diachi=" + diachi + ", soID=" + soID + ", chucVu="
				+ chucVu + ", ngayBatDau=" + ngayBatDau + ", username=" + username + ", password=" + password
				+ ", ngaysinh=" + ngaysinh + ", gioitinh=" + gioitinh + ", email=" + email + ", sodienthoai="
				+ sodienthoai + "]";
	}

}
