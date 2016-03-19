package jsprecruitment.servlet.company;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsprecruitment.entity.Company;
import jsprecruitment.util.DataBaseOperation;

/**
 * Servlet implementation class ReceivedResumeServlet
 */
public class ReceivedResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceivedResumeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		DataBaseOperation dbo=new DataBaseOperation();
		Company company=(Company)request.getSession().getAttribute("company");
		String companyId=company.getId();
		String selectSql=null;
		String jobId=request.getParameter("jobId");
		String jobName=request.getParameter("jobName");
		System.out.println("jobId:"+jobId);
		if(jobId.equals("0")){
			selectSql="select * from t_company_job where cid="+company;
			
		}else{
			selectSql="select * from t_company_job where id="+jobId;
		}
		System.out.println("selectSql1:"+selectSql);
		ResultSet rs=dbo.select(selectSql);
		request.setAttribute("resultSet", rs);
		request.setAttribute("jobName", jobName);
		getServletConfig().getServletContext().getRequestDispatcher("/../jspRecruitment/company/ReceivedResume.jsp").forward(request, response);
//		RequestDispatcher rd=request.getRequestDispatcher("/company/ReceivedResume.jsp").forward(request, response);;
//		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
