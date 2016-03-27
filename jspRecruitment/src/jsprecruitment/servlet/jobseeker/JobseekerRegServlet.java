package jsprecruitment.servlet.jobseeker;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Jobseeker;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class JobSeekerRegServlet
 */
public class JobseekerRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobseekerRegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		DataBaseOperation dbo=new DataBaseOperation();
		PrintWriter out=response.getWriter();
		Date date=new Date();
		Jobseeker jobseeker=new Jobseeker();
		jobseeker.setUserName(request.getParameter("jobseekerName"));
		jobseeker.setPassword(request.getParameter("password"));
		jobseeker.setFirstUpdateTime(new java.sql.Date(date.getTime()));
		String sql="insert into t_user(userName,userPass,userType) values('"+jobseeker.getUserName()+"','"+jobseeker.getPassword()+"','1')";
		if(dbo.insert(sql)>0){
			String jobseekerSql="select * from t_user where userName='"+jobseeker.getUserName()+"'";
			ResultSet rs=dbo.select(jobseekerSql);
			try {
				if(rs!=null&&rs.getString(1)!=null){
					String jobseekerRegSql="insert into t_resume(uid,userName,firstUpdateTime) values('"+rs.getString("id")+"','"+rs.getString("userName")+"','"+jobseeker.getFirstUpdateTime()+"')";
					if(dbo.insert(jobseekerRegSql)>0){
						System.out.println("注册成功");
						out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('注册成功，请完善基本信息！');window.location.href='login.jsp'</script>");
					}else{
						System.out.println("t_resume注册失败");
						out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('注册失败！');window.location.href=reg.html'</script>");
			//			response.sendRedirect("reg.html");
					}
				}else{
					System.out.println("查询注册失败");
					out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('注册失败！');window.location.href=reg.html'</script>");
				//	out.println("fail");
				//	response.sendRedirect("reg.html");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("t_user注册失败");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('注册失败！');window.location.href=reg.html'</script>");
		//	out.println("注册失败!");
		//	response.sendRedirect("reg.html");
		}
		
	}

}
