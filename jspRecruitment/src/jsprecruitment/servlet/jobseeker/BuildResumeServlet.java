package jsprecruitment.servlet.jobseeker;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Company;
import jsprecruitment.entity.Jobseeker;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class BuildResumeServlet
 */
public class BuildResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuildResumeServlet() {
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
		request.setCharacterEncoding("utf-8");
		DataBaseOperation dbo = new DataBaseOperation();
		PrintWriter out = response.getWriter();
		Jobseeker jobseeker = new Jobseeker();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = request.getParameter("birthday");
		System.out.println("servlet birthday:" + birthday);
		java.util.Date utilDate;
		try {
			utilDate = sdf.parse(birthday);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			jobseeker.setBirthday(sqlDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		jobseeker.setUserName(((Jobseeker) request.getSession().getAttribute(
				"jobseeker")).getUserName());
		jobseeker.setFullName(request.getParameter("fullName"));
		jobseeker.setAddress(request.getParameter("address"));
		jobseeker.setEducation(request.getParameter("education"));
		jobseeker.setEmail(request.getParameter("email"));
		jobseeker.setExperience(request.getParameter("experience"));
		jobseeker.setIndustry(request.getParameter("industry"));
		jobseeker.setIntentionJobs(request.getParameter("intentionJobs"));
		jobseeker.setPhoto(request.getParameter("photo"));// 待做
		jobseeker.setGender(request.getParameter("gender"));
		jobseeker.setSpecialty(request.getParameter("specialty"));
		jobseeker.setTelphone(request.getParameter("telphone"));
		jobseeker.setExpectedSalary(request.getParameter("expectedSalary"));
		jobseeker.setWorkDistrict(request.getParameter("workDistrict"));
		jobseeker.setSelfIntroduction(request.getParameter("selfIntroduction"));

		String updateSql = "update t_resume set fullName='"
				+ jobseeker.getFullName() + "',address='"
				+ jobseeker.getAddress() + "',education='"
				+ jobseeker.getEducation() + "',email='" + jobseeker.getEmail()
				+ "',experience='" + jobseeker.getExperience() + "',industry='"
				+ jobseeker.getIndustry() + "',intentionJobs='"
				+ jobseeker.getIntentionJobs() + "',photo='"
				+ jobseeker.getPhoto() + "',gender='" + jobseeker.getGender()
				+ "',specialty='" + jobseeker.getSpecialty() + "',telphone='"
				+ jobseeker.getTelphone() + "',expectedSalary='"
				+ jobseeker.getExpectedSalary() + "',workDistrict='"
				+ jobseeker.getWorkDistrict() + "',selfIntroduction='"
				+ jobseeker.getSelfIntroduction() + "',birthday='"
				+ jobseeker.getBirthday() + "' where userName='"
				+ jobseeker.getUserName() + "'";
		if (dbo.update(updateSql) > 0) {
			System.out.println("修改个人简历成功");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('sucess');window.location.href='jobseeker/buildResume.jsp'</script>");
		} else {
			System.out.println("修改个人简历失败");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('fail');window.location.href='jobseeker/buildResume.jsp'</script>");
		}

	}
}
