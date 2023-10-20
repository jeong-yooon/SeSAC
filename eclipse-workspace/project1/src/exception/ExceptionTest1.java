package exception;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

public class ExceptionTest1 {

	public static void main(String[] args) throws FileNotFoundException {
		InputStreamReader isr = new InputStreamReader(System.in);
		FileInputStream fis = new FileInputStream("test.txt");

	}

}
