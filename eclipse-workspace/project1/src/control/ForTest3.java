package control;

public class ForTest3 {
	public static void main(String[] args) {
		for(int i=2; i<=9; i+=4) {
			for(int j=1; j<=9; j++) {
				for (int k=0; k<=3; k++) {
					System.out.print((i+k)+"*"+j+"="+((i+k)*j)+"\t");
				}
				System.out.println("\n");
			}
			System.out.println("\n");
		}
	}
}
