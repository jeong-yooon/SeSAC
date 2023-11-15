package basic;

import java.io.Serializable;

public class Member implements Serializable{
	public int getNo() {
		return no;
	}
	public Member(int no, String name, String position) {
		super();
		this.no = no;
		this.name = name;
		this.position = position;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	private int no;
	private String name;
	private String position;
}
