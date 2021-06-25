package com.example.board.controller;

import com.example.board.model.Board;
import com.example.board.model.Paging;
import com.example.board.service.BoardService;
import com.example.board.util.JspPathUtil;
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
    public ModelAndView Main(@RequestParam(required = false, value = "page", defaultValue = "1") int page) {

        ModelAndView mav = new ModelAndView(JspPathUtil.MAIN_VIEW_PATH);
        Paging paging = new Paging(boardService.getBoardCount(), page);
        log.info("paging : {}", paging);
        List<Board> boardList = boardService.pagingBoardList(paging.getDbStartIndex(), paging.getDbEndIndex());

        mav.addObject("paging", paging); // Paging Data
        mav.addObject("boardList", boardList); // board Data

        return mav;
    }

    @PostMapping("/addBoard")
    public ModelAndView addBoard(@ModelAttribute Board board) {
        log.info("Board : {}", board);
        boardService.addBoard(board);
        return new ModelAndView(JspPathUtil.MAIN_VIEW_REDIRECT_PATH);
    }

    @GetMapping("/delete/{contentSeq}")
    public ModelAndView deleteBoard(@PathVariable("contentSeq") int contentSeq) {
        log.info("contentSeq : {}", contentSeq);
        boardService.deleteBoard(contentSeq);
        return new ModelAndView(JspPathUtil.MAIN_VIEW_REDIRECT_PATH);
    }

    @PostMapping("/modify/{contentSeq}")
    public ModelAndView modifyBoard(@ModelAttribute Board board) {
        log.info("Board : {}", board);
        boardService.updateBoard(board);
        return new ModelAndView(JspPathUtil.MAIN_VIEW_REDIRECT_PATH);
    }
}
