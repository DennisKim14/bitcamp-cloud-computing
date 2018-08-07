package bitcamp.pms.servlet.classroom;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bitcamp.pms.domain.Classroom;

@SuppressWarnings("serial")
@WebServlet("/classroom/view")
public class ClassroomViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int no = Integer.parseInt(request.getParameter("no"));

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>강의 보기</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>강의 보기</h1>");

        try {
            Classroom croom = selectOne(no);
            if(croom == null) {
                out.println("유효하지 않은 게시물 번호입니다.");
            }
            out.println("<form action='update' method='post'>");
            out.printf("<input type='hidden' name='no' value='%d'>\n", no);
            out.println("<table border='1'>");
            out.println("<tr>");
            out.println("    <th>강의명</th>");
            out.printf("    <td><input type='text' name='title' value='%s'></td>\n", croom.getTitle());
            out.println("</tr>");
            out.println("<tr>");
            out.println("    <th>시작일</th>");
            out.printf("    <td><input type='date' name='startDate' value='%s'></td>\n", croom.getStartdate());
            out.println("</tr>");
            out.println("<tr>");
            out.println("    <th>종료일</th>");
            out.printf("    <td><input type='date' name='endDate' value='%s'></td>\n", croom.getEnddate());
            out.println("</tr>");
            out.println("<tr>");
            out.println("    <th>강의실</th>");
            out.printf("    <td><input type='text' name='room' value='%s'></td>\n", croom.getRoom());
            out.println("</tr>");
            out.println("</table>");
            out.println("<p>");
            out.println("<a href='list'>목록</a>");
            out.println("<button>변경</button>");
            out.printf("<a href='delete?no=%d'>삭제</a>\n", no);
            out.println("</p>");
            out.println("</form>");
    
        } catch (Exception e) {
            out.printf("<p>%s</p>\n", e.getMessage());
            e.printStackTrace(out);
        }
        out.println("</body>");
        out.println("</html>");

    }

    private Classroom selectOne(int no) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection con = DriverManager.getConnection("jdbc:mysql://52.78.71.191/studydb", "study", "1111");
                PreparedStatement stmt = con
                        .prepareStatement("select crno,titl,sdt,edt,room from pms2_classroom where crno=?");) {

            stmt.setInt(1, no);

            try (ResultSet rs = stmt.executeQuery();) {
                if (!rs.next()) {
                    return null;
                }

                Classroom croom = new Classroom();
                croom.setNo(rs.getInt("crno"));
                croom.setTitle(rs.getString("titl"));
                croom.setStartdate(rs.getDate("sdt"));
                croom.setEnddate(rs.getDate("edt"));
                croom.setRoom(rs.getString("room"));
                
                return croom;
            }

        }
    }
}
