package oop9;

public class TVTest {
	public static void main(String[] args) {
		HyundaiTV tv = new HyundaiTV();
//		SamsungTV tv = new SamsungTV();
		tv.powerOn();
		tv.powerOff();
		tv.ChannelUp();
		tv.ChannelDown();
		tv.soundUp();
		tv.soundDown();
	}
}
