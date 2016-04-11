package jsprecruitment.servlet.company;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Company;
import jsprecruitment.util.DBConn;

/**
 * Servlet implementation class ReceivedResumeServlet
 */
public class ReceivedResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceivedResumeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DBConn dbc = new DBConn();
		Company company = (Company) request.getSession().getAttribute("company");
		String companyId = company.getId();
		String selectSql = null;
		ResultSet rs = null;
		String jobId = request.getParameter("jobId");
		String jobName = "";
		System.out.println("jobId:" + jobId);
		if (jobId.equals("0")) {
			// 去重查找
			// selectSql = "select *, count(distinct t_resume.id) from
			// t_resume,t_job_apply where t_resume.id=t_job_apply.resumeId and
			// companyId="
			// + companyId+" group by t_resume.id";
			selectSql = "select * from t_resume,t_job_apply where t_resume.id=t_job_apply.resumeId and companyId="
					+ companyId+" order by applyTime desc";
			rs = dbc.getRs(selectSql);
			jobName = "全部职位";
		} else {
			selectSql = "select * from t_resume,t_job_apply where t_resume.id = t_job_apply.resumeId and t_job_apply.jobId='"
					+ jobId + "'";
			String selectNameSql = "select position from t_company_job where id='" + jobId + "'";
			rs = dbc.getRs(selectSql);
			ResultSet resultset = dbc.getRs(selectNameSql);
			try {
				if (resultset.next()) {
					jobName = resultset.getString(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println("selectSql1:" + selectSql);
		request.setAttribute("resultSet", rs);
		request.setAttribute("jobName", jobName);
		request.setAttribute("jobId", jobId);
		System.out.println("jobName:" + jobName);
		System.out.println("jobName:" + request.getAttribute("jobName"));
		ServletContext application = this.getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher("/company/ReceivedResume.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
