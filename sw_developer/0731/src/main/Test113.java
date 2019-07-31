package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test113 {
    public static int update(String sql, Object... args) throws Exception{
        int rc =0;

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe",
                "system", "1234");
        PreparedStatement ps = conn.prepareStatement(sql);

        for(int i=0;i<args.length;i++){
            if (args[i]==null) {
                ps.setObject(i+1, null);
            }
            else if (args[i] instanceof Integer) {
                int r = ((Integer)args[i]).intValue();
                ps.setInt(i+1, r);
            } else if(args[i] instanceof Double){
                double r = ((Double)args[i]).doubleValue();
                ps.setDouble(i+1, r);
            } else if(args[i] instanceof String){
               ps.setString(i+1, (String) args[i]);
            }
        }

        rc = ps.executeUpdate();
        ps.close();
        conn.close();

        return rc;
    }

    public static void main(String[] args) throws Exception {
        String sql = "insert into temp20t values (?)";
        update(sql, "KIM");
    }
}
