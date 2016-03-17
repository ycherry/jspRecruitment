/**
 * 
 */
package jsprecruitment.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsprecruitment.entity.Company;
import jsprecruitment.entity.Jobseeker;
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

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String password = request.getParameter("password");
		String username = request.getParameter("user");
		int type = Integer.parseInt(request.getParameter("type"));
		DataBaseOperation data = new DataBaseOperation();
		Jobseeker jobseeker = new Jobseeker();
		Company company = new Company();
		int intT = data.getRowCount("select * from t_user where userName='" + username + "'and userPass='" + password
				+ "' and userType=" + type);
		System.out.println("select * from t_user where userName='" + username + "'and userPass='" + password
				+ "' and userType=" + type);
		System.out.println(intT);
		if (intT > 0) {
			System.out.println("登陆成功");
			HttpSession session = request.getSession();
			switch (type) {
			case 1: {
				
				String selectSql="select * from t_resume where userName='"+username+"'";
				ResultSet rs = data.select(selectSql);
				try {
					jobseeker.setId(rs.getInt(1));
					jobseeker.setUid(rs.getInt(2));
					jobseeker.setUserName(username);
					session.setAttribute("company", company);
					session.setAttribute("jobseeker", jobseeker);
					response.sendRedirect("jobseeker/index.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				break;
			}

				// 登陆用户是求职者
			case 2: {
				
				String selectSql = "select * from t_company where userName='" + username + "'";
				ResultSet rs = data.select(selectSql);
				try {
					company.setId(rs.getString(1));
					company.setUserName(username);
					session.setAttribute("jobseeker", jobseeker);
					session.setAttribute("company", company);
					response.sendRedirect("company/index.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				break;
			}

				// 登陆用户是招聘公司
			case 3:
				response.sendRedirect("admin/index.html");
				break;
			// 登陆用户是管理员
			default:
				response.sendRedirect("../index.jsp");
				break;
			}
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script language=\"javascript\">alert(\"密码或用户名错误，请检查后重新登陆\")</script>");
			response.sendRedirect("index.jsp");
			System.out.println("登陆失败");
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
