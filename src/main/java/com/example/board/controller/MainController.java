package com.example.board.controller;

import com.example.board.model.Board;
import com.example.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/main")
public class MainController {

    final BoardService boardService;

    @GetMapping("")
    public ModelAndView Main() {
        return new ModelAndView("/jsp/index");
    }

    @PostMapping("/addBoard")
    public ModelAndView addBoard(@ModelAttribute Board board) {
        log.info("Board : {}", board);
        boardService.addBoard(board);
        return new ModelAndView("redirect:/main");
    }

    @GetMapping("/delete/{contentSeq}")
    public ModelAndView deleteBoard(@PathVariable("contentSeq") int contentSeq) {
        log.info("contentSeq : {}", contentSeq);
        boardService.deleteBoard(contentSeq);
        return new ModelAndView("redirect:/main");
    }

    @PostMapping("/modify/{contentSeq}")
    public ModelAndView modifyBoard(@ModelAttribute Board board) {
        log.info("Board : {}" , board);
        boardService.updateBoard(board);
        return new ModelAndView("redirect:/main");
    }
}
