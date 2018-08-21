package bitcamp.jangter.web.json;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bitcamp.jangter.domain.Member;
import bitcamp.jangter.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberController {

    @Autowired
    MemberService memberService;

    @PostMapping("signUp")
    public Object signUp(Member member) {

        HashMap<String, Object> result = new HashMap<>();
        try {
            memberService.add(member);
            result.put("status", "success");

        } catch (Exception e) {
            result.put("status", "fail");
            result.put("message", e.getMessage());
        }

        return result;
    }
}
