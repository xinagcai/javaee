package com.cqut.ktp.controller;

import com.cqut.ktp.entity.Comment;
import com.cqut.ktp.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/task")
@RestController
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping(value = "/comment")
    public Boolean comment(@RequestBody Comment comment) {
        return commentService.comment(comment);
    }

    @GetMapping(value = "/getComments")
    public List<Comment> getComments(@RequestParam String tno) {
        return commentService.getComments(tno);
    }
}
