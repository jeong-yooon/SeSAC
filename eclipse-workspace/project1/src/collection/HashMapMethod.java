package collection;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class HashMapMethod {
	public static void main(String[] args) {
		Map<Integer, String> hMap1 = new HashMap<Integer, String>();
		hMap1.put(2, "나다라");
		hMap1.put(1, "가나다");
		hMap1.put(3, "다라마");
		System.out.println(hMap1.toString());
		
		Map<Integer, String> hMap2 = new HashMap<Integer, String>();
		hMap2.putAll(hMap1);
		System.out.println(hMap2.toString());
		
		hMap2.replace(1, "가가가");
		hMap2.replace(4, "라라라");
		System.out.println(hMap2.toString());
		
		hMap2.replace(1, "가가가","나나나");
		hMap2.replace(1, "다다다","라라라");
		System.out.println(hMap2.toString());
		
		System.out.println(hMap2.get(1));
		System.out.println(hMap2.get(2));
		System.out.println(hMap2.get(3));
		
		System.out.println(hMap2.containsKey(1));
		System.out.println(hMap2.containsKey(5));
		
		System.out.println(hMap2.containsKey("나나나"));
		System.out.println(hMap2.containsKey("다다다"));
		
		Set<Integer> keySet = hMap2.keySet();
		System.out.println(keySet.toString());
		
		Set<Map.Entry<Integer,String>> entrySet = hMap2.entrySet();
		System.out.println(entrySet.toString());
		
		System.out.println(hMap2.size());
		
		hMap2.remove(1);
		hMap2.remove(4);
		System.out.println(hMap2.toString());
		
		hMap2.remove(2, "나다라");
		hMap2.remove(2, "다다다");
		System.out.println(hMap2.toString());
		
		hMap2.clear();
		System.out.println(hMap2.toString());
	}

}
