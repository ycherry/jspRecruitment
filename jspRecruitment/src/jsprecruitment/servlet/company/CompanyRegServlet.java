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
		request.setCharacterEncoding("utf-8");
		Company company=new Company();
		DataBaseOperation dbo=new DataBaseOperation();
		PrintWriter out=response.getWriter();
		company.setName(request.getParameter("companyName"));
		company.setPassword(request.getParameter("password"));
		System.out.println("企业名称："+company.getName());
		String sql="insert into t_user(userName,userPass,userType) values('"+company.getName()+"','"+company.getPassword()+"','2')";
		String insertToCompanySql="insert into t_company(name) values('"+company.getName()+"')";
		int count=dbo.insert(sql);
		int countCompany=dbo.insert(insertToCompanySql);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(count>0&&countCompany>0){
			System.out.println("注册成功");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('sucess');window.location.href='login.jsp'</script>");
//			response.sendRedirect("login.jsp");
		}else{
			System.out.println("注册失败");
			out.print("fail");
			response.sendRedirect("reg.html");
		}
		
	}

}
