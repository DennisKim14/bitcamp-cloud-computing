//모듈 정의 IV
// - module.exports 함수를 저장한다.
// - 그 함수는 객체를 리턴한다
//

module.exports = function(){
    return {
        //{}에서 함수를 정의하는 방법 1
        plus: function plus(a, b) {return a + b},
        minus: function(a, b) {return a - b},
        
        //{}에서 함수를 정의하는 방법2
        multiple: function(a, b) {return a * b},
        divide: function(a, b) {return a / b}
    };
};
