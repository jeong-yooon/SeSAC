package lambda;

interface AA {
	int[] abc(int len);
}

public class RefOfArrayConstructor {
	public static void main(String[] args) {
		AA a1 = new AA() {
			@Override
			public int[] abc(int len) {
				return new int[len];
			}
		};
		AA a2 = (int len) -> {
			return new int[len];
		};
		
		AA a3 = int[]::new;
		int[] array1 = a1.abc(3);
		System.out.println(array1.length);
		int[] array2 = a1.abc(3);
		System.out.println(array2.length);
		int[] array3 = a1.abc(3);
		System.out.println(array3.length);
	}
}
