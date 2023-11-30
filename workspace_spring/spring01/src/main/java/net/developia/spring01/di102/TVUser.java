package net.developia.spring01.di102;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {
	public static void main(String[] args) {
		ApplicationContext context =
				new GenericXmlApplicationContext("di102/beaninit.xml");
		
		System.out.println("---------------------------");
		TV tv = (TV) context.getBean("tv");
		tv.powerOn();
		tv.channelUp();
		tv.channelUp();
		tv.soundUp();
		tv.soundUp();
		tv.soundDown();
		tv.powerOff();	
	}
}
