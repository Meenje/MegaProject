package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import DAO.DBConnectionMgr;
import DTO.BestgaDTO;
import DTO.NewbookDTO;

public class NewBookDAO {
	 public ArrayList<NewbookDTO> selectALL(NewbookDTO dto) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					//3) SQL문 객체화
					String sql = "select isbn, name from newbook where lname = ?";//besttotal에서 5개만가져오기
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto.getLname());
					
					System.out.println(dto.getLname()+"도서관");
					ArrayList<NewbookDTO> list = new ArrayList<NewbookDTO>();
					

					//4) SQL문 실행 요청
					ResultSet rs =  ps.executeQuery();
					NewbookDTO dto2 = null;
					while(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto2 =  new NewbookDTO();
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