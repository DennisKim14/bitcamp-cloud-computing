package bitcamp.pms.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.annotation.Autowired;
import bitcamp.pms.annotation.Controller;
import bitcamp.pms.annotation.RequestMapping;
import bitcamp.pms.dao.MemberDao;
import bitcamp.pms.domain.Member;

@Controller("/member/list")
public class MemberListController {

    MemberDao memberDao;
    
    public MemberListController() {}
        
    
    public MemberListController(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
    
    @Autowired
    public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
    
    // 더이상 인터페이스를 쓰지않기 때문에 매핑사용해서 이 메서드를 쓴다는 것을 알려줌
    @RequestMapping
    public String list(
            HttpServletRequest request, 
            HttpServletResponse response) throws Exception {
        
        // DB에서 가져올 데이터의 페이지 정보
        HashMap<String,Object> params = new HashMap<>();
        if (request.getParameter("page") != null &&
            request.getParameter("size") != null) {
            int page = Integer.parseInt(request.getParameter("page"));
            int size = Integer.parseInt(request.getParameter("size"));
            params.put("startIndex", (page - 1) * size);
            params.put("pageSize", size);
        }
        
        List<Member> list = memberDao.selectList(params);
        request.setAttribute("list", list);
        
        return "/member/list.jsp";
            
    }
    

}










