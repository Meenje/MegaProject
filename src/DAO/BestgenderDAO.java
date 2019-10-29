package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import DAO.DBConnectionMgr;
import DTO.BestageDTO;
import DTO.BestgenderDTO;
import DTO.BesttotalDTO;
import DTO.BookrankDTO;

public class BestgenderDAO {
	
	public ArrayList<BestgenderDTO> select() throws Exception {
		
			DBConnectionMgr mgr= DBConnectionMgr.getInstance();
			Connection con = mgr.getConnection();

			String sql = "select isbn, name from bestgender where gender = 'male' order by prank";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ArrayList<BestgenderDTO> list = new ArrayList<BestgenderDTO>();

			ResultSet rs =  ps.executeQuery();
			BestgenderDTO dto2 = null;
			
			while(rs.next()) {
				dto2 =  new BestgenderDTO();

				dto2.setIsbn(rs.getString(1));
				dto2.setName(rs.getString(2));
				list.add(dto2);
			}
			
			rs.close();
			con.close();
			ps.close();
			
			return list;
			
	}
	
	 public ArrayList<BestgenderDTO> selectALL(BestgenderDTO dto) throws Exception {

 			DBConnectionMgr mgr= DBConnectionMgr.getInstance();
			Connection con = mgr.getConnection();

			String sql = "select isbn, name from bestgender where gender = ? order by prank limit 5";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getGender());
			
			ArrayList<BestgenderDTO> list = new ArrayList<BestgenderDTO>();

			ResultSet rs =  ps.executeQuery();
			BestgenderDTO dto2 = null;
			
			while(rs.next()) {
				dto2 =  new BestgenderDTO();

				dto2.setIsbn(rs.getString(1));
				dto2.setName(rs.getString(2));
				list.add(dto2);
			}
			
			rs.close();
			con.close();
			ps.close();
			
			return list;
				
		}
}