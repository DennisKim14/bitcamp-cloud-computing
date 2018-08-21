package bitcamp.jangter.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitcamp.jangter.domain.Member;
import bitcamp.jangter.repository.MemberRepository;
import bitcamp.jangter.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired MemberRepository memberRepository;
    
    @Override
    public int add(Member member) {
        return memberRepository.insert(member);
    }
    
    @Override
    public Member getMember(String email, String password) {
        
        HashMap<String ,Object> params = new HashMap<>();
        params.put("email", email);
        params.put("password", password);
        return memberRepository.findByEmailAndPassword(params);
    }

}
