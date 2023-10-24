package thread;

class MIFileRunnable implements Runnable {
	@Override
	public void run() {
		String[] strArray = {"하나", "둘", "셋", "넷", "다섯"};
		try {Thread.sleep(10);} catch (InterruptedException e) {}
		for (int i = 0; i < strArray.length; i++) {
			System.out.println(" - (자막 번호) " + strArray[i]);
			try {Thread.sleep(200);} catch (InterruptedException e) {}
		}
	}
}

class VideoFileRunnable implements Runnable {
	@Override
	public void run() {
		int[] intArray = {1,2,3,4,5};
		for (int i = 0; i < intArray.length; i++) {
			System.out.print("(비디오 프레임)" + intArray[i]);
			try {Thread.sleep(200);} catch (InterruptedException e) {}
		}
	}
}

public class CreateAndStartThread_M2C2 {
	public static void main(String[] args) {
		Runnable smiFileRunnable = new SMIFileRunnable();
		Thread thread1 = new Thread(smiFileRunnable);
		thread1.start();
		Runnable videoFileRunnable = new VideoFileRunnable();
		Thread thread2 = new Thread(videoFileRunnable);
		thread2.start();
	}

}
