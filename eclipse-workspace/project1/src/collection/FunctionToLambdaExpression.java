package collection;

interface AA {
	void method1();
}

interface BB {
	void method2(int a);
}

interface CC {
	int method3();
}

interface DD {
	double method4(int a, double b);
}

public class FunctionToLambdaExpression {
	public static void main(String[] args) {
		AA a1 = new AA() {
			@Override
			public void method1() {
				System.out.println("입력 x 리턴 x 함수");
			}
		};
		
		AA a2 = () -> {System.out.println("입력 x 리턴 x 함수");};
		AA a3 = () -> System.out.println("입력 x 리턴 x 함수");
		
		BB b1 = new BB() {
			@Override
			public void method2(int a) {
				System.out.println("입력 O 리턴 x 함수");
			}
		};
		BB b2 = (int a) -> {System.out.println("입력 O 리턴 x 함수");};
		BB b3 = (a) -> {System.out.println("입력 O 리턴 x 함수");};
		BB b4 = (a) -> System.out.println("입력 O 리턴 x 함수");
		BB b5 = a -> System.out.println("입력 O 리턴 x 함수");
		
		CC c1 = new CC() {
			@Override
			public int method3() {
				return 4;
			}
		};
		
		CC c2 = () -> {return 4;};
		CC c3 = () -> 4;
		
		DD d1 = new DD() {
			@Override
			public double method4(int a, double b) {
				return a + b;
			}
		};
		
		DD d2 = (int a, double b) -> {return a + b;};
		DD d3 = (a, b) -> {return a + b;};
		DD d4 = (a, b)-> a + b;
	}

}
