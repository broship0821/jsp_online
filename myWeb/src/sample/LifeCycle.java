package sample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LifeCycle")
public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LifeCycle() {
    	System.out.println("LifeCycle ������ ȣ���մϴ�~");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		System.out.println("service()ȣ���");
	}

	@Override
	public void destroy() {
		System.out.println("destroy()ȣ�� ������ �̰� �Ⱥ�����");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("init()ȣ���");
	}


}
