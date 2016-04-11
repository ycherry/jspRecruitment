package jsprecruitment.servlet.jobseeker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class ResponseOfInterviewServlet
 */

public class ResponseOfInterviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResponseOfInterviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DataBaseOperation dbo=new DataBaseOperation();
		PrintWriter out=response.getWriter();
		String interviewId=request.getParameter("interviewId");
		String status=request.getParameter("responseStatus");
		int count=-1;
		if(status!=null&&status.equals("3")){
			String deleteSql="delete from t_company_interview where id='"+interviewId+"'";
			count=dbo.delete(deleteSql);
		}else if(status!=null&&!status.equals("3")){
			String updateSql="update t_company_interview set status='"+status+"' where id='"+interviewId+"'";
			count=dbo.update(updateSql);
		}	
		if(count>0){
			System.out.println("更新面试信息成功！");
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('操作成功！');window.location.href='jobseeker/InterviewInvitation.jsp'</script>");
		}else{
			System.out.println("更新面试信息失败！");
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('操作失败！');window.location.href='jobseeker/InterviewInvitation.jsp'</script>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
