package bitcamp.assignment.controller.json;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bitcamp.assignment.domain.Member;
import bitcamp.assignment.service.MemberLoginService;

@RestController
@RequestMapping("/member")
public class MemberLoginController {
    
    @Autowired private MemberLoginService memberLoginService;
    
    /*
    public String form() {
        //return "pages/member/loginForm";
        return "member/memberLoginForm";
    }
    */

    @PostMapping("login")
    public Object login(Member reqMember, HttpServletRequest request) {
        HashMap<String, Object> data = new HashMap<>();
        try {
        Member member = memberLoginService.login(reqMember);
        HttpSession session = request.getSession();
        session.setAttribute("MEMBER", member);
        // 로그인 버튼을 누르면 리스트화면으로 가야되는데.. list.html여기로 가게하고싶음
        data.put("status", "success");
        } catch(Exception e) {
            System.out.println(e);
            data.put("status", "fail");
        }
        return data;
    }

    /*@ExceptionHandler(Exception.class)
    public RedirectView exhandler(Exception ex, HttpServletRequest request) {
        RedirectView redirectView = new RedirectView(request.getHeader("referer"));
        FlashMap outputFlashMap = RequestContextUtils.getOutputFlashMap(request);
        if (outputFlashMap != null) {
            outputFlashMap.put("ERROR_MSG", ex.getMessage());
        }
        return redirectView;
    }*/
}