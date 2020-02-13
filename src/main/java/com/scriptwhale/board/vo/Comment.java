package com.scriptwhale.board.vo;

import java.sql.Timestamp;

public class Comment {
    private int idx, userNo, boardNo;
    private String contents, name, status;
    private Timestamp regdate;

    public Comment() {
    }

    public Comment(int userNo, int boardNo, String contents) {
        super();
        this.userNo = userNo;
        this.boardNo = boardNo;
        this.contents = contents;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }
} //Comment end
