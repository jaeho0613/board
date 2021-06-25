package com.example.board.repository;

import com.example.board.model.File;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {

    File selectFileById(int seq);

}
