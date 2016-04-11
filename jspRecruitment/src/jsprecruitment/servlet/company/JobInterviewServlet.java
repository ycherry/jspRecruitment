package jsprecruitment.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Company;
import jsprecruitment.entity.Interview;
import jsprecruitment.util.DBConn;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class JobInterviewServlet
 */
public class JobInterviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JobInterviewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Date date = new Date();
		DataBaseOperation dbo = new DataBaseOperation();
		DBConn dbc = new DBConn();
		PrintWriter out = response.getWriter();
		Interview interview = (Interview) request.getSession().getAttribute("interview");
		Company company = (Company) request.getSession().getAttribute("company");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		try {
			date = sdf.parse(request.getParameter("interviewTime"));
			interview.setInterviewTime(new java.sql.Date(date.getTime()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		interview.setNote(request.getParameter("note"));
		interview.setTelphone(request.getParameter("telphone"));
		interview.setDistrict(request.getParameter("district"));
		interview.setJobName(request.getParameter("position"));
        String resourcePage=request.getParameter("resourcePage");
        System.out.println("resourcePage servlet:"+resourcePage);
		String jobSelectSql = "select * from t_company_job where cid='" + company.getId() + "' and position='"
				+ interview.getJobName() + "'";
		ResultSet rs = dbc.getRs(jobSelectSql);
		try {
			if (rs.next()) {
				interview.setJobId(rs.getString(1));
				interview.setCompanyName(rs.getString(4));
				interview.setCompanyId(rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String selectSql = "select count(*) from t_company_interview where resumeId='" + interview.getResumeId()
				+ "' and jobId='" + interview.getJobId() + "'";
		if (dbo.getRowCount(selectSql) <= 0) {
			String insertSql = "insert into t_company_interview (resumeId,resumeUid,jobId,jobName,companyId,companyName,interviewTime,note,telphone,district) values('"
					+ interview.getResumeId() + "','" + interview.getResumeUid() + "','" + interview.getJobId() + "','"
					+ interview.getJobName() + "','" + interview.getCompanyId() + "','" + interview.getCompanyName()
					+ "','" + interview.getInterviewTime() + "','" + interview.getNote() + "','"
					+ interview.getTelphone() + "','" + interview.getDistrict() + "')";
			String selectSql2 = "select count(*) from t_job_apply where resumeId='" + interview.getResumeId()
					+ "' and jobId='" + interview.getJobId() + "'";
			if (dbo.getRowCount(selectSql2) > 0) {
				String updateSql = "update t_job_apply set status=1 where resumeId='"+interview.getResumeId()+"' and jobId='"+interview.getJobId()+"'";
				if (dbo.update(updateSql) > 0) {
					System.out.println("更新表状态成功！");
				}
			}

			if (dbo.insert(insertSql) > 0) {
				System.out.println("发布面试邀请成功！");
				if(resourcePage.equals("/jspRecruitment/ReceivedResumeServlet")){
					out.println(
							"<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请成功！');window.location.href='company/ReceivedResume.jsp'</script>");
				}
				if(resourcePage.equals("/jspRecruitment/company/SearchTalent.jsp")){
					out.println(
							"<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请成功！');window.location.href='company/SearchTalent.jsp'</script>");
				}
				
				out.println(
						"<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请成功！');window.location.href='jobseeker/ViewResume.jsp?resumeId="
								+ interview.getResumeId() + "'</script>");
			} else {
				System.out.println("发布面试邀请失败！");
				if(resourcePage.equals("/jspRecruitment/ReceivedResumeServlet")){
					out.println(
							"<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请失败！');window.location.href='company/ReceivedResume.jsp'</script>");
				}
				if(resourcePage.equals("/jspRecruitment/company/SearchTalent.jsp")){
					out.println(
							"<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请失败！');window.location.href='company/SearchTalent.jsp'</script>");
				}
				out.println(
						"<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请失败！');window.location.href='jobseeker/ViewResume.jsp?resumeId="
								+ interview.getResumeId() + "'</script>");
			}
		} else {
			System.out.println("不能重复发邀请！");
			if(resourcePage.equals("/jspRecruitment/ReceivedResumeServlet")){
				out.println(
						"<script language='javascript' charset='utf-8' type='text/javascript'>alert('一个职位不能重复邀请一个人！');window.location.href='company/ReceivedResume.jsp'</script>");
			}
			if(resourcePage.equals("/jspRecruitment/company/SearchTalent.jsp")){
				out.println(
						"<script language='javascript' charset='utf-8' type='text/javascript'>alert('一个职位不能重复邀请一个人！');window.location.href='company/SearchTalent.jsp'</script>");
			}
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('一个职位不能重复邀请一个人！');window.location.href='jobseeker/ViewResume.jsp?resumeId="
							+ interview.getResumeId() + "'</script>");
		}

	}

}
