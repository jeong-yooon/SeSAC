package collection;

import java.util.Comparator;
import java.util.TreeSet;

class MyComparableClass implements Comparable<MyComparableClass> {
    int data1;
    int data2;

    public MyComparableClass(int data1, int data2) {
        this.data1 = data1;
        this.data2 = data2;
    }

    @Override
    public int compareTo(MyComparableClass other) {
        if (this.data1 < other.data1) {
            return -1;
        } else if (this.data1 == other.data1) {
            return 0;
        } else {
            return 1;
        }
    }
}

class MyClass {
    int data1;
    int data2;

    public MyClass(int data1, int data2) {
        this.data1 = data1;
        this.data2 = data2;
    }
}

public class TreeSetMethod_2 {
    public static void main(String[] args) {
        TreeSet<Integer> treeSet1 = new TreeSet<Integer>();
        Integer intValue1 = new Integer(20);
        Integer intValue2 = new Integer(10);
        treeSet1.add(intValue1);
        treeSet1.add(intValue2);
        System.out.println(treeSet1.toString());

        TreeSet<String> treeSet2 = new TreeSet<String>();
        String str1 = "가나";
        String str2 = "다라";
        treeSet2.add(str1);
        treeSet2.add(str2);
        System.out.println(treeSet2.toString());

        TreeSet<MyComparableClass> treeSet4 = new TreeSet<MyComparableClass>();
        MyComparableClass myComparableClass1 = new MyComparableClass(2, 5);
        MyComparableClass myComparableClass2 = new MyComparableClass(3, 3);
        treeSet4.add(myComparableClass1);
        treeSet4.add(myComparableClass2);
        for (MyComparableClass mcc : treeSet4) {
            System.out.println(mcc.data1);
        }

        TreeSet<MyClass> treeSet5 = new TreeSet<MyClass>(new Comparator<MyClass>() {
            @Override
            public int compare(MyClass o1, MyClass o2) {
                if (o1.data1 < o2.data1) return -1;
                else if (o1.data1 == o2.data1) return 0;
                else return 1;
            }
        });
        MyClass myClass1 = new MyClass(2, 5);
        MyClass myClass2 = new MyClass(3, 3);
        treeSet5.add(myClass1);
        treeSet5.add(myClass2);
        for (MyClass mcc : treeSet5) {
            System.out.println(mcc.data1);
        }
    }
}
