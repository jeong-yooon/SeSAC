package pt9;

interface A {
	public abstract void abc();
}

class C {
	void cde(A a) {
		a.abc();
	}
}

public class AnnonymousClass_4 {
	public static void main(String[] args) {
		C c = new C();
		
		A a = new A() {
			public void abc() {
				System.out.println("입력매개변수 전달");
			}
		};
		c.cde(a);
		c.cde(new A(){
			public void abc() {
				System.out.println("입력개변수 전");
			}
		});
	}

}
