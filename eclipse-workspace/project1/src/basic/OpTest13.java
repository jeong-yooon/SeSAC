package basic;

public class OpTest13 {
	public static void main(String[] args) {
		int n = 23;
		// n이 양수인지 음수인지 판별
		System.out.print(n > 0 ? "양수" : n < 0 ? "음수" : "양수도 음수도 아님");
		System.out.print(n % 2 == 1 ? "홀수" : "짝수");
		
	}
}
