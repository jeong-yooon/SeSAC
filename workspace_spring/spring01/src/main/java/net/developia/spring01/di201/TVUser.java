package net.developia.spring01.di201;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {
	public static void main(String[] args) {
		ApplicationContext context =
				new AnnotationConfigApplicationContext("net.developia.spring01.di201");
		
		System.out.println("---------------------------");
		TV tv = context.getBean(TV.class);
		tv.powerOn();
		tv.channelUp();
		tv.channelUp();
		tv.soundUp();
		tv.soundUp();
		tv.soundDown();
		tv.powerOff();	
	}
}
