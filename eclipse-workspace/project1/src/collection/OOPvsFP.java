package collection;

interface AAA {
	void abc();
}

class BBB implements AAA {
	@Override
	public void abc() {
		System.out.println("메서드 내용 1");
	}
}

public class OOPvsFP {

	public static void main(String[] args) {
		AAA a1 = new BBB();
		a1.abc();
		A a2 = new AAA() {
			@Override
			public void abc() {
				System.out.println("메서드 내용 2");
			}
		};
		a2.abc();	// 메서드 내용
		AAA a3 = () -> {System.out.println("메서드 내용 3");};
		a3.abc();
	}

}
