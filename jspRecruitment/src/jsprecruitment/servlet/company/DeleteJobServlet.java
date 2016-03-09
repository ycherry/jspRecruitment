package jsprecruitment.servlet.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		String intId=request.getParameter("intId");
		DataBaseOperation dbo=new DataBaseOperation();
		PrintWriter out=response.getWriter();
		System.out.println(intId);
		String deleteSql="delete from t_company_job where id='"+intId+"'";
		if(dbo.delete(deleteSql)>0){
			System.out.println("删除成功");
			out.println("<script language='javascript' charset='utf-8' type='text/javascript'>alert('sucess');window.location.href='../company/allJob.jsp'</script>");
		}else{
			System.out.println("删除失败！");
			out.println(
					"<script language='javascript' charset='utf-8' type='text/javascript'>alert('fail');window.location.href='../company/allJob.jsp'</script>");
		}
		
	}
	

}
