package control;

public class SwitchTest1 {
	public static void main(String[] args) {
		int n = 2;
		switch (n) {
		case 1:
			System.out.println("남");
			break;
		case 2:
			System.out.println("여");
			break;
		case 3:
			System.out.println("남");
			break;
		case 4:
			System.out.println("여");
			break;
		default:
			System.out.print("에러");
			break;
		}
	}
}
