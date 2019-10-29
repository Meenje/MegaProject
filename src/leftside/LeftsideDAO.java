package leftside;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import search.SearchDTO;
import signup.DBConnectionMgr;

public class LeftsideDAO {
	public SearchDTO gangnam() throws Exception {
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String rand = "select * from newbook where lname = '강남' order by rand() limit 1";
		PreparedStatement ps1 = con.prepareStatement(rand);
		ResultSet rm = ps1.executeQuery();

		String sql = "select * from bookinfo where isbn = ? and name = ?";
		PreparedStatement ps2 = con.prepareStatement(sql);
		if(rm.next()) {
		ps2.setString(1, rm.getString(1));
		ps2.setString(2, rm.getString(2));
		}
		ResultSet rs = ps2.executeQuery();	
		SearchDTO resultDTO = new SearchDTO();
		
		if(rs.next()) {
			resultDTO.setIsbn(rs.getString(1));
			resultDTO.setName(rs.getString(2));
			resultDTO.setWriter(rs.getString(3));
			resultDTO.setCompany(rs.getString(4));
			resultDTO.setPyear(rs.getString(5));
			resultDTO.setKdc(rs.getString(6));
			resultDTO.setImg(rs.getString(7));
		}
		con.close();
		ps1.close();
		ps2.close();

		return resultDTO;
	}
	
	public SearchDTO gaepo() throws Exception {
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();

		String rand = "select * from newbook where lname = '개포' order by rand() limit 1";
		PreparedStatement ps1 = con.prepareStatement(rand);
		ResultSet rm = ps1.executeQuery();

		String sql = "select * from bookinfo where isbn = ? and name = ?";
		PreparedStatement ps2 = con.prepareStatement(sql);
		if(rm.next()) {
		ps2.setString(1, rm.getString(1));
		ps2.setString(2, rm.getString(2));
		}
		ResultSet rs = ps2.executeQuery();	
		SearchDTO resultDTO = new SearchDTO();
		
		if(rs.next()) {
			resultDTO.setIsbn(rs.getString(1));
			resultDTO.setName(rs.getString(2));
			resultDTO.setWriter(rs.getString(3));
			resultDTO.setCompany(rs.getString(4));
			resultDTO.setPyear(rs.getString(5));
			resultDTO.setKdc(rs.getString(6));
			resultDTO.setImg(rs.getString(7));
		}
		con.close();
		ps1.close();
		ps2.close();

		return resultDTO;
	}
}
