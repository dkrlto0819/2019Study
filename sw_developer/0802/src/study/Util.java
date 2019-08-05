package study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Util {
    public static int parseInt(String l){
        try{
            int r = Integer.parseInt(l);
            return r;
        }catch(Exception e){
            return -1;
        }
    }

    public static String toKorean(String l ){
        if (l==null || l.equals("")) return l;
        try{
            byte[] bs = l.getBytes("8859_1"); //아스키코드 해당 값
            l = new String(bs, "UTF-8");
        }catch (Exception e) {}
        return l;
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe",
                "system", "1234");
    }

}
