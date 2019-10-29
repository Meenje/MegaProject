package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import DAO.DBConnectionMgr;
import DTO.BestageDTO;
import DTO.BestgaDTO;
import DTO.BesttotalDTO;
import DTO.BookrankDTO;

public class BestgaDAO {
	
	public ArrayList<BestgaDTO> selectALL(BestgaDTO dto) throws Exception {//바꾸고
		//2. db처리
				DBConnectionMgr mgr= DBConnectionMgr.getInstance();
				Connection con = mgr.getConnection();

				//3) SQL문 객체화
				String sql = "select isbn, name from bestga where gender = ? and age = ? order by prank";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getGender());
				ps.setString(2, dto.getAge());

				ArrayList<BestgaDTO> list = new ArrayList<BestgaDTO>();

				//4) SQL문 실행 요청
				ResultSet rs =  ps.executeQuery();
				BestgaDTO dto2 = null;
				
				while(rs.next()) {
					dto2 =  new BestgaDTO();
					dto2.setIsbn(rs.getString(1));
					dto2.setName(rs.getString(2));
					list.add(dto2);
				}
				
				rs.close();
				con.close();
				ps.close();
				return list;
			
	}
	
	/*
	 * public ArrayList<BestgaDTO> selectALL(BestgaDTO dto) throws Exception {//바꾸고
	 * //2. db처리 DBConnectionMgr mgr= DBConnectionMgr.getInstance(); Connection con
	 * = mgr.getConnection(); System.out.println("2. db연결 ok..");
	 * 
	 * //3) SQL문 객체화 String sql =
	 * "select isbn, name from bestage where age = ? order by prank limit 5";
	 * PreparedStatement ps = con.prepareStatement(sql); ps.setString(1,
	 * dto.getAge());
	 * 
	 * System.out.println("3. sql문 객체화 ok..");
	 * 
	 * ArrayList<BestgaDTO> list = new ArrayList<BestgaDTO>();
	 * 
	 * //4) SQL문 실행 요청 ResultSet rs = ps.executeQuery();
	 * System.out.println("4. SQL문 실행 요청 ok.."); BestgaDTO dto2 = null;
	 * 
	 * while(rs.next()) { dto2 = new BestgaDTO();
	 * 
	 * dto2.setIsbn(rs.getString(1)); dto2.setName(rs.getString(2)); list.add(dto2);
	 * }
	 * 
	 * return list;
	 * 
	 * }
	 */
}