package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DAO.DBConnectionMgr;
import DTO.BookInfoDTO;
import DTO.BookrankDTO;
import DTO.NewbookDTO;
import DTO.BestageDTO;
import DTO.BestgaDTO;
import DTO.BestgenderDTO;
import DTO.BestsubjectDTO;
import DTO.BesttotalDTO;

public class BookinfoDAO {
	 public BookInfoDTO select2(BesttotalDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					//3) SQL문 객체화
					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					

					//4) SQL문 실행 요청
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					
					rs.close();
					con.close();
					ps.close();
					
					return dto3;
					
				
		}
	 
	 public BookInfoDTO select2(BookrankDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					//3) SQL문 객체화
					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					

					//4) SQL문 실행 요청
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					rs.close();
					con.close();
					ps.close();
					
					
					return dto3;
					
				
		}
	 
	 public BookInfoDTO select2(BestageDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					//3) SQL문 객체화
					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					
					
					return dto3;
					
				
		}
	 
	 public BookInfoDTO select2(BestgenderDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					

					//4) SQL문 실행 요청
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					rs.close();
					con.close();
					ps.close();
					
					
					return dto3;
				
		}
	 
	 public BookInfoDTO select2(BestsubjectDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();

					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					

					//4) SQL문 실행 요청
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					rs.close();
					con.close();
					ps.close();
					
					
					return dto3;
				
		}
	 
	 public BookInfoDTO select2(BestgaDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();
					//3) SQL문 객체화
					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					

					//4) SQL문 실행 요청
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					rs.close();
					con.close();
					ps.close();
					
					return dto3;
				
		}
	 
	 public BookInfoDTO select2(NewbookDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();
					//3) SQL문 객체화
					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					

					//4) SQL문 실행 요청
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					rs.close();
					con.close();
					ps.close();
					
					return dto3;
				
		}
	 
	 public BookInfoDTO select3(BestgaDTO dto2) throws Exception {
			//2. db처리
					DBConnectionMgr mgr= DBConnectionMgr.getInstance();
					Connection con = mgr.getConnection();
					//3) SQL문 객체화
					String sql = "select name, isbn, img from bookinfo where isbn = ?";
					
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, dto2.getIsbn());
					
					

					//4) SQL문 실행 요청
					
					ResultSet rs =  ps.executeQuery();
					BookInfoDTO dto3 = null;
					if(rs.next()) {//ORM DTO와 RDB의 항목이 같이야 한다.
						dto3 =  new BookInfoDTO();
						//orm(object: 자바,  rdb:table 항목 mappping
						dto3.setName(rs.getString(1));
						dto3.setIsbn(rs.getString(2));
						dto3.setImg(rs.getString(3));
						
					}
					
					rs.close();
					con.close();
					ps.close();
					
					return dto3;
					
				
		}
}