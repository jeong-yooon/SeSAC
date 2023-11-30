package net.developia.spring01.di202e;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("di202e/app.properties")
public class MessageBeanImpl implements MessageBean {
	@Value("${name}") 
	private String name;
	
	@Value("${greeting}") 
	private String greeting;
	
	private FileOutputter fileOutputter;
	
	public MessageBeanImpl(FileOutputter fileOutputter) {
		this.fileOutputter = fileOutputter;
	}

	@Override
	public void sayHello() {
		System.out.println(name + "님, " + greeting);
		try {
			fileOutputter.outputter(name + "님, " + greeting);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
