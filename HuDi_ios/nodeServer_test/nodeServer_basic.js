// 모듈추출
var http = require('http');
var mysql = require('mysql');
var http = require('http');
var express = require('express');

// app.use(app.router);
var router = express.Router();	//router: 페이지 라우팅을 구현하는 미들웨어.


// 서버를 실행  
http.createServer(function (request, response) {
    response.writeHead(200, {'Content-Type' : 'text/plain'});
    response.write('hello_nodejs');
    response.end();
}).listen(8800);

console.log('hello');



// 데이터베이스와 연결, createConnection: 데이터베이스에 접속 
var client = mysql.createConnection({ 
		user: 'root',
		password: '',
		database : ''	//연결할 데이터베이스
});


// 데이터베이스 쿼리 사용
client.query('use example');
client.query('SELECT name, AVG(point)from sample group by name', function(error, result, fields){
	if(error) {
		console.log('error!!');
	} else {
		console.log(result);
		}
	});

//next는 다음에 위치하는 함 
//router.get: get요청이 발생했을 때의 이벤트 리스너를 지정. 
//첫 번째 매개변수에는 요청 url입력, 두번째는 요청url입력했을 때 실행할 이벤트 리스너. 
 
router.get('/nextpage', function (request, response, next) {	
	client.query('SELECT name, AVG(point)from user_info group by name;', function (error, result, fields) { 
	//client.query:데이터베이스 쿼리를 사용. select~ 쿼리 문장을 실행한 이후에 매개변수 result로 결과가 입력됨.(비동기 처리방식)
		if(error) {
			console.log('wrong query');
			return;
		}
		response.writeHead(200, {"Content-Type": "text/plain"});	//text/plain:기본적인 텍스트 
		response.write(JSON.stringify(result));
		response.end();

		console.log('hi');
	});
});
// app.use('/', router);
// client.query('select * from sample ')