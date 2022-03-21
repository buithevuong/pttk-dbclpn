package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import model.NhanVien;

public class NhanVienDAO extends DAO {
	public NhanVienDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NhanVien nhanVienQuanLyDangNhap(String username, String password) {
		NhanVien nv = null;
		String sql = "SELECT nv.*\r\n" + "FROM tblnhanvien nv\r\n" + "WHERE nv.username = ? AND nv.password = ?;";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, username);
			cs.setString(2, password);
			ResultSet rs = cs.executeQuery();

			rs.next();
			nv = new NhanVien();
			nv.setId(rs.getLong("Id"));
			nv.setHoten(rs.getString("hoten"));
			nv.setChucVu(rs.getString("chucvu"));
			nv.setSoID(rs.getString("soID"));

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}

		return nv;

	}
}
