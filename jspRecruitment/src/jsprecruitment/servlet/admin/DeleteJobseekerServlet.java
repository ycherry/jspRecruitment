package jsprecruitment.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class DeleteJobseekerServlet
 */
public class DeleteJobseekerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteJobseekerServlet() {
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
		PrintWriter out=response.getWriter();
		String resumeId = request.getParameter("resumeId");
		String userId = request.getParameter("userId");
		System.out.println("DeleteJobseekerServlet resumeId:" + resumeId);
		System.out.println("DeleteJobseekerServlet userId:" + userId);
		// 删除用户信息包括：jobinterview，jobapply，resume，user
		String deleteJobinterviewSql = "delete from t_company_interview where resumeId="
				+ resumeId;
		String deleteJobApplySql = "delete from t_job_apply where resumeId="
				+ resumeId ;
		String deleteResumeSql = "delete from t_resume where id="
				+ resumeId;
		String deleteUserSql = "delete from t_user where  id="
				+ userId;
		int countInterview = dbo.delete(deleteJobinterviewSql);
		int countApply = dbo.delete(deleteJobApplySql);
		int countResume = dbo.delete(deleteResumeSql);
		int countUser = dbo.delete(deleteUserSql);
		System.out.println("countInterview:" + countInterview + " countApply:"
				+ countApply + " countResume:" + countResume + " countUser:"
				+ countUser);
		if (countInterview > 0 && countApply > 0 && countResume > 0
				&& countUser > 0) {
			System.out.println("用户信息删除成功！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除成功！');window.location.href='admin/ResumeManagement.jsp'</script>");
		} else {
			System.out.println("删除用户信息失败！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除失败！');window.location.href='admin/ResumeManagement.jsp'</script>");
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
