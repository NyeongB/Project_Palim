package com.palim.test;

import java.util.HashMap;
import java.util.Map;

public class UserDataDAOTest {

	public static void main(String[] args) {
		UserDataDAOTest dao = new UserDataDAOTest();
		Map<String, String> inputData = new HashMap<String, String>();
		inputData.put("userID", "1212");
		inputData.put("password", "1212");
		inputData.put("nickname", "1212");
		inputData.put("phone", "010123412345");
		inputData.put("alarm", "B");
	}

}
