package signup;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	public void insert(MemberDTO dto) throws Exception {
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
		
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getTel());
		ps.setString(5, dto.getEmail());
		ps.setString(6, dto.getGender());
		ps.setString(7, dto.getAge());
		ps.setString(8, dto.getSubject());
		ps.setString(9, dto.getLibrary());
		
		ps.executeUpdate();
		
		con.close();
		ps.close();
	}
	
	public boolean checkID(MemberDTO dto) throws Exception {
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con = mgr.getConnection();
	
		String sql = "select id from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());

		ResultSet rs = ps.executeQuery();
		boolean exist = rs.next();
		
		con.close();
		ps.close();
		
		return exist;
	}

}
