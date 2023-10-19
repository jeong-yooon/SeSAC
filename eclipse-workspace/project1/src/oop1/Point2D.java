package oop1;

public class Point2D {
	private int x;
	private int y;
	
	public void setX(int x) {
		this.x = x;
	}
	public int getX() {
		return x;
	}
	
	public void setY(int y) {
		this.y = y;
	}
	public int getY() {
		return y;
	}
	public void print() {
		System.out.println("x = " + this.getX());
		System.out.println("y = " + this.getY());
//		System.out.println("z = " + this.getZ());
	}
}
