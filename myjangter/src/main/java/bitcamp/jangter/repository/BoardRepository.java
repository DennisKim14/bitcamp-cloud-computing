package bitcamp.jangter.repository;

import java.util.HashMap;
import java.util.List;

import bitcamp.jangter.domain.Board;

public interface BoardRepository {

    int insert(Board board);
    Board findByWriterAndDateAndTitle(HashMap<String, Object> params);
    Board selectOne(int no);
    List<Board> findByPageAndSize(HashMap<String, Object> params);
    int totalPage(int size);
}
