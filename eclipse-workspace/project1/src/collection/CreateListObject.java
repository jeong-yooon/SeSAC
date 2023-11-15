package collection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

public class CreateListObject {
    public static void main(String[] args) {
        // 1. List 구현 클래스의 생성자를 사용해 객체 생성
        List<Integer> aList1 = new ArrayList<>();       // 용량 = 10
        List<Integer> aList2 = new ArrayList<>(30);     // 용량 = 30
        List<Integer> aList3 = new Vector<>();          // 용량 = 10
        List<Integer> aList4 = new Vector<>(20);        // 용량 = 20
        List<Integer> aList5 = new LinkedList<>();       // 용량 = 적용되지 않음
        // List<Integer> aList6 = new LinkedList<>(30); // 저장 용량을 지정할 수 없습니다.

        // 2. Arrays 클래스의 정적 메서드 활용
        List<Integer> aList7 = Arrays.asList(1, 2, 3, 4);
        List<String> aList8 = Arrays.asList("안녕", "방가");
        // aList7와 aList8의 크기를 직접 수정할 수 없습니다. 이는 고정 크기의 리스트입니다.
        // aList7.add(5); // 이렇게 하면 UnsupportedOperationException이 발생합니다.
        // aList8.remove(0); // 이렇게 하면 UnsupportedOperationException이 발생합니다.

        // Arrays.asList로부터 수정 가능한 ArrayList를 만들려면 다음과 같이 할 수 있습니다:
        List<Integer> modifiableList7 = new ArrayList<>(aList7);
        List<String> modifiableList8 = new ArrayList<>(aList8);

        modifiableList7.add(5);
        modifiableList8.remove(0);

        System.out.println(modifiableList7);
        System.out.println(modifiableList8);
    }
}
