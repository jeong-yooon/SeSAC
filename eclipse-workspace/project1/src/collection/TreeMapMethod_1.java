package collection;

import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.SortedMap;
import java.util.TreeMap;

public class TreeMapMethod_1 {
	public static void main(String[] args) {
		TreeMap<Integer, String> treeMap = new TreeMap<Integer, String>();
		for(int i = 20; i > 9; i -= 2) {
			treeMap.put(i, i+"번째 데이터");
		}
		System.out.println(treeMap.toString());
		
		System.out.println(treeMap.firstKey());
		
		System.out.println(treeMap.firstEntry());
		
		System.out.println(treeMap.lastKey());
		
		System.out.println(treeMap.lastEntry());
		
		System.out.println(treeMap.lowerKey(11));
		System.out.println(treeMap.lowerKey(10));
		
		System.out.println(treeMap.higherKey(11));
		System.out.println(treeMap.higherKey(10));
		
		System.out.println(treeMap.pollFirstEntry());
		System.out.println(treeMap.toString());
		
		System.out.println(treeMap.pollLastEntry());
		System.out.println(treeMap.toString());

		SortedMap<Integer, String> sortedMap = treeMap.headMap(8);
		System.out.println(sortedMap);
		
		NavigableMap<Integer, String> navigableMap = treeMap.headMap(8, true);
		System.out.println(navigableMap);
		
		sortedMap = treeMap.tailMap(14);
		System.out.println(sortedMap);
		
		navigableMap = treeMap.tailMap(14, false);
		System.out.println(navigableMap);
		
		sortedMap = treeMap.subMap(6, 10);
		System.out.println(sortedMap);
		
		navigableMap = treeMap.subMap(6,  false, 10, true);
		System.out.println(navigableMap);
		
		NavigableSet<Integer> navigableSet = treeMap.descendingKeySet();
		System.out.println(navigableSet.toString());
		System.out.println(navigableSet.descendingSet());
		
		navigableMap = treeMap.descendingMap();
		System.out.println(navigableMap.toString());
		System.out.println(navigableMap.descendingMap());
	}

}
