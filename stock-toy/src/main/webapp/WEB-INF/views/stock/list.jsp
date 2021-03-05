<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
      div.row {
        width: 100%;
        display: flex;
        border: 1px solid #003458;
      }
      div.left {
        width: 45%;
		height:45%;
        float: left;
        box-sizing: border-box;
      }
      div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
      }

      span.red{
      	color:red;
      }
      
      span.blue{
      	color:blue;
      }
    </style>
</head>
<body>

<h1>Vi 데이터 </h1>

<!-- <button id="test" onclick="ajaxcli2()">클릭</button> -->
<!-- 	<input type="checkbox" id="check" onclick="reload();" checked="checked"> 10초마다 새로고침 -->


<div class="left table-responsive" id="StockList">
  <table class="table">
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">종목코드</th>
        <th scope="col">종목명</th>
        <th scope="col">발동가격</th>
        <th scope="col">상승률</th>
        <th scope="col">발동시간</th>
        <th scope="col">해제시각</th>
      </tr>
    </thead>
    <tbody id="tbody">
    <tr id="test">
  	<td id="stk_id"></td>
  	<td id="stk_cd"></td>
   	<td id="stk_nm"></td>
  	<td id="stk_pri"></td> 
  	<td id="stk_inc"></td>
  	<td id="stk_act"></td>
  	<td id="stk_rel"></td>    	  	  	  	 	
	</tr>
 <%--    <c:forEach var="list" items="${list}">
      <tr>
        <td>${list.stk_id}</td>
        <td>${list.stk_cd}</td>
		<td><a href="https://search.naver.com/search.naver?where=news&sm=tab_jum&query=${list.stk_nm}" target="_blank">${list.stk_nm}</a></td>
		<td>${list.stk_pri}</td>
		<td>${list.stk_inc}</td>
		<td>${list.stk_act}</td>
		<td>${list.stk_rel}</td>								
      </tr>
      </c:forEach> --%>
    </tbody>
  </table>
</div>

<div class="right">
<h2>여긴가!!</h2>

</div>

 
<script>
$( document ).ready(function() {
	//리스트 호출
	ajaxcli2();
	
/* 	이미 있던 데이터를 초기화시켜줌
	setInterval('$("#tbody").html("<tr><td id=stk_id><td id=stk_cd><td id=stk_nm><td id=stk_pri><td id=stk_inc><td id=stk_act><td id=stk_rel></tr>")', 10000);
 */
 
	//ajax리로드
	setInterval("ajaxcli2()", 20000);
});
//vi 데이터 가져오기 (json 배열로 온걸 끄내쓰기)
 function ajaxcli2(){
	
	$.ajax({
	    url:"/stock/ajax",
	    type: "get",
	    success: function(data){
	    	//ajax 데이터를 변경하기위해 변수 선언
	    	var stk_id = "";
	    	var stk_cd = "";
	    	var stk_nm = "";
	    	var stk_pri = "";
	    	var stk_inc = "";
	    	var stk_act = "";
	    	var stk_rel = "";
	    	 
			for(let i=0; i<data.length; i++){
	    	
	    	// 상승률이 -인지 체크
		    var rise = data[i].stk_inc.indexOf("-");

		    stk_id += data[i].stk_id + "<br>";
		    stk_cd += data[i].stk_cd + "<br>";
		    stk_nm +="<a target='_blank' href=https://search.naver.com/search.naver?where=news&sm=tab_jum&query=" +data[i].stk_nm + ">" +data[i].stk_nm + "<br>";
		    stk_pri += data[i].stk_pri + "<br>";
			if(rise == 0){ 	
			stk_inc +="<span class='blue'>" +  data[i].stk_inc + "<span><br>";
			}else{
			stk_inc +="<span class='red'>" + data[i].stk_inc + "<span><br>";	
			}
			stk_act += data[i].stk_act + "<br>";
			stk_rel += data[i].stk_rel + "<br>";
		 
			/* 	
				$("#stk_id").append(data[i].stk_id +"<br>");
				$("#stk_cd").append(data[i].stk_cd +"<br>");
				$("#stk_nm").append("<a target='_blank' href=https://search.naver.com/search.naver?where=news&sm=tab_jum&query=" +data[i].stk_nm + ">" + data[i].stk_nm +"<br>");
				$("#stk_pri").append(data[i].stk_pri +"<br>");
				// 0이라면 블루, -1이라면 레드
				if(rise == 0) {
					$("#stk_inc").append("<span class='blue'>" +data[i].stk_inc +"</span><br>"); 
				}else {
					$("#stk_inc").append("<span class='red'>" + data[i].stk_inc +"</span><br>");
				}
				$("#stk_act").append(data[i].stk_act +"<br>");
				$("#stk_rel").append(data[i].stk_rel +"<br>");
			*/
	    	
	    	} // for end
	    	
	    		//데이터 추가해주기
				$("#stk_id").html(stk_id);
				$("#stk_cd").html(stk_cd);
				$("#stk_nm").html(stk_nm);
				$("#stk_pri").html(stk_pri);
				$("#stk_inc").html(stk_inc);
				$("#stk_act").html(stk_act);
				$("#stk_rel").html(stk_rel);
				
			//data.forEach(math => console.log(math));
	    },
	    error: function (request, status, error){
	    	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }

	});
}

 
</script>


</html>

