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

    int contentSeq;
    String boardTypeCd;
    String title;
    String description;

}
