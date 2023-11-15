package file;

import java.io.File;

public class FileMethods {
	public static void main(String[] args) {
		File tempDir = new File("/Users/jeong-yoon/temp");
		if(!tempDir.exists())
			tempDir.mkdir();
		File file = new File("/Users/jeong-yoon");
		
		System.out.println("절대 경로: " + file.getAbsolutePath());
		System.out.println("폴더(?): " + file.isDirectory());
		System.out.println("파이(?): " + file.isFile());
		System.out.println("파일/폴더: " + file.getName());
		System.out.println("부모 폴더: " + file.getAbsolutePath());
		File newfile1 = new File("/Users/jeong-yoon/temp/abc");
		System.out.println(newfile1.mkdir());
		File newfile2 = new File("/Users/jeong-yoon/temp/bcd/cde");
		System.out.println(newfile2.mkdir());
		System.out.println(newfile2.mkdirs());
		File[] fnames = file.listFiles();
		for(File fname: fnames) {
			System.out.println((fname.isDirectory()? "폴더: ":"파일: ") + fname.getName());
		}
	}
}
