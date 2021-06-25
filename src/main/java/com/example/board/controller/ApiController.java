package com.example.board.controller;

import com.example.board.model.Board;
import com.example.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api")
@RequiredArgsConstructor
public class ApiController {

    // TODO : 자동완성
    final BoardService boardService;

    @GetMapping("/get/{seq}")
    public ResponseEntity<Board> getBoard(@PathVariable("seq") int seq) {
        Board board = boardService.getBoardById(seq);
        return new ResponseEntity<>(board, HttpStatus.OK);
    }

    @GetMapping("/get")
    public ResponseEntity<List<Board>> getAllBoard() {
        return new ResponseEntity<>(boardService.getAllBoardList(), HttpStatus.OK);
    }
}
