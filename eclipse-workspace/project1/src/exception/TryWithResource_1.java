package exception;

import java.io.IOException;
import java.io.InputStreamReader;

public class TryWithResource_1 {

	public static void main(String[] args) {
		 System.out.println("문자를 입력하세요!");
		 
		try (InputStreamReader isr1 = new InputStreamReader(System.in);) {
			char input = (char)isr1.read();
			System.out.println("입력 글자 = " + input);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		InputStreamReader isr2=null;
		try {
			isr2 = new InputStreamReader(System.in);
			char input = (char)isr2.read();
			System.out.println("입력 글자 = " + input);
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			if(isr2!=null) {
				try {
					isr2.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

}
