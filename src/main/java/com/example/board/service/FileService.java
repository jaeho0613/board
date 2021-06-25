package com.example.board.service;

import com.example.board.model.File;
import com.example.board.repository.FileMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class FileService {

    final FileMapper fileMapper;

    public File getFileById(int seq) {
        return fileMapper.selectFileById(seq);
    }

}
