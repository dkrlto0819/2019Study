package main;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

// Test110 .java 문제 해결!
public class Test111 {
    public static void main(String[] args) throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe",
                "system", "1234");

        String sql = "insert into temp20t values ( ? )"; //이어 붙이는 것을 안 씀
        PreparedStatement ps = conn.prepareStatement(sql); //110은 execute 할때 sql 문을 줬다

        ps.setString(1, null);
        ps.executeUpdate();

        /*
        Statement 는 어떤 sql 문이든 다 받을 수 있지만
        PreparedStatement는 생성시에 준비한 sql 문만 받을 수 있다.
        대신 ? 영역을 setString, setInteger 등을 사용하여 채울 수 있다.(단, 시작은 1부터. 0 아님)
         executeUpdate를 통해 업데이트(왜? 어차피 sql 문을 고정시켜뒀기 때문)
         */

        ps.close();
        conn.close();
    }
}
