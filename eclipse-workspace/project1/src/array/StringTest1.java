package array;

public class StringTest1 {

	public static void main(String[] args) {
		String str = "안녕하세요";
		System.out.println(str);
		
		StringBuffer sb = new StringBuffer("실수란 ");
		System.out.println(sb.length() + ":" + sb.capacity());
		sb.append("신을 용서하는 ");
		System.out.println(sb.length() + ":" + sb.capacity());
		sb.append("인간의 행위이다");
		System.out.println(sb.length() + ":" + sb.capacity());
		sb.append("~~");
		System.out.println(sb.length() + ":" + sb.capacity());
	}

}
