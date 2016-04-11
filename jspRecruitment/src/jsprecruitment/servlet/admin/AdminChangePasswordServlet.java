package jsprecruitment.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Admin;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class AdminChangePasswordServlet
 */
public class AdminChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
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
				String userName=((Admin)request.getSession().getAttribute("admin")).getUserName();
				String password=request.getParameter("password");
				String newPassword=request.getParameter("newPassword");
				String sql="select * from t_user where userName='"+userName+"' and userPass='"+password+"'";
				System.out.println("admin change password sql:"+sql);
				if(dbo.getRowCount(sql)>0){
					String changePassSql="update t_user set userPass='"+newPassword+"' where userName='"+userName+"'";
					if(dbo.update(changePassSql)>0){
						System.out.println("修改管理员密码成功");
						request.getSession().invalidate();
						out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('修改密码成功');parent.location.href='login.jsp'</script>");
					}else{
						System.out.println("修改管理员密码失败");
						out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('修改密码失败');window.location.href='admin/ChangePassword.jsp'</script>");
					}
					
				}else{
					System.out.println("修改管理员密码失败");
					out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('原密码错误，请重新检查');window.location.href='admin/ChangePassword.jsp'</script>");
				}
	}

}
