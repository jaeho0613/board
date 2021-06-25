package com.example.board.service;

import com.example.board.model.Board;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class BoardServiceTest {

    @Autowired
    BoardService boardService;

    @Test
    public void addBoard() {
        boardService.addBoard(new Board()
                .setBoardTypeCd("11")
                .setTitle("테스트 제목")
                .setDescription("테스트 내용"));
    }

    @Test
    public void getBoardById() {
        log.info("board : {}", boardService.getBoardById(1));
    }

    @Test
    public void getAllBoardList() {
        boardService.getAllBoardList()
                .forEach(board -> log.info("board : {}", board));
    }

    @Test
    public void deleteBoard() {
        boardService.deleteBoard(2);
    }

    @Test
    public void updateBoard() {
        boardService.updateBoard(new Board()
                .setContentSeq(15)
                .setBoardTypeCd("12")
                .setTitle("서비스 수정 타이틀")
                .setDescription("서비스 수정 내용")
        );
    }

    @Test
    public void totalBoardCount() {
        log.info("count : {}", boardService.getBoardCount());
    }

    @Test
    public void pagingBoardList() {
        List<Board> boardList = boardService.pagingBoardList(0, 10);
        boardList.forEach(board -> log.info("board:  {}", board));
    }
}