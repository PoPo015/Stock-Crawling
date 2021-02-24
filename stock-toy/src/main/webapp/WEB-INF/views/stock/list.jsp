<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<h2>컨트롤러테스트~</h2>

<button id="test" onclick="ajaxcli2()">클릭</button>


</body>



<script>

/*  	$("#test").click(function ajaxcli(){
	
	
	$.ajax({
			url: "/stock/new", // 클라이언트가 요청을 보낼 서버의 URL 주소
		    data: date22,                // HTTP 요청과 함께 서버로 보낼 데이터
		    type: "post",                             // HTTP 요청 방식(GET, POST)
		    contentType: "application/json; charset=UTF-8",
		    success: function(data){

		    	alert("성공");
		    },
		    error: function (request, status, error){

		    	alert("실패");		   
		    }

	});
	
	alert("클릭");
	
});  */
	var listDate = 
	{"listDate":
		 [ 
		   {"stk_id":1,
		    "stk_cd":100,
		    "stk_nm": "세운메디칼",
		    "stk_pri": 8910,
		    "stk_inc":100,
		    "stk_act":"09:00:01",
		    "stk_rel":"09:02:01"
		   }
		 ,  
		   {"stk_id":2,
		    "stk_cd":100,
		    "stk_nm": "포포",
		    "stk_pri": 999999,
		    "stk_inc":102,
		    "stk_act":"11:00:01",
		    "stk_rel":"11:02:01"
		   }
		 ]
		}
	
function ajaxcli2(){

	$.ajax({
	          url:'/stock/new',
	          type:'post',
	          contentType:'application/json; charset=UTF-8',
	          dataType:"text",
	          data:JSON.stringify(listDate),
	    success: function(data){
	    	alert("성공");
	    },
	    error: function (request, status, error){
	    	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }

	});
}
	



</script>


</html>

