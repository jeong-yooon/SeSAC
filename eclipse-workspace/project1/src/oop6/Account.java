package oop6;

public class Account {
	int money1;
	int money2;
	
	public Account(int money) {
		this.money1 += money;
		this.money2 += money;
	}
	
	@Override
	public String toString() {
		return "money1: " + money1 + ", money2:" + money2;
	}
}