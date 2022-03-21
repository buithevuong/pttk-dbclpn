package unitest;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.junit.Test;

import dao.DichVuSuDungDAO;
import dao.ThongKeDichVuDoiTacDAO;
import model.DichVuSuDung;
import model.ThongKeDichVuDoiTac;

public class TestDichVuSuDung {
	DichVuSuDungDAO dvsdDAO = new DichVuSuDungDAO();

	ThongKeDichVuDoiTacDAO tkDVDTdao = new ThongKeDichVuDoiTacDAO();

	// Tổng thành tiền các hóa đơn dịch vụ sử dụng bằng tổng chi phí của dịch vụ
	@Test
	public void getTKDichVu_testChuan1() {
		String start = "2021-11-20";
		String finish = "2021-12-20";
		List<ThongKeDichVuDoiTac> list = tkDVDTdao.getThongKeDichVuDoiTac(1L, start, finish);
		
		list.forEach(tkdvdt -> {
			List<DichVuSuDung> list2 = dvsdDAO.getDSDichVuSuDung(tkdvdt.getId(), start, finish);
			Float tongchi = (float) list2.stream().mapToDouble(DichVuSuDung::getThanhtien).sum();
			Float tongchi2 = tkdvdt.getTongChiPhi();
			assertEquals(tongchi2, tongchi);
		});

	}

	// Số lượng dịch vụ sử dụng bằng số lươt dùng
	@Test
	public void getTKDichVu_testChuan2() {
		String start = "2021-11-20";
		String finish = "2021-12-20";
		List<ThongKeDichVuDoiTac> list = tkDVDTdao.getThongKeDichVuDoiTac(1L, start, finish);
		list.forEach(tkdvdt -> {
			List<DichVuSuDung> list2 = dvsdDAO.getDSDichVuSuDung(tkdvdt.getId(), start, finish);

			Long tongluotdung = tkdvdt.getTongLuotDung();
			Long tongluotdung2 = (long) list2.size();
			assertEquals(tongluotdung, tongluotdung2);
		});

	}

	// Sắp xếp từ cũ đến mới
	@Test
	public void getTKDichVu_testChuan3() {
		String start = "2021-11-20";
		String finish = "2021-12-20";

		List<DichVuSuDung> list = dvsdDAO.getDSDichVuSuDung(1L, start, finish);
		List<DichVuSuDung> listExpected = new ArrayList<>(list);
		Collections.sort(listExpected , new Comparator<DichVuSuDung>() {

			@Override
			public int compare(DichVuSuDung o1, DichVuSuDung o2) {
				
				return o1.getNgaybatdau().compareTo(o2.getNgaybatdau());
			}
		});
		
		assertEquals(list, listExpected);

	}

	// Đơn giá <= thành tiền
	// Đơn giá > 0
	// Thành tiền > 0

	@Test
	public void getTKDichVu_testChuan4() {
		String start = "2021-11-20";
		String finish = "2021-12-20";

		List<DichVuSuDung> list = dvsdDAO.getDSDichVuSuDung(1L, start, finish);
		
		list.forEach(s -> {
			assertTrue(s.getDongia() <= s.getThanhtien());
			assertTrue(s.getDongia() > 0);
			assertTrue(s.getThanhtien() > 0);
		});
	}

	// Ngày sử dụng trong khoảng thời gian thống kê
	@Test
	public void getTKDichVu_testChuan5() {
		String start = "2021-11-20";
		String finish = "2021-12-20";

		List<DichVuSuDung> list = dvsdDAO.getDSDichVuSuDung(1L, start, finish);
		
		list.forEach(s -> {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			long lStart;
			try {
				lStart = sdf.parse(start).getTime();
				long lFinish = sdf.parse(finish).getTime();
				long ngaysudung = s.getNgaybatdau().getTime();
				assertTrue(lStart <= ngaysudung && ngaysudung <= lFinish);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		});
	}
}
