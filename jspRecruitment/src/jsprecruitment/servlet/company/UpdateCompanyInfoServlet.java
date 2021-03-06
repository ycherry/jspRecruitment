package jsprecruitment.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Company;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class updateRegInfoServlet
 */

public class UpdateCompanyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateCompanyInfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Company company = new Company();
		DataBaseOperation dbo = new DataBaseOperation();
		PrintWriter out = response.getWriter();
		Date date = new Date();
		company.setUserName(((Company) request.getSession().getAttribute(
				"company")).getUserName());
		company.setAddress((String) request.getParameter("address"));
		company.setCompanyName((String) request.getParameter("companyName"));
		company.setEmail((String) request.getParameter("email"));
		company.setIndustry((String) request.getParameter("industry"));
		company.setIntroduction((String) request.getParameter("introduction"));
		company.setNature((String) request.getParameter("nature"));
		company.setScale((String) request.getParameter("scale"));
		company.setTelphone((String) request.getParameter("telphone"));
		company.setUpdateTime(new java.sql.Date(date.getTime()));
		String sql = "update t_company set address='" + company.getAddress()
				+ "',companyName='" + company.getCompanyName() + "',email='"
				+ company.getEmail() + "',industry='" + company.getIndustry()
				+ "',introduction='" + company.getIntroduction() + "',nature='"
				+ company.getNature() + "',scale='" + company.getScale()
				+ "',telphone='" + company.getTelphone() + "', updateTime='"
				+ company.getUpdateTime() + "' where userName='"
				+ company.getUserName() + "'";
		System.out.println(sql);
		// int count=dbo.insert(sql);
		int count = dbo.update(sql);
		if (count > 0) {
			System.out.println("修改公司基本成功");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('修改信息成功！');window.location.href='company/updateCompanyinfo.jsp'</script>");
		} else {
			System.out.println("修改公司基本失败");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('修改信息失败！');window.location.href='company/updateCompanyinfo.jsp'</script>");
		}

	}

}
