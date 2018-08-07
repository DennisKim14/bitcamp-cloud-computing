import java.io.File;
import java.lang.reflect.Constructor;
import java.net.URL;
import java.util.HashMap;

import bitcamp.pms.annotation.Component;
import bitcamp.pms.annotation.Controller;
import bitcamp.pms.annotation.Repository;
import bitcamp.pms.context.ApplicationContext;

public class Test {

    static HashMap<String, Object> objPool = new HashMap<>();

    public static void main(String[] args) throws Exception {
        
        ApplicationContext iocContainer = new ApplicationContext("bitcamp.pms");
     
        Object obj = iocContainer.getBean("/member/list");
        System.out.println(obj.getClass().getName());
    }

}
