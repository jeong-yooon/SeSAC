package collection;

import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

public class LinkedHashSetMethod {

	public static void main(String[] args) {
		Set<String> linkedSet1 = new LinkedHashSet<>();
		linkedSet1.add("가");
		linkedSet1.add("나");
		linkedSet1.add("다");
		System.out.println(linkedSet1.toString());
		
		Set<String> linkedSet2 = new LinkedHashSet<>();
		linkedSet2.add("나");
		linkedSet2.add("다");
		linkedSet2.addAll(linkedSet1);
		System.out.println(linkedSet2.toString());
		
		linkedSet2.remove("나");
		System.out.println(linkedSet2.toString());
		
		linkedSet2.clear();
		System.out.println(linkedSet2.toString());
		
		System.out.println(linkedSet2.isEmpty());
		
		Set<String> linkedSet3 = new LinkedHashSet<>();
		linkedSet3.add("가");
		linkedSet3.add("나");
		linkedSet3.add("다");
		System.out.println(linkedSet3.contains("나"));
		System.out.println(linkedSet3.contains("라"));
		
		System.out.println(linkedSet3.size());
		
		Iterator<String> iterator = linkedSet3.iterator();
		while(iterator.hasNext()) {
			System.out.println(iterator.next());
		}
		Object[] objArray = linkedSet3.toArray();
		System.out.println(Arrays.toString(objArray));
		
		String[] strArray1 = linkedSet3.toArray(new String[0]);
		System.out.println(Arrays.toString(strArray1));
		
		String[] strArray2 = linkedSet3.toArray(new String[5]);
		System.out.println(Arrays.toString(strArray2));
	}

}
