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
import model.ThongKeDichVuDoiTac;

public class ThongKeDichVuDoiTacDAO extends DAO {

	public ThongKeDichVuDoiTacDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<ThongKeDichVuDoiTac> getThongKeDichVuDoiTac(Long idDoiTac, String start, String finish) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long dStart, dFinish , now = System.currentTimeMillis();
		try {
			dStart = sdf.parse(start).getTime();
			dFinish = sdf.parse(finish).getTime();
			
			if (dStart > dFinish || dStart > now)
				throw new InvalidParameterException("Thời gian sai định dạng");
		} catch (ParseException e1) {
			System.out.println(e1.getMessage());
			return null;
		}

		List<ThongKeDichVuDoiTac> list = null;
		String sql = "SELECT dvdt.id ,dv.ten , dv.mota , SUM(dvsd.thanhtien) as tongchiphi ,"
				+ " COUNT(dvsd.id) as tongluotdung\r\n"
				+ "FROM tbldichvu dv\r\n" + "LEFT JOIN tbldichvudoitac dvdt ON dvdt.tblDichvuid = dv.id\r\n"
				+ "LEFT JOIN tbldichvusudung dvsd ON dvsd.tblDichVuDoiTacId = dvdt.id\r\n"
				+ "WHERE dvdt.tblDoitacId = ? AND dvsd.ngaybatdau >= ? AND dvsd.ngaybatdau <= ?\r\n"
				+ "GROUP BY dvdt.tblDichvuid";
		try {

			CallableStatement cs = con.prepareCall(sql);
			cs.setLong(1, idDoiTac);
			cs.setDate(2, new Date(dStart));
			cs.setDate(3, new Date(dFinish));
			ResultSet rs = cs.executeQuery();

			while (rs.next()) {
				if (list == null)
					list = new ArrayList<ThongKeDichVuDoiTac>();
				ThongKeDichVuDoiTac tk = new ThongKeDichVuDoiTac();

				DichVu dv = new DichVu();
				dv.setTen(rs.getString("ten"));
				dv.setMota(rs.getString("mota"));

				tk.setId(rs.getLong("id"));
				tk.setDichvu(dv);
				tk.setTongChiPhi(rs.getFloat("tongchiphi"));
				tk.setTongLuotDung(rs.getLong("tongluotdung"));

				list.add(tk);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		return list;

	}

}
