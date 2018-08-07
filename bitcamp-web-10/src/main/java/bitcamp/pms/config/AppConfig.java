package bitcamp.pms.config;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
// 스프링 IoC 컨테이너에게 어떤 객체를 생성하라고 명령을 내린다.
public class AppConfig {
    public AppConfig() {
        System.out.println("AppConfig() 호출됨");
    }

    /*@Bean
    public SqlSessionFactory getSqlSessionFactory() throws Exception {
        System.out.println("AppConfig.getSqlSessionFactory() 호출됨");
        String resource = "bitcamp/pms/config/mybatis-config.xml";
        InputStream inputStream = 
                Resources.getResourceAsStream(resource);
        return new SqlSessionFactoryBuilder().build(inputStream);
    }*/
}
