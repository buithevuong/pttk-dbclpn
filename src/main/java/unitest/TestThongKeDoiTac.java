package unitest;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import dao.ThongKeDoiTacDAO;
import model.ThongKeDoiTac;

public class TestThongKeDoiTac {
	ThongKeDoiTacDAO tkDoiTacDao = new ThongKeDoiTacDAO();

	@Test
	public void getTKDoiTac_testChuan1() {
		// Tổng chi lớn hơn 0

		List<ThongKeDoiTac> list = tkDoiTacDao.getTKDoiTac("2021-11-01", "2021-12-01");
		list.forEach(dt -> {
			assertTrue(dt.getTongdoanhthu() > 0);
		});
	}

	@Test
	public void getTKDoiTac_testChuan2() {
		// Mã đối tác giữa các dòng không bị trùng

		List<ThongKeDoiTac> list = tkDoiTacDao.getTKDoiTac("2021-11-01", "2021-12-01");
		List<Long> listId = new ArrayList<Long>();
		list.forEach(s -> listId.add(s.getId()));
		Set<Long> set = new HashSet<>(listId);
		assertEquals(listId.size(), set.size());

	}

	@Test
	public void getTKDoiTac_testChuan3() {
		// Sắp xếp theo tổng chi từ cao đến thấp

		List<ThongKeDoiTac> list = tkDoiTacDao.getTKDoiTac("2021-11-01", "2021-12-01");
		List<ThongKeDoiTac> listExpected = new ArrayList<ThongKeDoiTac>(list);
		Collections.sort(listExpected, new Comparator<ThongKeDoiTac>() {

			@Override
			public int compare(ThongKeDoiTac o1, ThongKeDoiTac o2) {
				// TODO Auto-generated method stub
				Float tongdoanhthu1 = o2.getTongdoanhthu();
				return tongdoanhthu1.compareTo(o1.getTongdoanhthu());
			}
		});

		assertEquals(list, listExpected);
	}
	
	
	@Rule
    public ExpectedException thrown = ExpectedException.none();
	
	@Test
	public void getTKDoiTac_testChuan4() {
		// Ngày bắt đầu sau ngày kết thúc
		
		thrown.expect(InvalidParameterException.class);
		thrown.expectMessage("Thời gian sai định dạng");
		
		List<ThongKeDoiTac> list = tkDoiTacDao.getTKDoiTac("2021-12-01", "2021-11-01");
		
		
		
	}
	
	@Test
	public void getTKDoiTac_testChuan5() {
		// Ngày bắt đầu sau thời gian hiện tại
		
		thrown.expect(InvalidParameterException.class);
		thrown.expectMessage("Thời gian sai định dạng");
		
		List<ThongKeDoiTac> list = tkDoiTacDao.getTKDoiTac("2021-12-30", "2022-01-01");
			
		
	}

}
