package com.palim.dao; 

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class HopeDataDAO {
	
	private SqlSessionFactory sqlSessionFactory;

	public HopeDataDAO() {
		InputStream inputStream = null;
		
		try {
			String resource = "com/palim/dao/mapper/myBatis-Config.xml";
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	
	public boolean addHopeList(String productID, String productImg, String productLink, String productTitle, int hopePrice, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String,String> inputData = new HashMap<>();
		inputData.put("productID", String.valueOf(productID));
		inputData.put("productImg", productImg);
		inputData.put("productLink", productLink);
		inputData.put("productTitle", productTitle);
		inputData.put("hopePrice", String.valueOf(hopePrice));
		inputData.put("userID", userID);
		try {
			if(session.insert("hopeDataMapper.addHopeList", inputData) == 1) {
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
	
	public boolean addLowPricePerDay(int lprice, int hopeDataSeq, int productType) { //product type
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String,String> inputData = new HashMap<>();
		inputData.put("lprice", String.valueOf(lprice));
		inputData.put("hopeDataSeq", String.valueOf(hopeDataSeq));
		inputData.put("productType", String.valueOf(productType));
		try { 
			if(session.insert("hopeDataMapper.addLowPricePerDay", inputData) == 1) {
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
	
	public boolean checkDuplicateHopeProduct(String userID, String productID){
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String,String> inputData = new HashMap<>();
		inputData.put("userID", userID);
		inputData.put("productID", productID);		
		try {
			if(session.selectOne("hopeDataMapper.checkDuplicateHopeProduct", inputData)!= null) {
				result = true;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public Collection<Map<String, String>> getAllHopeListToday() {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> result = null;
		try {
			result = session.selectList("hopeDataMapper.getAllHopeListToday");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public Collection<Map<String, String>> getAllHopeListYesterday() {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> result = null;
		try {
			result = session.selectList("hopeDataMapper.getAllHopeListYesterday");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public boolean updateHopePrice(String hopePrice, String productID, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String,String> inputData = new HashMap<>();
		inputData.put("hopePrice", hopePrice);
		inputData.put("productID", productID);
		inputData.put("userID", userID);
		try {
			if(session.update("hopeDataMapper.updateHopePrice", inputData) == 1) {
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
	
	public boolean deleteHopeProduct(String productID, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		boolean result = false;
		Map<String,String> inputData = new HashMap<>();
		inputData.put("productID", productID);
		inputData.put("userID", userID);
		try {
			if(session.update("hopeDataMapper.deleteHopeProduct", inputData) == 1) {
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
	
	public int getLowPriceFirstDay(String productID, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		Map<String,String> inputData = new HashMap<>();
		inputData.put("productID", productID);
		inputData.put("userID", userID);
		try {
			result = (int)session.selectOne("hopeDataMapper.getLowPriceFirstDay", inputData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public Collection<Map<String, String>> orderByRegistrationPage(String userID, int page) {
		SqlSession session = sqlSessionFactory.openSession();
		Map inputData = new HashMap();
		int min=(page-1)*5;
		int max=(page)*5;
		inputData.put("userID", userID);
		inputData.put("minRowNum", min);
		inputData.put("maxRowNum", max);
		Collection<Map<String, String>> result = null;
		try {
			result = session.selectList("hopeDataMapper.orderByRegistrationPage", inputData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}		
		return result;
	}
	
	public Collection<Map<String, String>> orderByRegistrationDescPage(String userID, int page) {
		SqlSession session = sqlSessionFactory.openSession();
		Map inputData = new HashMap();
		int min=(page-1)*5;
		int max=(page)*5;
		inputData.put("userID", userID);
		inputData.put("minRowNum", min);
		inputData.put("maxRowNum", max);
		Collection<Map<String, String>> result = null;
		try {
			result = session.selectList("hopeDataMapper.orderByRegistrationDescPage", inputData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}		
		return result;
	}
	
	public Collection<Map<String, String>> orderByLpricePage(String userID, int page) {
		SqlSession session = sqlSessionFactory.openSession();
		Map inputData = new HashMap();
		int min=(page-1)*5;
		int max=(page)*5;
		inputData.put("userID", userID);
		inputData.put("minRowNum", min);
		inputData.put("maxRowNum", max);
		Collection<Map<String, String>> result = null;
		try {
			result = session.selectList("hopeDataMapper.orderByLowPricePage", inputData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	public Collection<Map<String, String>> orderByHpricePage(String userID, int page) {
		SqlSession session = sqlSessionFactory.openSession();
		Map inputData = new HashMap();
		int min=(page-1)*5;
		int max=(page)*5;
		inputData.put("userID", userID);
		inputData.put("minRowNum", min);
		inputData.put("maxRowNum", max);
		Collection<Map<String, String>> result = null;
		try {
			result = session.selectList("hopeDataMapper.orderByHopePricePage", inputData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	public Collection<Map<String, String>> getProductInfo() { 
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> result = null;
		try {
			result = session.selectList("hopeDataMapper.getProductInfo");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public Collection<Map<String, String>> getLowPrice(String productID, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		Collection<Map<String, String>> result = null;
		Map<String,String> inputData = new HashMap<>();
		inputData.put("productID", productID);
		inputData.put("userID", userID);
		try {
			result = session.selectList("hopeDataMapper.getLowPrice", inputData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public List<Map<String, String>> getGraphData(String productID, String userID) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> result= new ArrayList();
		List<Map<String, String>> lowPriceList=(List)getLowPrice(productID, userID);
		int maxNum = lowPriceList.size();
		int gap=1;
		gap=(lowPriceList.size()/8)+1;
		for(int i=0; i<lowPriceList.size(); i+=gap){
			result.add(lowPriceList.get(i));
		}		
		return result;
	}
	
	public Collection<Map<String, String>> getSeizeToday(int maxNum) {
        Collection<Map<String, String>> result = new ArrayList<>();
        Map<Double, String> resultMap = new HashMap();      
        Collection<Map<String, String>> todayList = new ArrayList();
        Collection<Map<String, String>> yesterdayList = new ArrayList();
        todayList = getAllHopeListToday();
        yesterdayList = getAllHopeListYesterday();
        Map<String, Integer> todayMap = new HashMap();
        Map<String, Integer> yesterdayMap = new HashMap();
        int value1, value2;
        int cnt=1;
        double percentage;
        
        for(Map<String, String> t : todayList){
           todayMap.put(String.valueOf(t.get("PRODUCT_ID")), Integer.parseInt(String.valueOf(t.get("LPRICE"))));
        }
        
        for(Map<String, String> y : yesterdayList){
           yesterdayMap.put(String.valueOf(y.get("PRODUCT_ID")), Integer.parseInt(String.valueOf(y.get("LPRICE"))));
        }
        
        Set<String> keySet = todayMap.keySet();
        Iterator<String> keyIterator = keySet.iterator();
        while(keyIterator.hasNext()) {
           String key = keyIterator.next();
           if(!yesterdayMap.containsKey(key)){
               continue;
            }
           value1 = yesterdayMap.get(key);
           value2 = todayMap.get(key);
           percentage=(value1/1.0-value2/1.0)/value1/1.0;
           resultMap.put(percentage, key);
        }
         TreeMap<Double, String> treeMapReverse = new TreeMap<Double, String>(Collections.reverseOrder());
             treeMapReverse.putAll(resultMap);
      
             Iterator<Double> treeMapReverseIter = treeMapReverse.keySet().iterator();

             while( treeMapReverseIter.hasNext()) {               
                 double key = treeMapReverseIter.next();
                 String value = treeMapReverse.get( key );
             
             Map<String, String> m = new HashMap();
             for(Map<String, String> t : todayList){
              if(String.valueOf(t.get("PRODUCT_ID")).equals(value)){
                 m.put("lPrice", String.valueOf(t.get("LPRICE")));
                 m.put("productTitle", t.get("PRODUCT_TITLE"));
                 m.put("productImg", t.get("PRODUCT_IMG"));
                 m.put("productLink", t.get("PRODUCT_LINK"));
                 m.put("percentage", ""+key);
              }
           }
             result.add(m);
             if(cnt==maxNum) break;   
             cnt++;
         }
        return result;
     }
  
	public int countAllPages(String userID) {
	      SqlSession session = sqlSessionFactory.openSession();
	      int totalPage = 1;
	      try {
	         int result = session.selectOne("hopeDataMapper.countAllHopeData", userID);
	         totalPage=((result-1)/5)+1;
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         session.close();
	      }
	      return totalPage;
	   }
	
	public Collection<String> getLowData() {
		Collection<String> result= new ArrayList();	
		Collection<Map<String, String>> todayList = new ArrayList();
		Collection<Map<String, String>> yesterdayList = new ArrayList();
		todayList = getAllHopeListToday();
		yesterdayList = getAllHopeListYesterday();
		Map<String, Integer> yesterdayMap = new HashMap();
		Map<String, Integer> todayMap = new HashMap();		
		int value1, value2;
		for(Map<String, String> t : todayList){
			todayMap.put(String.valueOf(t.get("PRODUCT_ID")), Integer.parseInt(String.valueOf(t.get("LPRICE"))));
		}		
		for(Map<String, String> y : yesterdayList){
			yesterdayMap.put(String.valueOf(y.get("PRODUCT_ID")), Integer.parseInt(String.valueOf(y.get("LPRICE"))));
		}
		Set<String> keySet = todayMap.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()) {
			String key = keyIterator.next();
			if(!yesterdayMap.containsKey(key)){
	              continue;
	           }
			value1 = yesterdayMap.get(key);
			value2 = todayMap.get(key);
			if(value1>value2)
			result.add(key);
		}
		return result;
	}
	
	public Collection<Map<String, String>> sendAlarmList(String productID) {
		SqlSession session = sqlSessionFactory.openSession();		
		Collection<Map<String, String>> result =new ArrayList();
		try {
			result=session.selectList("hopeDataMapper.sendAlarm", productID);			
		} catch (Exception e) {
	         e.printStackTrace();
	    } finally {
	         session.close();
	    }
		return result;
	}	
	
	public int getHopeDataSeq(String productID, String userID) {
		SqlSession session = sqlSessionFactory.openSession();		
		int result=0;
		Map<String, String> inputData = new HashMap();
		inputData.put("userID", userID);
		inputData.put("productID", productID);
		try {
			result=(int)session.selectOne("hopeDataMapper.getHopeDataSeq", inputData);	
		} catch (Exception e) {
	         e.printStackTrace();
	    } finally {
	         session.close();
	    }
		return result;
	}
	
	public boolean updateAlarmProduct(String productID, String userID) {
	      SqlSession session = sqlSessionFactory.openSession();      
	      boolean result=false;
	      Map<String, String> inputData = new HashMap();
	      inputData.put("userID", userID);
	      inputData.put("productID", productID);
	      try {
	         if(session.update("hopeDataMapper.deleteHopeProduct", inputData) == 1)
	            result=true;
	      } catch (Exception e) {
	            e.printStackTrace();
	       } finally {
	            session.close();
	       }
	      return result;
	   }
	
	
}