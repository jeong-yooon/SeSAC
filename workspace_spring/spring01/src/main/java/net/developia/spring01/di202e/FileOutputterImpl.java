package net.developia.spring01.di202e;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("di202e/app.properties")
public class FileOutputterImpl implements FileOutputter {
	@Value("${fileName}")
	private String name;
	
	@Override
	public void outputter(String msg) throws IOException {
		File file = new File(name);
		FileWriter fw = new FileWriter(file);
		fw.write(msg);
		fw.close();
	}
}
