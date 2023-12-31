package oop3;

public class AnimalTest {
	public static void main(String[] args) {
		Animal a = new Condor();
		System.out.println(a);

		Bird b = (Bird) a;
		System.out.println(b);
		
		Condor c = null;
		if(b instanceof Condor) {
			c = (Condor) b;
			System.out.println(c);
		} else {
			System.out.println("downcasting 불가");
		}
		
		// 원래 실제보다 다운캐스팅하면 안됨
		if (c instanceof BlackVulture) {
			BlackVulture bv = (BlackVulture) c;
			System.out.println(bv);
		} else {
			System.out.println("downcasting 불가");
		}
		
//		Cat c = new Cat();
//		System.out.println(c);
//		
//		Animal a = c;
//		System.out.println(a);
//		
//		if (a instanceof Bird) {
//			Bird b = (Bird)a;
//			System.out.println(b);
//		} else {
//			System.out.println("downcasting 불가");
//		}
	}
}
