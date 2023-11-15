package lambda;

interface AAA {
	BBB abc(int k);
}
class BBB{
	BBB(){
		System.out.println("첫 번째 생성자");
	}
	BBB(int k){
		System.out.println("두 번째 생성자");
	}
}

public class RefOfClassConstructor_2 {
	public static void main(String[] args) {
		AAA a1 = new AAA() {
			@Override
			public BBB abc(int k) {
				return new BBB(3);
			}
		};
		AAA a2 = (int k) -> new BBB(3);
		AAA a3 = BBB::new;
		a1.abc(3);
		a2.abc(3);
		a3.abc(3);
	}

}
