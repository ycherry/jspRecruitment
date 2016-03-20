package jsprecruitment.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class RefuseApplyServlet
 */

public class RefuseApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefuseApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utt-8");
		response.setContentType("text/html;charset=utf-8");
		String jobId=request.getParameter("jobId");
		String resumeId=request.getParameter("resumeId");
		PrintWriter out=response.getWriter();
		DataBaseOperation dbo=new DataBaseOperation();
		String updateSql="update t_job_apply set status=2 where jobId="+jobId+" and resumeId="+resumeId;
		System.out.println("updateSql:"+updateSql);
		if(dbo.update(updateSql)>0){
			System.out.println("操作成功！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('操作成功！');window.location.href='company/ReceivedResume.jsp'</script>");
		}else{
			System.out.println("操作失败！");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('操作失败！');window.location.href='company/ReceivedResume.jsp'</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
