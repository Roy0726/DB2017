package syllabus;

public class Recommend {
	int credit;
	String lname;
	String lang;
	String Project;
	int done;
	public Recommend(int _credit, String _lname, String _lang, String _Project, int _done)
	{
		this.credit = _credit;
		this.lname = _lname;
		this.lang = _lang;
		this.Project = _Project;
		this.done = _done;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getLang() {
		if (lang.equals("korean"))
			return "K";
		else
			return "E";
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getProject() {
		if (Project.equals("Y"))
			return "O";
		else
			return "X";
	}

	public void setProject(String project) {
		Project = project;
	}

	public String getDone() {
		if (done == 0)
			return "X";
		else
			return "O";

	}

	public void setDone(int done) {
		this.done = done;
	}

}