package jsprecruitment.servlet.jobseeker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Jobseeker;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class JobSeekerChangePassword
 */

public class JobseekerChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobseekerChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		DataBaseOperation dbo=new DataBaseOperation();
		PrintWriter out=response.getWriter();
		String userName=((Jobseeker)request.getSession().getAttribute("jobseeker")).getUserName();
		String password=request.getParameter("newPassword");
		String sql="select * from t_user where userName='"+userName+"'";
		if(dbo.getRowCount(sql)>0){
			String changePassSql="update t_user set userPass='"+password+"'";
			if(dbo.update(changePassSql)>0){
				System.out.println("修改密码成功");
				request.getSession().invalidate();
				out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('sucess');parent.location.href='login.jsp'</script>");
			}else{
				System.out.println("修改用户密码失败");
				out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('fail');window.location.href='jobseeker/changePassword.jsp'</script>");
			}
			
		}else{
			System.out.println("修改用户密码失败");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('fail');window.location.href='jobseeker/changePassword.jsp'</script>");
		}
	}

}
