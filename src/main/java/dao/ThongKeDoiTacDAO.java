package dao;

import java.security.InvalidParameterException;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.ThongKeDoiTac;

public class ThongKeDoiTacDAO extends DAO {

	public ThongKeDoiTacDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<ThongKeDoiTac> getTKDoiTac(String start, String finish) {
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

		List<ThongKeDoiTac> list = null;
		String sql = "SELECT dt.* , SUM(dvsd.thanhtien) as thanhtien FROM tbldoitac dt\r\n"
				+ "LEFT JOIN tbldichvudoitac dvdt ON dt.id = dvdt.tblDoitacId\r\n"
				+ "LEFT JOIN tbldichvusudung dvsd ON dvsd.tblDichvudoitacId = dvdt.id\r\n"
				+ "WHERE dvsd.ngaybatdau >= ? AND dvsd.ngaybatdau <= ?\r\n" + "GROUP BY dt.Id\r\n"
				+ "ORDER By thanhtien DESC";
		try {

			CallableStatement cs = con.prepareCall(sql);
			cs.setDate(1, new Date(dStart));
			cs.setDate(2, new Date(dFinish));
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				if (list == null)
					list = new ArrayList<ThongKeDoiTac>();
				ThongKeDoiTac tkDoiTac = new ThongKeDoiTac();
				// set dt
				tkDoiTac.setId(rs.getLong("Id"));
				tkDoiTac.setTen(rs.getString("ten"));
				tkDoiTac.setEmail(rs.getString("email"));
				tkDoiTac.setSodienthoai(rs.getString("sodienthoai"));
				tkDoiTac.setTongdoanhthu(rs.getFloat("thanhtien"));
				list.add(tkDoiTac);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		return list;

	}
}
