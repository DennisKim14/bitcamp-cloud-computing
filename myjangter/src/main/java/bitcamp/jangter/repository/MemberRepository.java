package bitcamp.jangter.repository;

import java.util.Map;

import bitcamp.jangter.domain.Member;

public interface MemberRepository {

    int insert(Member member);
    Member findByEmailAndPassword(Map<String, Object> params);

}
