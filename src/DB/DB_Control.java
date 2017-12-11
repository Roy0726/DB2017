package DB;
import java.sql.*;

public class DB_Control {
	Connection conn = null;
	Statement stmt = null;
	public DB_Control()
	{
		String DB_URL = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String DB_USER = "kdhong"; // DB USER명
		String DB_PASSWORD = "kdhong"; // 패스워드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			stmt = conn.createStatement();
		} catch (SQLException e) {
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean login(String id, String passwd)
	{
		ResultSet rs = null;
		boolean flag = false;
		String sql = "select * from login log where log.id='" + id + "' and log.passwd='" + passwd + "'";
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			
			if(rs.getRow() > 0) flag = true;
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public ResultSet getMainRs(String name, String check1, String check2, String check3)
	{
		ResultSet rs = null;
		String temp = "";
		String sql = "select * from login";
		
//		if(check1 != null)
//			temp += " where id= '"+check1 + "'";
//		
//		if(check2 != null)
//			temp += " passwd="+check2;
		try {
//			sql += temp;
//			System.out.println(sql);
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet getRecommendRs()
	{
		ResultSet rs = null;
		String sql = "select * from test";
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}
	
}
