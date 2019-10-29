package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.DBConnectionMgr;
import DTO.BookInfoDTO;
import DTO.BookpossessionDTO;


public class BookPossessionDAO {

	// 책정보 가져오기
	public BookpossessionDTO selectlibrary(BookInfoDTO dto2) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		String sql = "select * from bookpossession where isbn = " + dto2.getIsbn() + " and name like '%" + dto2.getName() +"%'";
		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, dto2.getIsbn());
//		ps.setString(2, dto2.getName());
		
		ResultSet rs = ps.executeQuery();
		
		
		BookpossessionDTO dto3 = null;
		
		while (rs.next()) {
			
			dto3 = new BookpossessionDTO();
			
			dto3.setIsbn(rs.getString(1));
			dto3.setName(rs.getString(2));
			dto3.setDogog(rs.getInt(3));
			dto3.setDaechi(rs.getInt(4));
			dto3.setMosgol(rs.getInt(5));
			dto3.setHanog(rs.getInt(6));
			dto3.setYeogsam(rs.getInt(7));
			dto3.setPuleunsol(rs.getInt(8));
			dto3.setJeongdaun(rs.getInt(9));
			dto3.setJeulgeoun(rs.getInt(10));
			dto3.setCheongdam(rs.getInt(11));
			dto3.setHaengboghan(rs.getInt(12));
			dto3.setGangnam(rs.getInt(13));
			dto3.setGaepo(rs.getInt(14));
			
		}

		
		rs.close(); ps.close(); con.close();

		return dto3;

	}

}
