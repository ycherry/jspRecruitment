package jsprecruitment.servlet.jobseeker;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Jobseeker;
import jsprecruitment.util.DataBaseOperation;
import jsprecruitment.util.Encode;

/**
 * Servlet implementation class ApplyJobServlet
 */

public class ApplyJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyJobServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		DataBaseOperation dbo = new DataBaseOperation();
		Date date = new Date();
		PrintWriter out = response.getWriter();
		String jobId = request.getParameter("jobId");
		String jobName = Encode.getNewString(request.getParameter("jobName"));
		String companyId = request.getParameter("companyId");
		String companyName = Encode.getNewString(request.getParameter("companyName"));
		Jobseeker jobseeker = (Jobseeker) request.getSession().getAttribute("jobseeker");
		System.out.println("jobName:" + jobName);
		System.out.println("jobid:" + jobId);
		System.out.println("companyId:" + companyId);
		System.out.println("companyName:" + companyName);
		System.out.println("jobseeker.getId():" + jobseeker.getId());
		System.out.println("jobseeker.getUid():" + jobseeker.getUid());
		// this.doPost(request, response);
		String selectSql = "select * from t_job_apply where resumeId='" + jobseeker.getId() + "' and jobId='" + jobId
				+ "'";
		if (dbo.getRowCount(selectSql) <= 0) {
			String insertSql = "insert into t_job_apply(resumeId,resumeUid,jobId,jobName,companyName,companyId,applyTime) values('"
					+ jobseeker.getId() + "','" + jobseeker.getUid() + "','" + jobId + "','" + jobName + "','"
					+ companyName + "','" + companyId + "','" + new java.sql.Date(date.getTime()) + "')";
			if (dbo.insert(insertSql) > 0) {
				System.out.println("申请职位成功！");
				out.println(
						"<script language='javascript' charset='utf-8' type='text/javascript'>alert('申请职位成功！');window.location.href='company/ViewJob.jsp?jobId="
								+ jobId + "'</script>");
			} else {
				System.out.println("申请职位失败！");
				out.println(
						"<script language='javascript' charset='utf-8' type='text/javascript'>alert('申请职位失败！');window.location.href='company/ViewJob.jsp?jobId='"
								+ jobId + "''</script>");
			}
		} else {
			System.out.println("不能重复申请！");
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('不能重复申请同一个职位！!');window.location.href='company/ViewJob.jsp?jobId="
							+ jobId + "'</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
