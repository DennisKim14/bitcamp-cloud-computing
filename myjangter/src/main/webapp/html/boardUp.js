'use strict'

$('#addBtn').click(()=> {
    $.post(`${serverApiAddr}/json/board/boardUp`, {
        'writer': $('#fWriter').val(),
        'title': $('#fTitle').val(),
        'content': $('#fContent').val(),
    }, (result) => {
        if(result.status == "success"){
            location.href = 'detailView.html'
        } else {
            alert('게시글 등록 실패!')
            console.log(result.message)
        }
    }, 'json')
    .fail(() => {
        alert('서버 연결 중 오류!');
    });
});
