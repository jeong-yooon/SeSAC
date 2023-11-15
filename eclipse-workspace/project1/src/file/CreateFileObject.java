package file;

import java.io.File;
import java.io.IOException;

public class CreateFileObject {
	public static void main(String[] args) throws IOException {
		File tempDir = new File("/Users/jeong-yoon/temp");
		if(!tempDir.exists())
			tempDir.mkdir();
		System.out.println(tempDir.exists());
		File newFile = new File("/Users/jeong-yoon/temp/newFile.txt");
		if(!newFile.exists())
			newFile.createNewFile();
		System.out.println(newFile.exists());
		System.out.println();
		
		File newFile2 = new File("\\Users\\jeong-yoon\\temp\\newFile.txt");
		File newFile3 = new File("/Users/jeong-yoon/temp/newFile.txt");
		File newFile4 = new File("Users" + File.separator + "jeong-yoon" + File.separator + "temp" + File.separator + "newFile.txt");
		
		System.out.println(newFile2.exists());
		System.out.println(newFile2.exists());
		System.out.println(newFile2.exists());
		System.out.println();
		
		File newFile5 = new File("/Users/jeong-yoon/abc/newFile.txt");
		File newFile6 = new File("/Users/jeong-yoon/abc/bcd/newFile.txt");
		System.out.println(newFile5.getAbsolutePath());
		System.out.println(newFile6.getAbsolutePath());
		
		System.out.println(System.getProperty("user.dir"));
		File newFile7 = new File("newFile1.txt");
		File newFile8 = new File("bcd/newFile2.txt");
		System.out.println(newFile7.getAbsolutePath());
		System.out.println(newFile8.getAbsolutePath());
	}

}
