// 주제: 여러 개의 요청 처리하기 - 회원 목록 조회/등록/변경/삭제하기
// [실행 URL]
// => http://localhost:8000/member/delete?id=user001
// [출력 결과]
// => 삭제 성공입니다.

const http = require('http')
const url = require('url')
const mysql = require('mysql');

var pool = mysql.createPool({
    connectionLimit: 10,
    host: '52.78.71.191',
    // port: '3306',
    database: 'studydb',
    user: 'study',
    password: '1111'
});

const server = http.createServer((req, res) => {
    var urlInfo = url.parse(req.url, true);
    
    if (urlInfo.pathname === '/favicon.ico') {
        res.end();
        return;
    }
    
    res.writeHead(200, {
        'Content-Type': 'text/plain;charset=UTF-8'
    });
    
    var id = urlInfo.query.id;
    var email = urlInfo.query.email;
    var password = urlInfo.query.password;

    switch (urlInfo.pathname) {
    case '/member/list':
        var pageNo = 1;
        var pageSize = 3;
        
        if (urlInfo.query.pageNo){
            pageNo = parseInt(urlInfo.query.pageNo);
        }
        if (urlInfo.query.pageNo){
            pageSize = parseInt(urlInfo.query.pageSize);
        }
        
        var startIndex = (pageNo - 1) * pageSize;
        
        pool.query('select mid, email from pms2_member limit ?, ?',
            [startIndex, pageSize],
            function(err, results) {
                if (err) {
                    res.end('DB 조회 중 예외 발생!')
                    return;
                }
                for (var row of results) {
                    console.log('da')
                    console.log(row)
                    res.write(`${row.email}, ${row.mid}\n`);
                }
                res.end();
        });
        
        break;
        
    case '/member/add':
        pool.query('insert into pms2_member(mid, email, pwd)\
            values(?, ?, password(?))',
                [id, email, password],
                function(err, result) {
                    if (err) {
                        res.end('DB 조회 중 예외 발생!')
                        return;
                    }
                    
                 res.write('입력 완료!');
                    res.end();
        });
        
        break;
        
    case '/member/update':
        pool.query('update pms2_member set email=?, pwd=password(?)\
                where mid=?',
                [email, password, id],
                function(err, result) {
                    if (err) {
                        console.log(err);
                        res.end('DB 조회 중 예외 발생!')
                        return;
                    }
                        res.write('수정 완료');
                    res.end();
            });
        
        break;
        
    case '/member/delete':
        pool.query('delete from pms2_member where mid=?',
                [id],
                function(err, results) {
                    if (err) {
                        res.end('DB 조회 중 예외 발생!')
                        return;
                    }
                    
                        res.write('삭제 완료!');
                    res.end();
            });
        
        break;
        
    default:
        res.write('URL 똑바로 치라 마!');
        res.end();
        return;
    }
});

server.listen(8000, () => {
    console.log('서버가 시작됨!')
})