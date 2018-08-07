package bitcamp.pms.servlet.board;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.dao.BoardDao;
import bitcamp.pms.domain.Board;

@SuppressWarnings("serial")
@WebServlet("/board/add")
public class BoardAddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 클라이언트가 보낸 데이터가 어떤 문자표를 사용해서 작성한지 알아야만
        // String 객체(UTF-16)로 값을 꺼낼 수 있다.
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");

        // 지정된 시간이 경과하면 특정 서블릿을 요청하도록 태그를 삽입!
        // => 웹브라우저는 meta 태그의 내용대로 동작한다.
        // content='경과시간(초);url=요청할URL'
        //
        out.println("<meta http-equiv='Refresh' content='1;url=list'>");

        out.println("<title>게시물 등록</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>게시물 등록 결과</h1>");
        try {
            BoardDao boardDao = (BoardDao)getServletContext().getAttribute("boardDao");
            Board board = new Board();
            board.setContent(request.getParameter("content"));
            //board.setCreatedate(Date.valueOf(request.getParameter("createdate")));
            //board.setNo(Integer.parseInt(request.getParameter("no")));
            board.setTitle(request.getParameter("title"));
   
            boardDao.insert(board);

            out.println("<p>등록 성공!</p>");

        } catch (Exception e) {
            out.println("<p>등록 실패!</p>");
            e.printStackTrace(out);
        }
        out.println("</body>");
        out.println("</html>");
    }
}
