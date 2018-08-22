'use strict'

var formState = 'view';
var selectedCardNo = 0;

$(document.body).on('show.detail', (e, no) => {
    formState = 'view';
    
    $.getJSON(`${serverApiAddr}/json/businesscard/${no}`, (result) => {
        if(result.status !== 'success') {return;
            selectedCardNo = 0;
            return;
        }
        selectedCardNo = no;
        
        $('#f-title').val(result.data.title);
        $('#f-writer').val(result.data.writer);
        $('#f-content').val(result.data.content);
    })
})

/*$.getJSON(`${serverApiAddr}/json/detailView/${no}`, function(result) {
    data = result;
    if (data.board == null) {
        alert('게시글이 존재하지 않습니다.');
        location.href = "list.html";
        return;
    }
    $('#fWriter').val(data.board.writer);
    $('#fTitle').val(data.board.title);
    $('#fContent').val(data.board.content);
})*/

$('#update-btn').click(function() {
    $.post(serverApiAddr + `/json/board/detailView/{no}`, {
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

$('#list-btn').click(function() {
    if (page) {
        location.href = `list.html?page=${page}&size=${size}`;
    } else {
        location.href = 'list.html';
    }
});