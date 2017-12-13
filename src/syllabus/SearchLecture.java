package syllabus;

public class SearchLecture {

	private int grade;
	private String major;
	private int lid;
	private String lname;
	private int credit;
	private String pname;
	private int capacity;
	private String time;

	public String prev;
	public String after;
	public SearchLecture(int grade, String major, int lid, String lname, int credit, String pname, int capacity,
			String time) {
		this.grade = grade;
		this.major = major;
		this.lid = lid;
		this.lname = lname;
		this.credit = credit;
		this.pname = pname;
		this.capacity = capacity;
		setTime(time);
	}

	public int get_grade() {
		return grade;
	}

	public String get_major() {
		if (major.equals("y"))
			return "전공";
		else
			return "교양";
	}

	public int get_lid() {
		return lid;
	}

	public String get_lname() {
		return lname;
	}

	public int get_credit() {
		return credit;
	}

	public String get_pname() {
		return pname;
	}

	public int get_capacity() {
		return capacity;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getTime() {
		if(this.time.contains("/"))
		{
			String[] temp = this.time.split("/");
			
		}
		return time;
	}

	public void setTime(String time) {
		this.time = time;
		
		if(this.time.contains("/"))
		{
			String[] temp = this.time.split("/");
			prev = temp[0].replace(",", " ");
			after = temp[1].replace(",", " ");
		}
		else
		{
			prev = "";
			after = "";
			String[] temp = this.time.split(",");
			for (int i = 0; i < temp.length/2; i++)
			{
				prev += temp[i]+" ";
			}
			for( int i = temp.length/2; i < temp.length; i++)
			{
				after += temp[i]+" ";
			}
		}
	}

}