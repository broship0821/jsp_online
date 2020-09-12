package memberone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StudentDAO {
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myOracle");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			System.out.println("Connection 생성 실패!!");
		}
		
		return conn;
		
	}
	
	public boolean idCheck(String id) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			
			pstmt = conn.prepareStatement("select * from STUDENT where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) result = false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn!=null) try {conn.close();}catch(SQLException sqle3) {}
		}
		
		return result;
		
	}
	
	public Vector<ZipCodeVO> zipcodeRead(String dong){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<>();
		
		try {
			conn = getConnection();
			String sql = "select * from zipcode where dong like '" + dong + "%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipCodeVO tempZipcode = new ZipCodeVO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setSido(rs.getString("sido"));
				tempZipcode.setGugun(rs.getString("gugun"));
				tempZipcode.setDong(rs.getString("dong"));
				tempZipcode.setRi(rs.getString("ri"));
				tempZipcode.setBunji(rs.getString("bunji"));
				vecList.addElement(tempZipcode);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn!=null) try {conn.close();}catch(SQLException sqle3) {}
		}
		
		return vecList;
		
	}
	
}
