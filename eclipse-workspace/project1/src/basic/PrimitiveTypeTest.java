package basic;

import java.math.BigDecimal;

public class PrimitiveTypeTest {
	public static void main(String[] args) {
		boolean b = true;
		System.out.println(b);
		
		byte b2 = 127; // 127을 넘 숫자는 byte에서 사용할 수 없다.
		System.out.println(b2);
		
		char c = '뷁';
		System.out.println(c);
		char 뷁 = '헐';
		System.out.println(뷁);
		
		short s = 32767;
		System.out.println(s);
		
		int i = 2147483647 + 1;
		System.out.println(i);
		
		long l1 = 2147483648L;
		System.out.println(l1);
		
		double p = 3.1415926535;
		System.out.println(p);
		
		float p2 = 3.1415926535f;
		System.out.println(p2);
		
		System.out.println(2 - 1.1);
		BigDecimal bd1 = new BigDecimal("2");
		BigDecimal bd2 = new BigDecimal("1.1");
		System.out.println(bd1.subtract(bd2));
//		double p1 = 
	}
}
