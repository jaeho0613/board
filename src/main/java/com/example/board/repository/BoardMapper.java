package com.example.board.repository;

import com.example.board.model.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    Board selectBoardById(int id);

    List<Board> selectAllBoardList();

    void insertBoard(Board board);

    void deleteBoard(int id);

    void updateBoard(Board board);

    int selectAllBoardCount();

    List<Board> selectPagingBoardList(int startIndex, int endIndex);

}
