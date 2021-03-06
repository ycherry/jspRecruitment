package jsprecruitment.util;

import java.sql.ResultSet;
import java.sql.Statement;


public class DataBaseOperation {
	private DBConn con = new DBConn();
	private Statement stmt;
	private ResultSet rs;

	
	public int getRowCount(String strSql) {
		int intCount = 0;
		try {
			stmt = con.getStmtread();
			rs = stmt.executeQuery(strSql);
			if (rs.next()) {
				intCount = rs.getInt(1);
			} else {
				intCount = 0;
			}
		} catch (Exception e) {
			intCount = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		} finally {
			this.con.close();
			// return intCount;
		}
		return intCount;
	}

	public ResultSet select(String sql){
		try{
			stmt = con.getStmtread();
			rs = stmt.executeQuery(sql);
			rs.last();
			int length=rs.getRow();
			rs.first();
			if(length<=0){
				rs=null;
				System.out.println("查询失败！");
			}
		}catch(Exception e){
			rs=null;
			System.err.println(e.getMessage());
			e.printStackTrace();
		}finally
		{
		//	this.con.close();
		}
		return rs;
	}

	
	public int insert(String sql) {
		int count = 0;
		stmt = con.getStmt();
		try {
			count = stmt.executeUpdate(sql);
		} catch (Exception e) {
			count = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		} finally {
			con.close();

		}
		return count;
	}

	
	public int update(String sql) {
		int count = 0;
		stmt = con.getStmt();
		try {
			count = stmt.executeUpdate(sql);
		} catch (Exception e) {
			count = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		} finally {
			con.close();

		}
		return count;
	}

	
	public int delete(String sql) {
		int count = 0;
		stmt = con.getStmt();
		try {
			count = stmt.executeUpdate(sql);
		} catch (Exception e) {
			count = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		} finally {
			con.close();

		}
		return count;
	}
}