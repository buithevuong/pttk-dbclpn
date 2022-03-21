package unitest;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;

import dao.ThongKeDichVuDoiTacDAO;
import dao.ThongKeDoiTacDAO;
import model.ThongKeDichVuDoiTac;
import model.ThongKeDoiTac;

public class TestThongKeDichVuDoiTac {
	ThongKeDoiTacDAO tkDoiTacDao = new ThongKeDoiTacDAO();

	ThongKeDichVuDoiTacDAO tkDVDTdao = new ThongKeDichVuDoiTacDAO();

	// Tổng chi phí các dịch vụ cộng lại bằng tổng chi của đối tác
	@Test
	public void getTKDichVu_testChuan1() {
		String start = "2021-11-20";
		String finish = "2021-12-20";
		List<ThongKeDoiTac> list = tkDoiTacDao.getTKDoiTac(start, finish);
		list.forEach(tkdt -> {
			List<ThongKeDichVuDoiTac> list2 = tkDVDTdao.getThongKeDichVuDoiTac(tkdt.getId(), start, finish);
			Float tongchi = (float) list2.stream().mapToDouble(ThongKeDichVuDoiTac::getTongChiPhi).sum();
			Float tongchi2 = tkdt.getTongdoanhthu();
			assertEquals(tongchi2, tongchi);
		});

	}

	//Tổng chi phí các dịch vụ đều lớn hơn 0
	@Test
	public void getTKDichVu_testChuan2() {
		String start = "2021-11-20";
		String finish = "2021-12-20";

		List<ThongKeDichVuDoiTac> list = tkDVDTdao.getThongKeDichVuDoiTac(1L, start, finish);
		list.forEach(s -> {
			assertTrue(s.getTongChiPhi() > 0);
		});
	}

	// Tổng lượt dùng các dịch vụ đều lớn hơn 0
	@Test
	public void getTKDichVu_testChuan3() {
		
		String start = "2021-11-20";
		String finish = "2021-12-20";

		List<ThongKeDichVuDoiTac> list = tkDVDTdao.getThongKeDichVuDoiTac(1L, start, finish);
		list.forEach(s -> {
			assertTrue(s.getTongLuotDung() > 0);
		});
	}

	//Mã các dịch vụ tại các dòng đều khác nhau
	@Test
	public void getTKDichVu_testChuan4() {
		String start = "2021-11-20";
		String finish = "2021-12-20";
		
		List<ThongKeDichVuDoiTac> list = tkDVDTdao.getThongKeDichVuDoiTac(1L ,start, finish);
		List<Long> listId = new ArrayList<Long>();
		list.forEach(s -> listId.add(s.getId()));
		Set<Long> set = new HashSet<>(listId);
		assertEquals(listId.size(), set.size());

	}
	
//	//Thời gian thống kê dịch vụ khớp với thời gian thống kê đối tác
//	@Test
//	public void getTKDichVu_testChuan5() {
//		String start = "2021-11-20";
//		String finish = "2021-12-20";
//		List<ThongKeDoiTac> list = tkDoiTacDao.getTKDoiTac(start, finish);
//		List<ThongKeDichVuDoiTac> list = tkDVDTdao.getThongKeDichVuDoiTac(1L ,start, finish);
//
//	}
}
