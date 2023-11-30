package net.developia.spring01.di202e;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class MessageBeanTest {
	public static void main(String[] args) {
		ApplicationContext context =
				new AnnotationConfigApplicationContext("net.developia.spring01.di202e");
		MessageBean mb = context.getBean(MessageBean.class);
		mb.sayHello();
	}
}
