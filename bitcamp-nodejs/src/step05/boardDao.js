// 주제: DAO 모듈 만들기

var pool;

//클로저가 복제되어 this를 안써도된다. 뭔말이여?
exports.setConnectionPool = (connectionPool) => {
    //this를 안쓴다면 애로우 함수 가능
    pool = connectionPool;
};

exports.list = (pageNo = 1, pageSize = 3, handler) => {
    var startIndex = (pageNo - 1) * pageSize;
    
    // 그냥 pool하면 로컬변수를 찾는다. this를 붙여야한다.
    pool.query('select bno,titl,cdt from pms2_board limit ?, ?',
            [startIndex, pageSize],
            function(err, results) {
            // 비동기로 작동하기때문에 return이 별 의미가 없다.
            //return results;
            handler(err, results);
    });
};

exports.add = (data, handler) => {
    pool.query(
            'insert into pms2_board(titl,cont,cdt) values(?,?,now())',
        [data.title, data.content, data.createdate],
        function(err, result) {
                handler(err, result);
    });
}

exports.update = (data, handler) => {
    pool.query(
            'update pms2_board set titl=?, cont=?, cdt=now() where bno=?',
        [data.title,
         data.content,
         data.no],
        function(err, result) {
                 handler(err, result);
    });
}

exports.remove = (data, handler) => {
    pool.query('delete from pms2_board where bno=?',
        [data.no],
        function(err, result) {
            handler(err, result);
    });
}