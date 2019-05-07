package com.palim.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDataDAO {

	private SqlSessionFactory sqlSessionFactory;
	
	public UserDataDAO() {
		InputStream inputStream = null;
		try {
			String resource = "com/palim/dao/mapper/myBatis-Config.xml";
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	/**1. 회원가입 */
	public boolean addMember(String userID, String password, String nickname, String phone, String alarm) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String, String> inputData = new HashMap<>();
		inputData.put("userID", userID);
		inputData.put("password", password);
		inputData.put("nickname", nickname);
		inputData.put("phone", phone);
		inputData.put("alarm", alarm);
		try {
			if(session.insert("userdataMapper.addMember", inputData)==1) {
				result = true;
			}
			session.commit();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**2. 로그인*/
	public Map<String, String> login(String userID, String password){
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> inputData = new HashMap<>();
		inputData.put("userID", userID);
		inputData.put("password", password);
		Map<String, String> result = new HashMap<String, String>();
		try {
			result = (Map<String, String>)session.selectOne("userdataMapper.login", inputData);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**아이디 중복확인, 비밀번호찾기 본인확인*/
	public boolean checkID(String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		try {
			if((String)session.selectOne("userdataMapper.checkID", userID) != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**가입된 유저 비밀번호 찾기 */
	public boolean checkValidID(String userID) {
		SqlSession session = sqlSessionFactory.openSession();		
		boolean result = false;
		try {
			if((String)session.selectOne("userdataMapper.checkValidID", userID) != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	/**닉네임 중복확인*/
	public boolean checkNickname(String nickname) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		try {
			if((String)session.selectOne("userdataMapper.checkNickname", nickname) != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**폰 번호 중복확인*/
	public boolean checkPhone(String phone) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		try {
			if((String)session.selectOne("userdataMapper.checkPhone", phone) != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**아이디 찾기*/
	public String informID(String phone) {
		SqlSession session = sqlSessionFactory.openSession();
		String result = "";
		try {
			result = (String)session.selectOne("userdataMapper.informID", phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**회원정보 수정 시, 탈퇴 시 본인확인(비번)*/
	public boolean checkPW(String userID, String password) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String, String> inputData = new HashMap<>();
		inputData.put("userID", userID);
		inputData.put("password", password);
		try {
			if((String)session.selectOne("userdataMapper.checkPW", inputData) != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
		
	}
	
	/**비밀번호 수정*/
	public boolean updatePW(String password, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String, String> inputData = new HashMap<>();
		inputData.put("userID", userID);
		inputData.put("password", password);
		try {
			if(session.update("userdataMapper.updatePW", inputData) == 1) {
				result = true;
			}
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**폰번호 수정*/
	public boolean updatePhone(String phone, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String, String> inputData = new HashMap<>();
		inputData.put("phone", phone);
		inputData.put("userID", userID);
		try { 
			if(session.update("userdataMapper.updatePhone", inputData) == 1) {
				result = true;
			}
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**닉네임 수정*/
	public boolean updateNickname(String nickname, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String, String> inputData = new HashMap<>();
		inputData.put("userID", userID);
		inputData.put("nickname", nickname);
		try {
			if(session.update("userdataMapper.updateNickname", inputData) == 1) {
				result = true;
			}
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**알림방법 수정*/
	public boolean updateAlarm(String alarm, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String, String> inputData = new HashMap<>();
		inputData.put("userID", userID);
		inputData.put("alarm", alarm);
		try {
			if(session.update("userdataMapper.updateAlarm", inputData) == 1) {
				result = true;
			}
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**회원 탈퇴*/
   public boolean dropUser(String userID, String password) {
	      SqlSession session = sqlSessionFactory.openSession();
	      boolean result = false;
	      Map<String, String> inputData = new HashMap<>();
	      inputData.put("userID", userID);
	      inputData.put("password", password);
	      try {
	         if(session.update("userdataMapper.dropUser", inputData) == 1) {
	        	session.update("hopeDataMapper.deleteHopeData", userID);
	            result = true;
	         }
	         session.commit();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         session.close();
	      }
	      return result;
	   }
	
}