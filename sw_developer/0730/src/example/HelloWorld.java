package example;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class HelloWorld extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
      try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (ClassNotFoundException e) {
        e.printStackTrace();
      }
      try {
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String sql = "select * FROM bangmyung_t";

        ResultSet rs = stmt.executeQuery(sql);
        System.out.println(rs.next());
        while(rs.next()){
          System.out.println("this is first!");
          System.out.println(rs.getString("NO"));
        }

      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
}
