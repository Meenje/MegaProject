package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import DAO.DBConnectionMgr;
import DTO.BestageDTO;
import DTO.BestgenderDTO;
import DTO.BestsubjectDTO;
import DTO.BesttotalDTO;
import DTO.BookrankDTO;

public class BestsubjectDAO {
	
	public ArrayList<BestsubjectDTO> select() throws Exception {//바꾸고
		//2. db처리
				DBConnectionMgr mgr= DBConnectionMgr.getInstance();
				Connection con = mgr.getConnection();

				//3) SQL문 객체화
				String sql = "select isbn, name from bestsubject where subject = 'General' order by prank limit 5";
				PreparedStatement ps = con.prepareStatement(sql);
				
				ArrayList<BestsubjectDTO> list = new ArrayList<BestsubjectDTO>();

				//4) SQL문 실행 요청
				ResultSet rs =  ps.executeQuery();
				BestsubjectDTO dto2 = null;
				
				while(rs.next()) {
					dto2 =  new BestsubjectDTO();

					dto2.setIsbn(rs.getString(1));
					dto2.setName(rs.getString(2));
					list.add(dto2);
				}
				
				rs.close();
				con.close();
				ps.close();
				
				return list;
			
	}
	
	 public ArrayList<BestgenderDTO> selectALL(BestgenderDTO dto) throws Exception {//바꾸고
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					//3) SQL문 객체화
					String sql = "select isbn, name from bestgender where subject = ? order by prank limit 5";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto.getGender());
					
					ArrayList<BestgenderDTO> list = new ArrayList<BestgenderDTO>();

					//4) SQL문 실행 요청
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