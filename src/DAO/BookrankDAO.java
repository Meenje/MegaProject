package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BookrankDTO;
import DAO.DBConnectionMgr;
import DTO.BesttotalDTO;

public class BookrankDAO {
	 public ArrayList<BookrankDTO> selectALL() throws Exception {

		 DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					//3) SQL문 객체화
					String sql = "select isbn, name from bookrank order by prank limit 5";//바꾸고
					PreparedStatement ps = con.prepareStatement(sql);
					ArrayList<BookrankDTO> list = new ArrayList<BookrankDTO>();//바꾸고
					
					System.out.println("3. sql문 객체화 ok..");

					//4) SQL문 실행 요청
					ResultSet rs =  ps.executeQuery();
					BookrankDTO dto2 = null;//바꾸고
					while(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto2 =  new BookrankDTO();//바꾸고
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