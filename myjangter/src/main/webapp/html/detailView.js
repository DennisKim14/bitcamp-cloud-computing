'use strict'

$.getJSON(`${serverApiAddr}/json/detailView/${no}`, function(result) {
    data = result;
    if (data.board == null) {
        alert('게시글이 존재하지 않습니다.');
        location.href = "list.html";
        return;
    }
    $('#fWriter').val(data.board.writer);
    $('#fTitle').val(data.board.title);
    $('#fContent').val(data.board.content);
})

$(eUpdateBtn).click(function() {
    $.post(serverApiAddr + `/json/board/view/{no}`, {
        'writer' : $('#fWriter').val(),
        'title' : $('#fTitle').val(),
        'contnet' : $('#fContent').val()
    }, function(data) {
        if (data.status == 'success') {
            // location.href = `list.html?page=${page}&size=${size}`;
            location.href = 'boardUp.html';
        } else {
            alert('변경 오류입니다!');
            console.log(data.error);
        }
    }, 'json');
});

$(eListBtn).click(function() {
    if (page) {
        location.href = `list.html?page=${page}&size=${size}`;
    } else {
        location.href = 'list.html';
    }
});