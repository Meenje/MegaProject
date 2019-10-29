package bookontherun;

import java.sql.*;
import java.util.ArrayList;

import signup.DBConnectionMgr;

public class BookontherunDAO {
	public ArrayList<BookontherunDTO> select(BookontherunDTO dto) throws Exception {
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String sql = "select * from bestgas where gender = ? and age = ? and subject = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getGender());
		ps.setString(2, dto.getAge());
		ps.setString(3, dto.getSubject());

		ResultSet rs = ps.executeQuery();
		
		BookontherunDTO resultDTO = null;
		ArrayList<BookontherunDTO> booklist = new ArrayList();

		
			while(rs.next()) {
				resultDTO = new BookontherunDTO();
				resultDTO.setPrank(rs.getInt(1));
				resultDTO.setIsbn(rs.getString(2));
				resultDTO.setName(rs.getString(3));
				resultDTO.setGender(rs.getString(4));
				resultDTO.setAge(rs.getString(5));
				resultDTO.setSubject(rs.getString(6));
				booklist.add(resultDTO);
			}
		con.close();
		ps.close();

		return booklist;
	}
}
