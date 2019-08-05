package study;

public class TalkVO {
    public Integer getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(Integer roomNo) {
        this.roomNo = roomNo;
    }

    public Integer getTalkNo() {
        return talkNo;
    }

    public void setTalkNo(Integer talkNo) {
        this.talkNo = talkNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    private Integer roomNo;
    private Integer talkNo;
    private String content;
}
