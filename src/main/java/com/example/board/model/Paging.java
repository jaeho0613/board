package com.example.board.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Getter
@Setter
@ToString
@Accessors(chain = true)
public class Paging {

    // 행 ,  열
    // 가로, 세로
    // row, column
    int startIndex;                     // 시작 번호
    int endIndex;                       // 끝 번호
    int currentIndex;                   // 현재 번호

    int dbStartIndex;                   // DB 구간 시작 번호
    int dbEndIndex;                     // DB 구간 끝 번호

    final int maxPagingColumn;          // 최대 세로 (페이징 갯수)

    final int totalPagingRow;           // 총 가로 갯수
    final int maxPagingRow;             // 최대 가로 (보여질 페이지)

    final int totalBoardCount;          // 게시판 총 갯수

    public Paging(int totalBoardCount, int currentIndex) {
        this.totalBoardCount = totalBoardCount;
        this.currentIndex = currentIndex;
        this.maxPagingRow = 10;
        this.maxPagingColumn = 10;
        this.totalPagingRow = (totalBoardCount % maxPagingColumn != 0) ? (totalBoardCount / maxPagingColumn) + 1 : (totalBoardCount / maxPagingColumn);
        this.dbStartIndex = (currentIndex - 1) * maxPagingRow;
        this.dbEndIndex = maxPagingColumn;

        if (currentIndex % maxPagingColumn == 0) {
            endIndex = currentIndex;
            startIndex = currentIndex - (maxPagingColumn - 1);
        } else {
            startIndex = ((currentIndex / maxPagingColumn) * maxPagingColumn) + 1;
            endIndex = startIndex + maxPagingColumn - 1;
        }
    }
}
