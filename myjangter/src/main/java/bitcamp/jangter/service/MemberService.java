package bitcamp.jangter.service;

import bitcamp.jangter.domain.Member;

public interface MemberService {

    int add(Member member);
    Member getMember(String email, String password);
}
