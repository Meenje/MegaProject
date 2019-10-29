package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import DAO.DBConnectionMgr;
import DTO.BesttotalDTO;

public class BesttotalDAO {
	 public ArrayList<BesttotalDTO> selectALL() throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					//3) SQL문 객체화
					String sql = "select isbn, name from besttotal order by prank limit 5";//besttotal에서 5개만가져오기
					PreparedStatement ps = con.prepareStatement(sql);
					ArrayList<BesttotalDTO> list = new ArrayList<BesttotalDTO>();
					

					//4) SQL문 실행 요청
					ResultSet rs =  ps.executeQuery();
					BesttotalDTO dto2 = null;
					while(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto2 =  new BesttotalDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
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