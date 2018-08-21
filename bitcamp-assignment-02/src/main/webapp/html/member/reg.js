"use strict"

var data = null;
var {id, page, size} = $.parseQuery(location.href);

if (id == undefined) { // 입력 폼 
    $('.viewform').css('display', 'none');
    $(eId).removeAttr("readonly");
    
} else { // 상세 보기 폼
    $('.newform').css('display', 'none');

    $.getJSON(serverApiAddr + `/json/member/view/${id}`, 
        function(result) {
            data = result;
            if (data.member == null) {
                alert('아이디가 무효합니다.');
                location.href = "html/list.html";
                return;
            }
            $(eId).val(data.member.id);
            $(eEmail).val(data.member.email);
    });
}

$(eAddBtn).click(function() {
    $.post(serverApiAddr + '/json/member/add', 
        {
            id: $(eId).val(), 
            email: $(eEmail).val(), 
            password: $(ePassword).val()
        },
        function(data) {
            location.href = 'html/memberLoginForm.html';
        },
        'json');
});
    