package control;

public class WhileTest2 {
	public static void main(String[] args) {
		// 1부터 1000까지 3의 배수의 정수의 합계
		int a = 0;
		int sum = 0;
		while(a<=1000) {
			if (a % 3 == 0) {
				sum += a;
			}
			sum += a;
			a++;
		}
		System.out.println(sum);
		
		int b = 0;
		sum = 0;
		while(b<=1000) {
			if (b % 3 == 0) {
				sum += b;
			}
			sum += b;
			b+=3;
		}
		System.out.println(sum);
	}
}
