package oop9;

// 인터페이스에서는 public abstract를 굳이 명시해주지 않아도 알아서 인식한다.
public interface TV {
	public abstract void powerOn();
	public abstract void powerOff();
	public abstract void ChannelUp();
	public abstract void ChannelDown();
	public abstract void soundUp();
	public abstract void soundDown();
	// default를 붙여주면 인터페이스에서도 바디를 붙일 수 있다.
	public default void setSpeaker(Speaker orangeSpeaker) {
		
	};
}
