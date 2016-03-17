package jsprecruitment.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Interview;
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
		response.setCharacterEncoding("utf-8");
		Date date = new Date();
		DataBaseOperation dbo = new DataBaseOperation();
		PrintWriter out = response.getWriter();
		Interview interview = (Interview) request.getSession().getAttribute(
				"interview");
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

		System.out.println("getResumeUid" + interview.getResumeUid());
		String selectSql="select count(*) from t_company_interview where resumeId='"+interview.getResumeId()+"' and jobId='"+interview.getJobId()+"'";
		if(dbo.getRowCount(selectSql)<=0){
			String insertSql = "insert into t_company_interview (resumeId,resumeUid,jobId,jobName,companyId,companyName,interviewTime,note,telphone,district) values('"
					+ interview.getResumeId()
					+ "','"
					+ interview.getResumeUid()
					+ "','"
					+ interview.getJobId()
					+ "','"
					+ interview.getJobName()
					+ "','"
					+ interview.getCompanyId()
					+ "','"
					+ interview.getCompanyName()
					+ "','"
					+ interview.getInterviewTime()
					+ "','"
					+ interview.getNote()
					+ "','"
					+ interview.getTelphone()
					+ "','"
					+ interview.getDistrict() + "')";
			if (dbo.insert(insertSql) > 0) {
				System.out.println("发布面试邀请成功！");
				out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请成功！');window.location.href='jobseeker/ViewResume.jsp?resumeId="+interview.getResumeId()+"'</script>");
			} else {
				System.out.println("发布面试邀请失败！");
				out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('发送面试邀请失败！');window.location.href='jobseeker/ViewResume.jsp?resumeId="+interview.getResumeId()+"'</script>");
			}
		}else{
			System.out.println("不能重复发邀请！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('一个职位不能重复邀请一个人！!');window.location.href='jobseeker/ViewResume.jsp?resumeId="+interview.getResumeId()+"'</script>");
		}
		
	}

}
