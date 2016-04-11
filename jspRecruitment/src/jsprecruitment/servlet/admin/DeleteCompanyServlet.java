package jsprecruitment.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class DeleteCompanyServlet
 */

public class DeleteCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCompanyServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		DataBaseOperation dbo = new DataBaseOperation();
		PrintWriter out = response.getWriter();
		String companyId = request.getParameter("companyId");
		String userId = request.getParameter("userId");
		// 删除用户信息包括：jobinterview，jobapply，resume，user
		Boolean jobInterviewFlag = false;
		Boolean jobApplyFlag = false;
		Boolean companyJobFlag = false;
		Boolean companyFlag = false;
		Boolean userFlag = false;
		String selectJobinterviewSql = "select count(*) from t_company_interview where companyId="
				+ companyId;
		String selectJobApplySql = "select count(*) from t_job_apply where companyId="
				+ companyId;
		String selectCompanyJobSql = "select count(*) from t_company_job where cid="
				+ companyId;
		String selectCompanySql = "select count(*) from t_company where id="
				+ companyId;
		String selectUserSql = "select count(*) from t_user where  id="
				+ userId;
		if (dbo.getRowCount(selectJobinterviewSql) > 0) {
			String deleteJobinterviewSql = "delete from t_company_interview where companyId="
					+ companyId;
			if (dbo.delete(deleteJobinterviewSql) > 0) {
				jobInterviewFlag = true;
			} else {
				jobInterviewFlag = false;
			}
		} else {
			jobInterviewFlag = true;
		}

		if (dbo.getRowCount(selectJobApplySql) > 0) {
			String deleteJobApplySql = "delete from t_job_apply where companyId="
					+ companyId;
			if (dbo.delete(deleteJobApplySql) > 0) {
				jobApplyFlag = true;
			} else {
				jobApplyFlag = false;
			}
		} else {
			jobApplyFlag = true;
		}

		if (dbo.getRowCount(selectCompanyJobSql) > 0) {
			String deleteCompanyJobSql = "delete from t_company_job where cid="
					+ companyId;
			if (dbo.delete(deleteCompanyJobSql) > 0) {
				companyJobFlag = true;
			} else {
				companyJobFlag = false;
			}
		} else {
			companyJobFlag = true;
		}

		if (dbo.getRowCount(selectCompanySql) > 0) {
			String deleteResumeSql = "delete from t_company where id="
					+ companyId;
			if (dbo.delete(deleteResumeSql) > 0) {
				companyFlag = true;
			} else {
				companyFlag = false;
			}
		} else {
			companyFlag = true;
		}

		if (dbo.getRowCount(selectUserSql) > 0) {
			String deleteUserSql = "delete from t_user where  id=" + userId;
			if (dbo.delete(deleteUserSql) > 0) {
				userFlag = true;
			} else {
				userFlag = false;
			}
		} else {
			userFlag = true;
		}
		System.out.println("jobInterviewFlag:" + jobInterviewFlag
				+ " jobApplyFlag:" + jobApplyFlag + " companyJobFlag:"
				+ companyJobFlag + " resumeFlag:" + companyFlag + " userFlag:"
				+ userFlag);
		if (jobInterviewFlag && jobApplyFlag && companyJobFlag && companyFlag
				&& userFlag) {
			System.out.println("用户信息删除成功！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除成功！');window.location.href='admin/CompanyManagement.jsp'</script>");
		} else {
			System.out.println("删除用户信息失败！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除失败！');window.location.href='admin/CompanyManagement.jsp'</script>");
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
