package jdbc;

import org.apache.commons.codec.digest.DigestUtils;

public class LoginTest0 {

	public static void main(String[] args) {
		System.out.println(DigestUtils.sha512Hex("1234"));
	}

}
