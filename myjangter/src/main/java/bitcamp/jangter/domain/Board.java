package bitcamp.jangter.domain;

import java.sql.Date;

public class Board {
    private int no;
    private String writer;
    private String title;
    private String content;
    private Date createdate;
    
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getCreatedate() {
        return createdate;
    }
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }
    @Override
    public String toString() {
        return "Board [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content + ", createdate="
                + createdate + "]";
    }
}
