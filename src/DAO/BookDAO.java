package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DAO.DBConnectionMgr;
import DTO.BookInfoDTO;


public class BookDAO {

	// 책정보 가져오기
	public BookInfoDTO selectBookinfo(BookInfoDTO dto) throws Exception {

		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		String sql = "select * from bookinfo where isbn = " + dto.getIsbn() + " and name like '%" + dto.getName() +"%'";
		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, dto.getIsbn());
//		ps.setString(2, dto.getName());
		
		ResultSet rs = ps.executeQuery();
	
		
		BookInfoDTO dto2 = null;
		
		while (rs.next()) {
			
			dto2 = new BookInfoDTO();
			
			dto2.setIsbn(rs.getString(1));
			dto2.setName(rs.getString(2));
			dto2.setWriter(rs.getString(3));
			dto2.setCompany(rs.getString(4));
			dto2.setPyear(rs.getString(5));
			dto2.setKdc(rs.getString(6));
			dto2.setImg(rs.getString(7));
		}

		rs.close(); ps.close(); con.close();

		return dto2;

	}

}
