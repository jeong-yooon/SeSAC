package exception;

public class ExceptionTest3 {

	public static void main(String[] args) {
		try {
			System.out.println("a() 호출전");
			a();
			System.out.println("a() 호출후");
		} catch (Exception e) {
			System.out.println("메인 메서드의 catch블럭");
			e.printStackTrace();
		} finally {
			System.out.println("메인 메서드의 finally블럭");
		}	
		System.out.println("수행완료");
	}
	
	public static void a() {
		try {
			System.out.println("b() 호출");
			b();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static void b() {
		try {
			System.out.println("b() 호출");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
