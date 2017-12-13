package User;

public class User {

	String sname;

	String dname;

	int grade;

	int satisfied; // Á¹¾÷ÇÐÁ¡

	int taken; // ÀÌ¼öÇÐÁ¡

	int semester;
	double cal_semester;

	/**
	 * 
	 * 
	 * 
	 * @param _sname
	 *            : student name
	 * 
	 * @param _dname
	 *            : department name
	 * 
	 * @param _grade
	 *            : student`s grade;
	 * 
	 * @param _satisfied
	 *            : department`s satisfied grade
	 * 
	 */

	public User(String _sname, String _dname, int _grade, int _satisfied) {

		this.sname = _sname;

		this.dname = _dname;

		this.grade = _grade;

		this.satisfied = _satisfied;

	}

	public User() {

		sname = "";

		dname = "";

		grade = 0;

		satisfied = 0;

	}

	public String getSname() {

		return sname;

	}

	public void setSname(String sname) {

		this.sname = sname;

	}

	public String getDname() {

		return dname;

	}

	public void setDname(String dname) {

		this.dname = dname;

	}

	public int getGrade() {

		return grade;

	}

	public void setGrade(int grade) {

		this.grade = grade;

	}

	public int getSatisfied() {

		return satisfied;

	}

	public void setSatisfied(int satisfied) {

		this.satisfied = satisfied;

	}

	public int getSemester() {

		return this.semester;

	}

	public void setSemester(int _taken) {

		cal_semester = Math.ceil(_taken * 8 / (double) this.satisfied);

		if (cal_semester % 2 == 1 || cal_semester == 0)
			this.semester = 1;
		else
			this.semester = 2;
	}

	public int getTaken() {

		return taken;

	}

	public void setTaken(int taken) {

		this.taken = taken;

		setSemester(taken);

	}

}