package syllabus;

public class Syllabus {
	
	String lect_name;
	int grade;
	
	/** 
	 * 
	 * @param _lect_name
	 * @param _grade
	 */
	public Syllabus(String _lect_name, int _grade)
	{
		this.lect_name = _lect_name;
		this.grade = _grade;
	}
	public String getLect_name() {
		return lect_name;
	}
	public void setLect_name(String lect_name) {
		this.lect_name = lect_name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
}
