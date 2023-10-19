package control;

public class WhileTest3 {
	public static void main(String[] args) {
		int a = 2;
		while(a <= 9) {
			int b = 1;
			while(b <= 9) {
				int c = 0;
				while(c <= 3) {
					System.out.print((a+c)+"*"+b+"="+((a+c)*b)+"\t");
					c++;
				}
				System.out.println("\n");
				b++;
			}
			System.out.println("\n");
			a += 4;
		}
	}
}

