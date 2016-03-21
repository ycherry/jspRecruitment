package jsprecruitment.servlet.jobseeker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class DeleteApplyInfoServlet
 */

public class DeleteApplyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteApplyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		DataBaseOperation dbo=new DataBaseOperation();
		String resumeId=request.getParameter("resumeId");
		String jobId=request.getParameter("jobId");
		System.out.println("resumeId:"+resumeId);
		System.out.println("jobId:"+jobId);
		String deleteSql="delete from t_job_apply where jobId="+jobId+" and resumeId="+resumeId;
		System.out.println("deleteSql:"+deleteSql);
		if(dbo.delete(deleteSql)>0){
			System.out.println("删除求职信息成功！");
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除成功！');window.location.href='jobseeker/AppliedJobs.jsp'</script>");
		}else{
			System.out.println("删除求职信息失败！");
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('删除失败！');window.location.href='jobseeker/AppliedJobs.jsp'</script>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
