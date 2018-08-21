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
            location.href = 'html/list.html';
        },
        'json');
});