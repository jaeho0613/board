package com.example.board.service;

import com.example.board.model.Board;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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
}