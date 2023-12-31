package oop9;

import java.util.Properties;

import java.io.FileInputStream;

public class TVTest {
	public static void main(String[] args) {
		
		Properties pr = new Properties();
		try {
		pr.load(new FileInputStream("src/oop9/product.properties"));
		String tvClass = pr.getProperty("tv");
		String speakerClass = pr.getProperty("speaker");
		Class tvClazz = Class.forName(tvClass);
		Class speakerClazz = Class.forName(speakerClass);
		TV tv = (TV) tvClazz.getConstructor(null).newInstance(); // new HyundaiTV();
		Speaker sp = (Speaker) speakerClazz.getConstructor(null).newInstance(); // new HarmanSpeaker(); 
		
//		TV tv = new HyundaiTV();
//		TV tv = new SamsungTV();
		tv.setSpeaker(sp);
		tv.powerOn();
		tv.powerOff();
		tv.ChannelUp();
		tv.ChannelDown();
		tv.soundUp();
		tv.soundDown();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
// samsungTV에 OrangeSpeaker 연결
