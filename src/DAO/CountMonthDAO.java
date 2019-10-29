package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.DBConnectionMgr;
import DTO.BookInfoDTO;
import DTO.CountmonthDTO;


public class CountMonthDAO {

	// 책정보에 해당하는 대출건수 가져오기
	public CountmonthDTO selectcount(BookInfoDTO dto2) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		String sql = "select * from countmonth where isbn = " + dto2.getIsbn() + " and name like '%" + dto2.getName() +"%'";
		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, dto2.getIsbn());
//		ps.setString(2, dto2.getName());
		
		
		ResultSet rs = ps.executeQuery();
		
		
		CountmonthDTO dto3 = null;
		
		while (rs.next()) {
			System.out.println("!!!!!!!!!!!!!!!!!!!");
			dto3 = new CountmonthDTO();
			
			dto3.setIsbn(rs.getString(1));
			dto3.setName(rs.getString(2));
			dto3.setM09(rs.getInt(3));
			dto3.setM10(rs.getInt(4));
			dto3.setM11(rs.getInt(5));
			dto3.setM12(rs.getInt(6));
			dto3.setM01(rs.getInt(7));
			dto3.setM02(rs.getInt(8));
			dto3.setM03(rs.getInt(9));
			dto3.setM04(rs.getInt(10));
			dto3.setM05(rs.getInt(11));
			dto3.setM06(rs.getInt(12));
			dto3.setM07(rs.getInt(13));
			dto3.setM08(rs.getInt(14));
		
		}

		rs.close(); ps.close(); con.close();

		return dto3;

	}

}
