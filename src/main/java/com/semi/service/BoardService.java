package com.semi.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.semi.model.dao.BoardDAO;
import com.semi.model.vo.Board;

@Service
public class BoardService {

    @Autowired
    private BoardDAO dao;

    public int insert(Board b) {
        return dao.insert(b);
    }

    public List<Board> selectAll() {
        return dao.selectAll();
    }

    public Board select(int no) {
        return dao.select(no);
    }

    public int update(Board b) {
        return dao.update(b);
    }

    public int delete(int no) {
        return dao.delete(no);
    }

    public List<Board> selectPage(int page, int size) {
        return dao.selectPage(page, size);
    }

    public int getTotalBoardCount() {
        return dao.count();
    }
}
