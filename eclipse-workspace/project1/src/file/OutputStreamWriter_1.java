package file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.io.OutputStream;

public class OutputStreamWriter_1 {
	public static void main(String[] args) {
		File outputStreamWriter1 = new File("src/sec05_readerwriter/files/OutputStreamWriter1.txt");
		try(Writer writer = new FileWriter(outputStreamWriter1);) {
			writer.write("OuputStreamWriter1 예제파일입니다.\n".toCharArray());
			writer.write("한글과 영문이 모두 포함돼 있습니다.");
			writer.write('\n');
			writer.write("Good Bye!!!n\n");
			writer.flush();
		} catch(IOException e) {}
		File outputStreamWriter2 = new File("src/sec05_readerwriter/files/Output-StreamWriter2.txt");
		try(OutputStream os = new FileOutputStream(outputStreamWriter2, false);
				OutputStreamWriter osw = new OutputStreamWriter(os, "MS959");){
				osw.write("OutputStreamWriter1 예제파일입니다.\n".toCharArray());
				osw.write("한글과 영문이 모두 포함돼 있습니다.");
				osw.write('\n');
				osw.write("Good Bye!!!\n\n");
				osw.flush();
				System.out.println(osw.getEncoding());
		} catch(IOException e) {}
	}

}
