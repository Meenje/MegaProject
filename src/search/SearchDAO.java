package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import signup.DBConnectionMgr;

public class SearchDAO {
		public SearchDTO searchBook(SearchDTO dto) throws Exception {
			DBConnectionMgr mgr = DBConnectionMgr.getInstance();
			Connection con = mgr.getConnection();

			String sql = "select * from bookinfo where isbn = ? and name = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getIsbn());
			ps.setString(2, dto.getName());

			ResultSet rs = ps.executeQuery();
			
			SearchDTO resultDTO = null;
			if(rs.next()) {
				resultDTO = new SearchDTO();
				resultDTO.setIsbn(rs.getString(1));
				resultDTO.setName(rs.getString(2));
				resultDTO.setWriter(rs.getString(3));
				resultDTO.setCompany(rs.getString(4));
				resultDTO.setPyear(rs.getString(5));
				resultDTO.setKdc(rs.getString(6));
				resultDTO.setImg(rs.getString(7));
			}
			con.close();
			ps.close();

			return resultDTO;
		}
		
		public ArrayList<SearchDTO> search(String bname) throws Exception {
			DBConnectionMgr mgr = DBConnectionMgr.getInstance();
			Connection con = mgr.getConnection();

			String sql = "select * from bookinfo where name like ?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, "%" + bname + "%");

			ResultSet rs = ps.executeQuery();
			
			SearchDTO resultDTO = null;
			ArrayList<SearchDTO> list = new ArrayList();
			while(rs.next()) {
				resultDTO = new SearchDTO();
				resultDTO.setIsbn(rs.getString(1));
				resultDTO.setName(rs.getString(2));
				resultDTO.setWriter(rs.getString(3));
				resultDTO.setCompany(rs.getString(4));
				resultDTO.setPyear(rs.getString(5));
				resultDTO.setKdc(rs.getString(6));
				resultDTO.setImg(rs.getString(7));
				list.add(resultDTO);
			}
			con.close();
			ps.close();

			return list;
		}
}
