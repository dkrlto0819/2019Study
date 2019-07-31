package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Test110 {
    public static void main(String[] args) throws Exception {

        //String data = "xyz"; ==> 얜 작은 따옴표 포함해서 넣어줘야 함
        String data = null; //3개의 칸에 4개가 들어갔다고 에러나짐ㅠㅠ ==> 얘는 빼야함!

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe",
                "system", "1234");

        //String sql = "insert into temp20t values ('abc')";
        String sql = (data != null) ? "insert into temp20t values (" + data + ")" :
                "insert into temp20t values (null)";
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);

        stmt.close();
        conn.close();
    }
}

/*
    create table temp20t (
        data char(3) null
    );

    insert into temp20t values('abc');
 */