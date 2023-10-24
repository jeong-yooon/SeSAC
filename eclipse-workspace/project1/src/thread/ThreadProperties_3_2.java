package thread;

class MyThread_2 extends Thread {
	@Override
	public void run() {
		System.out.println(getName() + ": " + (isDaemon()? "데몬 쓰레드":"일반 쓰레드"));
		for(int i = 0; i < 6; i++) {
			System.out.println(getName() + ": " + i + "초");
			try {Thread.sleep(1000);} catch (InterruptedException e) {}
		}
	}
}

public class ThreadProperties_3_2 {
	public static void main(String[] args) {
		
		// 데몬 쓰레드
		Thread thread2 = new MyThread_2();
		thread2.setDaemon(true);
		thread2.setName("thread2");
		thread2.start();
		
		try {Thread.sleep(3500);} catch (InterruptedException e) {}
		System.out.println("main Thread 종료");
	}
}
