package jsprecruitment.servlet.company;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Company;
import jsprecruitment.util.DBConn;
import jsprecruitment.util.DataBaseOperation;
import jsprecruitment.util.Encode;

/**
 * Servlet implementation class SearchPositionServlet
 */

public class SearchPositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchPositionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		DBConn con = new DBConn();
		DataBaseOperation dbo = new DataBaseOperation();
		String companyId = ((Company) request.getSession().getAttribute(
				"company")).getId();
		
		String keyword = null;
		if (request.getParameter("keyword") != null) {
			keyword = "%" + Encode.getNewString(request.getParameter("keyword")) + "%";
		}
		System.out.println(keyword);
		String selectPositionSql = null;
		if(keyword!=null){
			selectPositionSql="SELECT * FROM t_company_job WHERE cid='"
					+ companyId + "' and position like '" + keyword
					+ "' order by id desc";
		}else{
			 selectPositionSql = "SELECT * FROM t_company_job WHERE cid='"
						+ companyId + "'order by id desc";
		}	
		System.out.println("selectPositionSql"+selectPositionSql);
		ResultSet rs = con.getRs(selectPositionSql);
		int count=dbo.getRowCount(selectPositionSql);
		request.setAttribute("PositionResultSet", rs);
		request.setAttribute("positionCount", count);
		ServletContext application = this.getServletContext();
		RequestDispatcher rd = application
				.getRequestDispatcher("/company/allJob.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
