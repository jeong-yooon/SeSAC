package exception;

class AA{}
class B extends AA{}

public class UncheckedException {
	public static void main(String[] args) {
		System.out.println(3 / 0);
		
		AA a = new AA();
		B b = (B)a;
		
		int[] array = {1, 2, 3};
		System.out.println(array[3]);
		
		int num = Integer.parseInt("10!");
		
		String str = null;
		System.out.println(str.charAt(2));
	}
}
