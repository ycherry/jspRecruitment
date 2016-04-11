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
import jsprecruitment.entity.Job;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class pubJobServlet
 */

public class PubJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PubJobServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		Job job = new Job();
		Date date = new Date();
		DataBaseOperation dbo = new DataBaseOperation();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		PrintWriter out = response.getWriter();
		// 获取网页数据
		job.setAmount(request.getParameter("amount"));
		// 获取截至时间
		String deadline = request.getParameter("deadline");
		java.util.Date utilDate;
		try {
			utilDate = sdf.parse(deadline);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			job.setDeadline(sqlDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String userName = ((Company) request.getSession().getAttribute(
				"company")).getUserName();
		job.setContents(request.getParameter("contents"));
		job.setAddTime(new java.sql.Date(date.getTime()));
		job.setDistrict(request.getParameter("district"));
		job.setEducation(request.getParameter("education"));
		job.setExperience(request.getParameter("experience"));
		job.setPosition(request.getParameter("position"));
		job.setSalary(request.getParameter("salary"));
		// 执行sql语句
		String selectSql = "select id,companyName from t_company where userName='"
				+ userName + "'";
		System.out.println("selectSql" + selectSql);
		ResultSet rs = dbo.select(selectSql);
		try {
			if (rs != null && rs.getString(1) != null) {
				String insertSql = "insert into t_company_job(cid,position,companyName,amount,district,education,experience,salary,contents,addtime,deadline) values ('"
						+ rs.getInt(1)
						+ "','"
						+ job.getPosition()
						+ "','"
						+ rs.getString(2)
						+ "','"
						+ job.getAmount()
						+ "','"
						+ job.getDistrict()
						+ "','"
						+ job.getEducation()
						+ "','"
						+ job.getExperience()
						+ "','"
						+ job.getSalary()
						+ "','"
						+ job.getContents()
						+ "','"
						+ job.getAddTime()
						+ "','" + job.getDeadline() + "') ";
				System.out.println(insertSql);
				if (dbo.insert(insertSql) > 0) {
					System.out.println("发布职位成功！");
					out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('发布职位成功！');window.location.href='company/pubJob.jsp'</script>");
				} else {
					System.out.println("发布职位失败！");
					out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('发布职位失败！');window.location.href='company/pubJob.jsp'</script>");
				}
			} else {
				System.out.println("查询公司成功！");
				out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('发布职位失败！');window.location.href='company/pubJob.jsp'</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
