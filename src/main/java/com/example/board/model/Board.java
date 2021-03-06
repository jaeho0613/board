package com.example.board.model;

import lombok.*;
import lombok.experimental.Accessors;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Accessors(chain = true)
public class Board {

    Integer contentSeq;
    String boardTypeCd;
    String title;
    String description;
    Date createDate;
    Integer fileSeq;

}
