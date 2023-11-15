package file;

import java.io.File;
import java.io.OutputStream;

public class BufferedInputOutputStream {
	public static void main(String[] args) {
		File orgfile = new File("src/sec02_fileinputoutputstream/files/mycat_ori-gin.jpg");
		File copyfile1 = new File("src/sec02_fileinputoutputstream/files/mycat_copy1.jpg");
		File copyfile2= new File("src/sec02_fileinputoutputstream/files/mycat_copy2.jpg");
		long start, end, time1, time2;
		start = System.nanoTime();
		try(InputStram is = new FileInputStream(orgfile);
				OutputStream os = new FileOutputStream(copyfile1);){
			int data;
			while((data = is.read(()) != -1){
				os.write(data);
			}
		}
	}
}
