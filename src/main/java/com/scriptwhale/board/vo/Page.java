package com.scriptwhale.board.vo;

public class Page {
    private int start, end, boardNo;

    public Page() {
    }

    public Page(int pageNo, int numPage) {
        end = pageNo * numPage;
        start = end - (numPage);
    }

    public Page(int pageNo, int numPage, int boardNo) {
        super();
        end = pageNo * numPage;
        start = end - (numPage);
        this.boardNo = boardNo;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
    }
} //Page end
