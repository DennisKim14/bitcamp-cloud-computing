package bitcamp.jangter.web.json;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bitcamp.jangter.domain.Board;
import bitcamp.jangter.service.BoardService;

@RestController
@RequestMapping("/board")
public class BoardController {
    
    @Autowired BoardService boardService;
    
    @PostMapping("boardUp")
    public Object signUp(Board board) {
        System.out.println(board);
        HashMap<String, Object> result = new HashMap<>();
        try {
            boardService.add(board);
            result.put("status", "success");

        } catch (Exception e) {
            result.put("status", "fail");
            result.put("message", e.getMessage());
        }

        return result;
    }
    
    @GetMapping("detailView/{no}")
    public Object view(
            @PathVariable int no) throws Exception { 
        HashMap<String,Object> data = new HashMap<>();
        data.put("board", boardService.get(no));
        return data;
    }
    
    @GetMapping("list")
    public Object list(
            @RequestParam(defaultValue="1") int page, 
            @RequestParam(defaultValue="10") int size) throws Exception {
        
        if (page < 1) page = 1;
        if (size < 1 || size > 20) size = 10;
        
        List<Board> list = boardService.list(page, size);
        
        HashMap<String,Object> data = new HashMap<>();
        data.put("list", list);
        data.put("page", page);
        data.put("size", size);
        data.put("totalPage", 
                boardService.getTotalPage(size));

        return data;
    }
}
