package bitcamp.pms.servlet.classroom;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.dao.ClassroomDao;
import bitcamp.pms.domain.Classroom;

@SuppressWarnings("serial")
@WebServlet("/classroom/update")
public class ClassroomUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta http-equiv='Refresh' content='1;url=list'>");
        out.println("<title>강의 변경</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>강의 변경 결과</h1>");

        try {
            Classroom croom = new Classroom();
            croom.setTitle(request.getParameter("title"));
            croom.setStartdate(Date.valueOf(request.getParameter("startDate")));
            croom.setEnddate(Date.valueOf(request.getParameter("endDate")));
            croom.setRoom(request.getParameter("room"));
            croom.setNo(Integer.parseInt(request.getParameter("no")));
            
            ClassroomDao classroomDao = (ClassroomDao)request.getServletContext().getAttribute("classroomDao");            
            if (classroomDao.update(croom) == 0) {
                out.println("<p>해당 강의가 존재하지 않습니다.</p>");
            } else {
                out.println("<p>변경하였습니다.</p>");
            }

        } catch (Exception e) {
            out.println("<p>변경 실패!</p>");
            e.printStackTrace(out);
        }
        out.println("</body>");
        out.println("</html>");
    }
}
