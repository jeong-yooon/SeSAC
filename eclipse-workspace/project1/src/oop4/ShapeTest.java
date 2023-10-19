package oop4;

public class ShapeTest {
	public static void main(String[] args) {
//		Circle c = new Circle();
//		printArea(c);
//		
//		Rectangle r = new Rectangle();
//		printArea(r);
//		
//		Triangle t = new Triangle();
//		printArea(t);
		
		printArea(new Circle());
		printArea(new Rectangle());
		printArea(new Triangle());

	}
	
	private static void printArea(Shape s) {
		s.area();
		if(s instanceof Circle) {
			Circle c = (Circle)s;
			System.out.println("반지름이 " + c.r + "인 원의 넓이는 " + c.res + "입니다.");
		} else if (s instanceof Rectangle) {
			Rectangle r = (Rectangle)s;
			System.out.println("너비가  " + r.w + "이고 " + "높이가  " + r.h + "인 사각형의 넓이는 "+ r.res + "입니다.");
		} else if (s instanceof Triangle) {
			Triangle t = (Triangle)s;
			System.out.println("너비가  " + t.w + "이고 " + "높이가  " + t.h + "인 사각형의 넓이는 "+ t.res + "입니다.");
		}
	}

//	private static void printArea(Triangle t) {
//		t.area();
//		System.out.println(t.res);		
//	}
//
//	private static void printArea(Rectangle r) {
//		r.area();
//		System.out.println(r.res);		
//	}
//
//	private static void printArea(Circle c) {
//		c.area();
//		System.out.println(c.res);
//	}

}
