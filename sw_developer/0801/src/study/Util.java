package study;

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
}
