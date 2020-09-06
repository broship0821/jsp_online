package sample;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class MyServlet extends HttpServlet{
   public void doGet(HttpServletRequest request, HttpServletResponse response) 
                                 throws IOException, ServletException{
      response.setContentType("text/html;charset=euc-kr");
      PrintWriter out = response.getWriter();
         out.println("<html><head><title>My First Servlet</title></head>");
         out.println("<body><h1>My First Servlet File</h1><br/><hr/><center>");
         out.println("<font size='5'>지금은 ");
         out.println(new java.util.Date());
         out.println(" 입니다</font></body></html>");
      out.close();
   }
}