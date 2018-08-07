package bitcamp.pms.listener;

import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import bitcamp.pms.dao.BoardDao;
import bitcamp.pms.dao.MemberDao;

@WebListener
public class ContextLoaderListener implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
        String resource = "bitcamp/pms/config/mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory =
          new SqlSessionFactoryBuilder().build(inputStream);
        
        MemberDao memberDao = new MemberDao(sqlSessionFactory);
        BoardDao boardDao = new BoardDao("jdbc:mysql://52.78.71.191:3306/studydb", "study", "1111");

        ServletContext sc = sce.getServletContext();
        sc.setAttribute("memberDao", memberDao);
        sc.setAttribute("boardDao", boardDao);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
