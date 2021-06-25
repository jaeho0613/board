package com.example.board.service;

import com.example.board.repository.FileMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
@SpringBootTest
class FileServiceTest {

    @Autowired
    FileService fileService;

    @Test
    public void getFileById() {
        log.info("file : {}", fileService.getFileById(1));
    }

}