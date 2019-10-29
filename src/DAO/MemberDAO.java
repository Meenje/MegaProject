package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DTO.MemberDTO;

public class MemberDAO {
	
	// 로그인 
	public MemberDTO login(MemberDTO dto) throws Exception {

 		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
 		Connection con = mgr.getConnection();
 		
 		String sql = "select * from member where id = ?";
 		PreparedStatement ps = con.prepareStatement(sql);
 		ps.setString(1, dto.getId());
 		
 		System.out.println(dto.getId() + "id");
 		
 		ResultSet rs = ps.executeQuery();

 		MemberDTO dto2 = null; 
 		
 		while (rs.next()) {
			dto2 = new MemberDTO();
			System.out.println("!!!!!!!!!!!!!!");
			dto2.setId(rs.getString(1));
			dto2.setPw(rs.getString(2));
			dto2.setName(rs.getString(3)); 
			dto2.setTel(rs.getString(4));
			dto2.setEmail(rs.getString(5)); 
			dto2.setGender(rs.getString(6));
			dto2.setBirth(rs.getString(7)); 
			dto2.setSubject(rs.getString(8));
			dto2.setLibrary(rs.getString(9));
		 
 		}
 		
 	
		rs.close(); ps.close(); con.close();
	
		return dto2;

	}
	
	// 회원정보  수정
	public int userupdate(MemberDTO dto2) throws Exception {

 		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
 		Connection con = mgr.getConnection();
		
 		String sql = "select pw from member where id = ?";
 		PreparedStatement ps = con.prepareStatement(sql);
 		ps.setString(1, dto2.getId());
 		
 		ResultSet rs = ps.executeQuery();
 		
 		int check = 0;
 		
 		if (rs.next()) {
 			if(dto2.getPw().equals(rs.getString("pw"))) {
 				ps.close();
 				
 				ps = null;
 				
 				sql = "update members set pw=?, name=?, tel=?, email=?, gender=?, age=?, subject = ?, library = ? where id=?";
 				
 				ps = con.prepareStatement(sql);
 				
 				ps.setString(1, dto2.getPw());
 				ps.setString(2, dto2.getName());
 				ps.setString(3, dto2.getTel());
 				ps.setString(4, dto2.getEmail());
 				ps.setString(5, dto2.getGender());
 				ps.setString(6, dto2.getBirth());
 				ps.setString(7, dto2.getSubject());
 				ps.setString(8, dto2.getLibrary());
 				ps.setString(9, dto2.getId());
 				
 				ps.executeUpdate();
 				
 				check = 1;
 				
 			} else {
 				
 				check = 0; // 패스워드 일치하지 않음
 			
 			}
 		}
		
		System.out.println("!!!!!!!!!!!!!!!!!!!" + check);

		
		ps.close(); 
		con.close();

		return check;
	}
	
	
}
