package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import DAO.DBConnectionMgr;
import DTO.BestageDTO;
import DTO.BesttotalDTO;
import DTO.BookrankDTO;

public class BestageDAO {
	
	public ArrayList<BestageDTO> select() throws Exception {//바꾸고

			DBConnectionMgr mgr= DBConnectionMgr.getInstance();
			Connection con = mgr.getConnection();
	
			String sql = "select isbn, name from bestage where age = '0_5' order by prank limit 5";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ArrayList<BestageDTO> list = new ArrayList<BestageDTO>();
	
			ResultSet rs =  ps.executeQuery();
			BestageDTO dto2 = null;
			
			while(rs.next()) {
				dto2 =  new BestageDTO();
	
				dto2.setIsbn(rs.getString(1));
				dto2.setName(rs.getString(2));
				list.add(dto2);
			}
			
			rs.close();
			con.close();
			ps.close();
			
			return list;
		
	}
	
	 public ArrayList<BestageDTO> selectALL(BestageDTO dto) throws Exception {//바꾸고

 			DBConnectionMgr mgr= DBConnectionMgr.getInstance();
			Connection con = mgr.getConnection();

			String sql = "select isbn, name from bestage where age = ? order by prank limit 5";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getAge());
			
			ArrayList<BestageDTO> list = new ArrayList<BestageDTO>();

			ResultSet rs =  ps.executeQuery();
			BestageDTO dto2 = null;
			
			while(rs.next()) {
				dto2 =  new BestageDTO();

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