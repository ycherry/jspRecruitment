/**
 * 
 */
package jsprecruitment.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsprecruitment.util.DataBaseOperation;

/**
 * @author Administrator
 * 
 */
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	public LoginServlet() {
		// TODO Auto-generated constructor stub
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		String username = request.getParameter("user");
		int type = Integer.parseInt(request.getParameter("type"));
		DataBaseOperation data = new DataBaseOperation();
		int intT = data.getRowCount("t_user where username='" + username
				+ "'and userPass='" + password + "' and userType=" + type);
		System.out.println("t_user where username='" + username
				+ "'and userPass='" + password + "' and userType=" + type);
		System.out.println(intT);
		if (intT > 0) {
			System.out.println("登陆成功");
			  HttpSession session=request.getSession();
			  session.setAttribute("usercode", username);
			  session.setAttribute("userType", new Integer(type));
			  session.setAttribute("flag", "true");
			 
			 switch (type) {
			 case 1:
			 response.sendRedirect("jobseeker/index.html");
			 break;
			 //登陆用户是求职者
			 case 2:
			 response.sendRedirect("company/index.html");
			 break;
			 //登陆用户是招聘公司
			 case 3:
			 response.sendRedirect("admin/index.html");
			 break;
			 //登陆用户是管理员
			 default:
			 response.sendRedirect("../index.jsp");
			 break;
			 }
		} else {
			PrintWriter out=response.getWriter();
			out.print("<script language=\"javascript\">alert(\"密码或用户名错误，请检查后重新登陆\")</script>");
			response.sendRedirect("index.jsp");
			System.out.println("登陆失败");
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
