package exception;

class AAA implements AutoCloseable {
	String resource;
	AAA(String resouce) {
		this.resource = resouce;
	}
	@Override
	public void close() throws Exception {
		if(resource!=null) {
			resource=null;
			System.out.println("리소스가 해제됐습니다.");
		}
	}
}

public class TryWithResouce_2 {
	public static void main(String[] args) {
		AAA a1 = null;
		try {
			a1 = new AAA("특정 파일");
		} catch (Exception e) {
			System.out.println("예외 처리");
		} finally {
			if(a1.resource!=null) {
				try {
					a1.close();
				} catch (Exception e) {}
			}
		}
	
		try(AAA a2 = new AAA("특정 파일");) {
			
		} catch(Exception e) {
			System.out.println("예외처리");
		}
	}
}
