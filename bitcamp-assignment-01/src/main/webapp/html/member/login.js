"use strict"

var data = null;
var {id, page, size} = $.parseQuery(location.href);

$(eLoginBtn).click(function() {
    $.post(serverApiAddr + '/json/member/login', 
        {
            email: $(eEmail).val(), 
            password: $(ePassword).val()
        },
        function(data) {
            if(data.status == "success"){
                location.href = 'list.html';
            } else {
                alert('아이디가 틀렸습니다');
            }
        },
        'json');
});