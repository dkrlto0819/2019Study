package main;

public class Test112 {
    public static void test(String... args) {
        System.out.println(args.length);
    }


    //Object args_1 = 100; -> 100을 new Integer(100) ㅇ로 자동변환 == auto boxing;
    //Object args_3 = 3.14 -> new double(3.14)로 자동변환 (null 도 들어가기 가능!)
    public static void test2(Object... args) {
        for(int i=0;i<args.length;i++){
            if (args[i]==null) System.out.println("null");
            else if (args[i] instanceof Integer) {
                int r = ((Integer)args[i]).intValue();
                System.out.println(r+1);
            } else if(args[i] instanceof Double){
                double r = ((Double)args[i]).doubleValue();
                System.out.println(r+0.1);
            } else if(args[i] instanceof String){
                System.out.println((String)args[i]);
            }
        }
    }

    public static void main(String[] args) {
        test("apple");
        test();
        test("appl", "banana");

        test2(100, "Hello", 3.14, null);
    }
}

/*
    캐스팅 가능한 지 볼때 사용하는 코드...

    autobosing & unboxing
    Object i = 100; >> 가능
    int j = i; >> 불가능

    Integer i = 100;(O)
    int j= i;(O)
 */
