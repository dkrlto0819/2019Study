package study;

public class TalkVO {
    public Integer getTalkNo() {
        return talkNo;
    }

    public void setTalkNo(Integer talkNo) {
        this.talkNo = talkNo;
    }

    public Integer getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(Integer roomNo) {
        this.roomNo = roomNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    private Integer talkNo=null; //null 값이 들어갈 수도 있으니까 Integer
    private Integer roomNo=null;
    private String content=null;
}
