package bitcamp.assignment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitcamp.assignment.dao.MemberDao;
import bitcamp.assignment.domain.Member;

@Service
public class MemberLoginService
{
    @Autowired private MemberDao memberDao;
    
    public Member login(Member req) {
        
        Member member = memberDao.selectByUsername(req.getEmail());
        
        if (member == null)
            throw new MemberNotFoundException("아이디가 존재하지 않습니다.");
        
        if (!member.checkPassword(req.getPassword()))
            throw new EmailPasswordNotMatchingException("비밀번호가 틀립니다.");
        
        return member;
    }
}