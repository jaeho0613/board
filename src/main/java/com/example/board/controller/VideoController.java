package com.example.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("video")
public class VideoController {

    @GetMapping("")
    public ModelAndView main() {
        return new ModelAndView("video");
    }
}
