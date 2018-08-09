// 과제 - 회원관리, 팀관리, 게시판, 강좌관리 웹 애플리케이션 만들기

const express = require('express')
const app = express();

// POST 요청 데이터 처리
const bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({extended: false}))

// 정적 HTML 파일 처리
app.use(express.static('public'))

// 통합 템플릿 엔진 관리자 모듈 로딩
// => 템플릿 엔진이 아니라 템플릿 엔진을 중간에서 관리해주는 역할을 수행한다.
const consolidate = require('consolidate')

// Express에 템플릿 엔진을 등록한다.
// => consolidate에 대해 handlebars를 지정하면
//    이 템플릿 관리자는 Node 모듈에서 handlerbars를 찾아 리턴한다.
// => Express 여러 개의 엔진을 등록할 수 있다.
// 엔진이름은 마음대로 줘도된다. consolidate는 모든 엔진을 중간에서 다 중재해준다.
app.engine('html', consolidate.handlebars)

// 등록된 템플릿 엔진 중에 사용할 엔진을 지정한다.
// 'view engine'은 정해진 것 건들지 마!
app.set('view engine', 'html')

// 템플릿 파일이 있는 디렉토리 경로를 지정한다.
const path = require('path')
// 'view'는 정해진 것 건들지 마!
app.set('views', path.join(__dirname, 'templates'))

// => 라우터를 Express의 웹서버에 등록한다.
app.use('/member', require('./member'))
app.use('/board', require('./board'))

app.get('/hello', (req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain;charset=UTF-8'});
    res.write('Hello!');
    res.end();
});

app.listen(8000, () => {
    console.log('서버 실행중...')
})