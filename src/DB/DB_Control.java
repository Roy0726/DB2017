package DB;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.sql.Statement;

import java.util.ArrayList;

import User.*;

import syllabus.Recommend;
import syllabus.SearchLecture;
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
		String query = "select s.sname, d.dname, s.grade, d.satisfied from student s, department d, login log where log.id = '"
				+ id + "' and s.sno = log.sno and s.did = d.did";
		try {
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				String s_name = rs.getString(1); // 학생이름
				String d_name = rs.getString(2); // 학과명
				int grade = rs.getInt(3); // 학년
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
		String query = "select fc_taken_credit(id) from login where id = '" + id + "'";
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

	public void make_main_view(String id, String name, String category1, String category2, String language,
			String project, String done) {
		String language_check;
		String project_check;
		// 체크 x = 한국어, 영어
		// 체크 o = 영어
		if (language != null)
			language_check = " and lect.language = 'english'";
		else
			language_check = "";
		// 체크 x = 프로젝트 있건 말건
		// 체크 o = 프로젝트 있는 것
		if (project != null)
			project_check = " and sylla.project = 'y'";
		else
			project_check = "";

		String query = "(select lect.grade, lect.major, lect.lid, lect.lname, lect.credit, prof.pname, sylla.capacity, lect.ltime\r\n"
				+ "from lecture lect, department dept, syllabus sylla, professor prof\r\n" + "where dept.did = '"
				+ category2 + "'" + language_check + project_check
				+ " and lect.did = dept.did and lect.lid = sylla.lid and lect.pid = prof.pid) order by lect.grade";
		String sql = "create or replace view main_view as " + query;

		try {
			int result_value = stmt.executeUpdate(sql);
			conn.commit();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	public ArrayList<SearchLecture> getMainRs(String id, String name, String category1, String category2,
			String language, String project, String done) {
		ArrayList<SearchLecture> sy = new ArrayList<>();
		ResultSet rs = null;

		make_main_view(id, name, category1, category2, language, project, done);

		String query;
		int flag = 0;
		if (done == null) {
			query = "select * from main_view";
			flag = 0;
		} else {
			query = "select main.grade, main.major, main.lid, main.lname, main.credit, main.pname, main.capacity, main.ltime, "
					+ "nvl((select main.lid from login log, attended attend where log.id = '" + id
					+ "' and log.sno = attend.sno and main.lid = attend.lid), 0)\r\n" + "from main_view main";
			flag = 1;
		}
		try {
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				if (flag == 1) {
					if (rs.getInt(9) != 0)
						continue;
				}
				int grade = rs.getInt(1);
				String major = rs.getString(2);
				int lid = rs.getInt(3);
				String lname = rs.getString(4);
				int credit = rs.getInt(5);
				String pname = rs.getString(6);
				int capacity = rs.getInt(7);
				String time = rs.getString(8);
				sy.add(new SearchLecture(grade, major, lid, lname, credit, pname, capacity, time));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sy;
	}

	public void make_view(String id) {
		String sql = "create or replace view recommend_view as "
				+ "(select lect.lid, log.sno, lect.credit, lect.lname, lect.language, sylla.project "
				+ "from lecture lect, login log, student stu, department dept, syllabus sylla " + "where log.id = '"
				+ id
				+ "' and log.sno = stu.sno and stu.did = dept.did and dept.did = lect.did and lect.grade = stu.grade and lect.lid = sylla.lid and lect.major = 'y')";
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
		String sql = "select credit, lname, language, project, nvl((select attend.lid from attended attend, login log where recommend.lid = attend.lid "
				+ "and log.sno = attend.sno and log.id = '"
				+ id + "'), 0)\r\n" +

				"from recommend_view recommend";
		try {
			rs = stmt.executeQuery(sql);
			while (rs.next())
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