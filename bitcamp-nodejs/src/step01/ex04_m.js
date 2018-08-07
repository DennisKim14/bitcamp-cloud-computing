//모듈 정의 II
//- 
//- module.exports 객체에 담아 리턴한다.

module.exports = {
        //{}에서 함수를 정의하는 방법 1
        plus: function plus(a, b) {return a + b},
        minus: function(a, b) {return a - b},
        
        //{}에서 함수를 정의하는 방법2
        multiple: function(a, b) {return a * b},
        divide: function(a, b) {return a / b}
};