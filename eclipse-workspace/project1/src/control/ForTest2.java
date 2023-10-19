package control;

public class ForTest2 {
	public static void main(String[] args) {
		// 1부터 1000까지 3의 배수의 정수의 합계
		int a = 0;
		for (int i=1; i<=1000 ; i++ ) {
			if (i % 3 == 0) {
				a += i;
			}
			a += i;
		}
		System.out.println(a);
		
		for (int i=3; i<=1000 ; i+=3 ) {
			if (i % 3 == 0) {
				a += i;
			}
			a += i;
		}
		System.out.println(a);
	}
}
