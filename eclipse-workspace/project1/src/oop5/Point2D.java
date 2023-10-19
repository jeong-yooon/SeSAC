package oop5;

public class Point2D {
	int x;
	int y;
	
	public Point2D() {
//		this.x = 1;
//		this.y = 2;
		this(1,2);
		System.out.println("Point2D() 수행");
	}
	
	public Point2D(int x, int y) {
		this.x = x; // this를 통해 필드에 있는 x로 접근
		this.y = y;
		System.out.println("Point2D(x,y) 수행");
	}
}
