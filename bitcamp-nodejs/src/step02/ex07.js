// 주제: 데이터베이스 프로그래밍 - insert 실행

const mysql = require('mysql');

var con = mysql.createConnection({
    host: '52.78.71.191',
    // port: '3306',
    database: 'studydb',
    user: 'study',
    password: '1111'
});

con.connect(function(err) {
    if (err) throw err;
    
    console.log('연결 성공입니다!');
});

var email = 'user23@test.com';
var mid = 'user23';
var pwd = '1111';

con.query(
    `insert into pms2_member(email, mid, pwd)
    values('${email}', '${mid}', password('${pwd}'))`, 
    function(err, results){
    if (err) throw err;
    
    console.log('입력 성공!');
});

con.end(function(err){
    if (err) throw err;
    
    console.log('연결을 끊었습니다.!');
});

console.log('insert 실행');

