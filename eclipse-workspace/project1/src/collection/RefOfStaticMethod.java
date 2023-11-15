package collection;

interface AAAAA {
	void abc();
}

class BBBBB {
	static void bcd() {
		System.out.println("메서드");
	}
}

public class RefOfStaticMethod {
	public static void main(String[] args) {
		AAAAA a1 = new AAAAA() {
			@Override
			public void abc() {
				BBBBB.bcd();
			}
		};
		
		AAAAA a2 = () -> {BBBBB.bcd();};
		AAAAA a3 = BBBBB::bcd;
		a1.abc();
		a2.abc();
		a3.abc();
	}
}
