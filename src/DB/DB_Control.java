package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import User.*;
import syllabus.Recommend;
import syllabus.Syllabus;
public class DB_Control {

	private Connection conn = null;
	private Statement stmt = null;

	public DB_Control() {
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

	public User get_student_info(String id) {
		User user = null;
		ResultSet rs = null;
		String query = "select s.sname, d.dname, s.grade, d.satisfied from student s, department d, login log where log.id = '" + id + "' and s.sno = log.sno and s.did = d.did";
		
		try {
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				String s_name = rs.getString(1); // 학생이름
				String d_name = rs.getString(2); // 학과명
				int grade = rs.getInt(3);  // 학년
				int satisfied = rs.getInt(4); // 졸업학점
				user = new User(s_name, d_name, grade, satisfied);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public int completed_lecture_num(String id) {
		int ret_sum = 0;
		ResultSet rs = null;
		String query = "select sum(lect.credit) from login log, lecture lect, attended attend where log.id = '" + id + "' and log.sno = attend.sno and lect.lid = attend.lid";
		try {
			rs = stmt.executeQuery(query);
			rs.next();
			ret_sum = rs.getInt(1);
			rs.close();
			return ret_sum;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;
	}

	public boolean login(String id, String passwd) {
		ResultSet rs = null;
		boolean flag = false;
		String sql = "select * from login log where log.id='" + id + "' and log.passwd='" + passwd + "'";
		try {
			rs = stmt.executeQuery(sql);
			rs.next();

			if (rs.getRow() > 0)
				flag = true;
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	public ArrayList<Syllabus> getMainRs(String name, String check1, String check2, String check3) {
		ArrayList<Syllabus> sy = new ArrayList<>();
		ResultSet rs = null;
		
		String sql = "select * from lecture";
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				int _grade = rs.getInt(1);
				String _name = rs.getString(2);
				sy.add(new Syllabus(_name, _grade));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sy;
	}

	public void make_view(String id) {
	      String sql = "create or replace view recommend_view as " + 
	            "(select lect.lid, log.sno, lect.credit, lect.lname, lect.language, sylla.project " + 
	            "from lecture lect, login log, student stu, department dept, syllabus sylla " + 
	            "where log.id = '" + id + "' and log.sno = stu.sno and stu.did = dept.did and dept.did = lect.did and lect.grade = stu.grade and lect.lid = sylla.lid and lect.major = 'y')";
	      System.out.println(sql);
	      try {
	         int ret_value = stmt.executeUpdate(sql);
	         conn.commit();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
	
	public ArrayList<Recommend> getRecommendRs(String id) {
		ArrayList<Recommend> rec = new ArrayList<>();
		
		ResultSet rs = null;
		String sql = "select credit, lname, language, project, nvl((select attend.lid from attended attend, login log where recommend.lid = attend.lid and log.sno = attend.sno and log.id = '" + id +"'), 0)\r\n" + 
				"from recommend_view recommend";
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				int _credit = rs.getInt(1);
				String _lname = rs.getString(2);
				String _lang = rs.getString(3);
				String _Project = rs.getString(4);
				int _done = rs.getInt(5);
				rec.add(new Recommend(_credit, _lname, _lang, _Project, _done));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rec;
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

}