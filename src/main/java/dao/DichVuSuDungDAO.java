package dao;

import java.security.InvalidParameterException;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.DichVu;
import model.DichVuDoiTac;
import model.DichVuSuDung;

public class DichVuSuDungDAO extends DAO {

	public DichVuSuDungDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<DichVuSuDung> getDSDichVuSuDung(Long idDichVuDoiTac, String start, String finish) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long dStart, dFinish, now = System.currentTimeMillis();
		try {
			dStart = sdf.parse(start).getTime();
			dFinish = sdf.parse(finish).getTime();
			if (dStart > dFinish || dStart > now)
				throw new InvalidParameterException("Thời gian sai định dạng");
		} catch (ParseException e1) {
			System.out.println(e1.getMessage());
			return null;
		}

		List<DichVuSuDung> list = null;
		String sql = "SELECT dvsd.Id , dv.ten , dvsd.ngaybatdau , dvsd.dongia , dvsd.thanhtien \r\n"
				+ "FROM tbldichvusudung dvsd \r\n"
				+ "LEFT JOIN tbldichvudoitac dvdt ON dvsd.tblDichVuDoiTacId = dvdt.Id\r\n"
				+ "JOIN tbldichvu dv ON dvdt.tblDichvuid = dv.Id\r\n"
				+ "JOIN tblhoadondvthang hdt ON hdt.Id = dvsd.tblHoadondvthangId\r\n"
				+ "WHERE dvdt.Id = ? AND hdt.dathanhtoan = 1 AND dvsd.ngaybatdau >= ? AND dvsd.ngaybatdau <= ?\r\n"
				+ "ORDER BY dvsd.ngaybatdau";
		try {

			CallableStatement cs = con.prepareCall(sql);
			cs.setLong(1, idDichVuDoiTac);
			cs.setDate(2, new Date(dStart));
			cs.setDate(3, new Date(dFinish));

			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				if (list == null)
					list = new ArrayList<DichVuSuDung>();

				DichVuDoiTac dvdt = new DichVuDoiTac();
				DichVu dv = new DichVu();
				dv.setTen(rs.getString("ten"));

				dvdt.setDichvu(dv);
				dvdt.setId(rs.getLong("Id"));

				DichVuSuDung dvsd = new DichVuSuDung();
				dvsd.setDichvudoitac(dvdt);
				dvsd.setDongia(rs.getFloat("dongia"));
				dvsd.setThanhtien(rs.getFloat("thanhtien"));
				dvsd.setNgaybatdau(rs.getDate("ngaybatdau"));
				list.add(dvsd);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		return list;

	}

}
