package bitcamp.assignment.dao;

import java.util.List;
import java.util.Map;

import bitcamp.assignment.domain.Member;

public interface MemberDao {
    List<Member> selectList(Map<String,Object> params);
    Member selectOne(String id);
    int update(Member member);
    int delete(String id);
    int insert(Member member);
    int countAll();
    Member selectByUsername(String email);
}