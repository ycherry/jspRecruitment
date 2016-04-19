package jsprecruitment.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class DeleteJobServlet
 */

public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String intId=request.getParameter("intId");
		DataBaseOperation dbo=new DataBaseOperation();
		PrintWriter out=response.getWriter();
		String deleteSql="delete from t_company_job where id='"+intId+"'";
		String deleteInterviewSql="delete from t_company_interview where jobId='"+intId+"'";
		String deleteApplySql="delete from t_job_apply where jobId='"+intId+"'";
		if(dbo.delete(deleteSql)>0||dbo.delete(deleteApplySql)>0||dbo.delete(deleteInterviewSql)>0){
			System.out.println("删除成功");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除职位成功！');window.location.href='company/allJob.jsp'</script>");
		}else{
			System.out.println("删除失败！");
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除职位失败！');window.location.href='company/allJob.jsp'</script>");
		}
		
	}
	

}
