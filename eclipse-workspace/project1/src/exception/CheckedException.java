package exception;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

class A implements Cloneable {
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}

public class CheckedException {
	public static void main(String[] args) throws InterruptedException, ClassNotFoundException, IOException, CloneNotSupportedException {
		Thread.sleep(1000);
		
		Class cls = Class.forName("java.lang.Object");
		
		InputStreamReader in = new InputStreamReader(System.in);
		in.read();
		
		FileInputStream fis = new FileInputStream("text.txt");
		
		A a1 = new A();
		A a2 = (A)a1.clone();
	}
}
