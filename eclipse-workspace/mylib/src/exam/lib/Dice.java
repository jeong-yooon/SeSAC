package exam.lib;

public class Dice {
//	public void roll() { // 자바 콘솔에서만 기능을 수행할 수 있다.
//		System.out.println((int)(Math.random() * 6 + 1));
//	}
	public int roll2() { // 안드로이드나 웹에서도 사용할 수 있다.
		return (int)(Math.random() * 6 + 1);
	}
}
