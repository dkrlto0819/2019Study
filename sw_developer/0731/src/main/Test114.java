package main;

interface  ITemp{
    public void print();
}

public class Test114 {
    public static void main(String[] args) {

        int i = 100;

        ITemp t = new ITemp() {
            @Override
            public void print() {

                System.out.println("HelloWorld" + i);
            }
        };

        t.print();
   }
}

//interface 안의 abstract method를 오버라이딩을 반드시 해주는 테크닉
/*
    Anoymous class : 이름 없는 클래스 ( 조상은 있다 : ITemp)
    ITemp를 상속받고 - 그러면 모든 메소드 오버라이딩 해주고...
    1회용 클래스. 선언하고 instance 한번 만들고 끝임
 */
