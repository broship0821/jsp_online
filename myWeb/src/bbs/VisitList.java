package bbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/VisitList")
public class VisitList extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>방명록 리스트!!!</title>");
			out.println("</head>");
			out.println("<body>");
			StringBuffer sql = new StringBuffer();
			sql.append("select NO, WRITER, MEMO, REGDATE ");
			sql.append("from VISIT ");
			sql.append("order by NO desc ");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##onlineJSP", "0821");
				pstmt = con.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int no = rs.getInt("NO");
					String writer = rs.getString("WRITER");
					String memo = rs.getString("MEMO");
					Date regdate = rs.getDate("REGDATE");
					
					out.println("<table align=center width=500 border=1>");
					out.println("<tr>");
					out.println("<th width=50>번호</th>");
					out.println("<td width=50 align=center>" + no + "</td>");
					out.println("<th width=70>작성자</th>");
					out.println("<td width=180 align=center>" + writer + "</td>");
					out.println("<th width=50>날짜</th>");
					out.println("<td width=100 align=center>" + regdate + "</td>");
					out.println("</tr>");
					out.println("<tr>");
					out.println("<th width=50>내용</th>");
					out.println("<td colspan=5>&nbsp;<textarea row=3 cols=50>" + memo + "</textarea></td>");
					out.println("</tr>");
					out.println("</table>");
					out.println("<p>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {if(rs!=null) rs.close();}catch(SQLException e) {}
				try {if(pstmt!=null) pstmt.close();}catch(SQLException e) {}
				try {if(con!=null) con.close();}catch(SQLException e) {}
			}
			
			out.println("<p align=center><a href='/myWeb/bbs/write.html'>글쓰기</a></p>");
			out.println("</body>");
			out.println("</html>");
			
		} finally {
			out.close();
		}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
