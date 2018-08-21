package bitcamp.uml.classdiagram.ex2;

import java.util.List;

// Aggregation(집합)
// => 한 객체가 다른 객체를 포함하는 것을 표현한다.
// => 포함하는 객체를 Container라 부르고,
//    포함되는 객체를 Containee라 부른다.
public class Order {
    
    // 포함할 객체는 필드로 선언한다.
    Customer customer;
    
    // 여러 개를 포함할 경우 배열이나 Collection 객체로 구현한다.
    List<Product> products;
    
    public Order(Customer customer, List<Product> products) {
        
    }
}
