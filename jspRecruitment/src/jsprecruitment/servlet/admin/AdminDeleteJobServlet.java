package jsprecruitment.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.util.DBConn;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class AdminDeleteJobServlet
 */
public class AdminDeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteJobServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("已调用");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DataBaseOperation dbo = new DataBaseOperation();
		DBConn dbc = new DBConn();
		PrintWriter out = response.getWriter();
		String jobId = request.getParameter("jobId");
		System.out.println("DeleteJobseekerServlet resumeId:" + jobId);
		// 删除用户信息包括：jobinterview，jobapply，resume，user
		Boolean jobInterviewFlag = false;
		Boolean jobApplyFlag = false;
		Boolean companyJobFlag = false;
		String selectJobinterviewSql = "select count(*) from t_company_interview where jobId="
				+ jobId;
		String selectJobApplySql = "select count(*) from t_job_apply where jobId="
				+ jobId;
		String selectCompanyJobSql = "select count(*) from t_company_job where id="
				+ jobId;
		if (dbo.getRowCount(selectJobinterviewSql) > 0) {
			String deleteJobinterviewSql = "delete from t_company_interview where jobId="
					+ jobId;
			if (dbo.delete(deleteJobinterviewSql) > 0) {
				jobInterviewFlag = true;
			} else {
				jobInterviewFlag = false;
			}

		} else {
			jobInterviewFlag = true;
		}

		if (dbo.getRowCount(selectJobApplySql) > 0) {
			String deleteJobApplySql = "delete from t_job_apply where jobId="
					+ jobId;
			if (dbo.delete(selectJobApplySql) > 0) {
				jobApplyFlag = true;
			} else {
				jobApplyFlag = false;
			}
		} else {
			jobApplyFlag = true;
		}

		if (dbo.getRowCount(selectCompanyJobSql) > 0) {
			String deleteCompanyJobSql = "delete from t_company_job where id="
					+ jobId;
			if (dbo.delete(deleteCompanyJobSql) > 0) {
				companyJobFlag = true;
			} else {
				companyJobFlag = false;
			}
		} else {
			companyJobFlag = true;
		}

		System.out.println("jobInterviewFlag:" + jobInterviewFlag
				+ " jobApplyFlag:" + jobApplyFlag + " companyJobFlag:"
				+ companyJobFlag);
		if (jobInterviewFlag && jobApplyFlag && companyJobFlag) {
			System.out.println("用户信息删除成功！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除成功！');window.location.href='admin/JobManagement.jsp'</script>");
		} else {
			System.out.println("删除用户信息失败！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除失败！');window.location.href='admin/JobManagement.jsp'</script>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
