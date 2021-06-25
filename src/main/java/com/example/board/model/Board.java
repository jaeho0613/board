package com.example.board.model;

import lombok.*;
import lombok.experimental.Accessors;

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

}
