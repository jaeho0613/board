package com.example.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
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
    int startIndex;         // 시작 번호
    int endIndex;           // 끝 번호
    int currentIndex;       // 현재 번호
    final int maxPagingColumn;    // 최대 세로 (페이징 갯수)
    final int maxPagingRow;       // 최대 가로 (보여질 페이지)
    final int maxBoardCount;        // 게시판 총 갯수

    public Paging(int maxBoardCount) {
        this.maxBoardCount = maxBoardCount;
        maxPagingColumn = 10;
        maxPagingRow = (maxBoardCount % maxPagingColumn != 0) ? (maxBoardCount / maxPagingColumn) + 1 : (maxBoardCount / maxPagingColumn);
    }
}
