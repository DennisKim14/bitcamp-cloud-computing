package bitcamp.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import bitcamp.pms.domain.Classroom;

public class ClassroomDao {

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    String jdbcurl;
    String username;
    String password;

    public ClassroomDao(String jdbcurl, String username, String password) {
        super();
        this.jdbcurl = jdbcurl;
        this.username = username;
        this.password = password;
    }

    public List<Classroom> selectList() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(jdbcurl, username, password);
                PreparedStatement stmt = con.prepareStatement("select crno,titl,sdt,edt,room from pms2_classroom");
                ResultSet rs = stmt.executeQuery();) {

            ArrayList<Classroom> list = new ArrayList<>();
            while (rs.next()) {
                Classroom croom = new Classroom();
                croom.setNo(Integer.parseInt(rs.getString("crno")));
                croom.setTitle(rs.getString("titl"));
                croom.setStartdate(rs.getDate("sdt"));
                croom.setStartdate(rs.getDate("edt"));
                croom.setRoom(rs.getString("room"));

                list.add(croom);
            }
            return list;
        }
    }

    public Classroom selectOne(int no) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(jdbcurl, username, password);
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

    public int update(Classroom croom) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(jdbcurl, username, password);
                PreparedStatement stmt = con
                        .prepareStatement("update pms2_classroom set titl=?, sdt=?, edt=?, room=? where crno=?");) {

            stmt.setString(1, croom.getTitle());
            stmt.setDate(2, croom.getStartdate());
            stmt.setDate(3, croom.getEnddate());
            stmt.setString(4, croom.getRoom());
            stmt.setInt(5, croom.getNo());

            return stmt.executeUpdate();
        }
    }

    public int delete(int no) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(jdbcurl, username, password);
                PreparedStatement stmt = con.prepareStatement("delete from pms2_classroom where crno=?");) {

            stmt.setInt(1, no);

            return stmt.executeUpdate();
        }
    }

    public int insert(Classroom croom) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(jdbcurl, username, password);
                PreparedStatement stmt = con
                        .prepareStatement("insert into pms2_classroom(titl,sdt,edt,room) values(?,?,?,?)");) {

            stmt.setString(1, croom.getTitle());
            stmt.setDate(2, croom.getStartdate(), Calendar.getInstance(Locale.KOREAN));
            stmt.setDate(3, croom.getEnddate(), Calendar.getInstance(Locale.KOREAN));
            stmt.setString(4, croom.getRoom());

            return stmt.executeUpdate();
        }
    }
}
