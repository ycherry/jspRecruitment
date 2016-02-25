package jsprecruitment.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Company;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class companyRegServlet
 */

public class CompanyRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyRegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Company company=new Company();
		DataBaseOperation dbo=new DataBaseOperation();
		PrintWriter out=response.getWriter();
		company.setName(request.getParameter("companyName"));
		company.setPassword(request.getParameter("password"));
		String sql="insert into t_user(userName,userPass,userType) values('"+company.getName()+"','"+company.getPassword()+"','2')";
		int count=dbo.insert(sql);
		if(count>0){
			System.out.println("注册成功");
			out.println("注册成功，请登录完善信息");
			response.sendRedirect("login.jsp");
		}else{
			System.out.println("注册失败");
			out.print("注册失败，请重新注册");
			response.sendRedirect("reg.html");
		}
		
	}

}
