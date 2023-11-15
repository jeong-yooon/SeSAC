package collection;

interface AAAA {
	void abc();
}
class BBBB {
	void bcd() {
		System.out.println("메서드");
	}
}

public class RefOfIntanceMethod_Type1_1 {
	public static void main(String[] args) {
		AAAA a1 = new AAAA() {
			@Override
			public void abc() {
				BBBB b = new BBBB();
				b.bcd();
			}
		};
		
		AAAA a2 = () -> {
			BBBB b = new BBBB();
			b.bcd();
		};
		
		BBBB b = new BBBB();
		AAAA a3 = b::bcd;
		a1.abc();
		a2.abc();
		a3.abc();
	}

}
