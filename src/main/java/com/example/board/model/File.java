package com.example.board.model;

import lombok.*;
import lombok.experimental.Accessors;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Accessors(chain = true)
public class File {

    Integer fileSeq;
    String fileName;
    String fileDownloadUrl;
    Integer size;

}
