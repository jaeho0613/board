package com.example.board.service;

import com.example.board.model.Board;
import com.example.board.repository.BoardMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    final BoardMapper boardMapper;

    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    public Board getBoardById(int id) {
        return boardMapper.selectBoardById(id);
    }

    public List<Board> getAllBoardList() {
        return boardMapper.selectAllBoardList();
    }

    public void addBoard(Board board) {
        boardMapper.insertBoard(board);
    }

    public void deleteBoard(int id) {
        boardMapper.deleteBoard(id);
    }

}
