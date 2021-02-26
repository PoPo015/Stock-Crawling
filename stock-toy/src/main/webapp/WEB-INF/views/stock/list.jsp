<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>컨트롤러테스트~</h3>

<!-- <button id="test" onclick="ajaxcli2()">클릭</button> -->


<div id="listTable">
<!-- 	<input type="checkbox" id="check" onclick="reload();" checked="checked"> 10초마다 새로고침 -->
<div class="table-responsive" style="margin:100px">
  <table class="table">
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">종목코드</th>
        <th scope="col">종목명</th>
        <th scope="col">발동가격</th>
        <th scope="col">괴리율</th>
        <th scope="col">발동시간</th>
        <th scope="col">해제시각</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${list}">
      <tr>
        <td>${list.stk_id}</td>
        <td>${list.stk_cd}</td>
		<td>${list.stk_nm}</td>
		<td>${list.stk_pri}</td>
		<td>${list.stk_inc}</td>
		<td>${list.stk_act}</td>
		<td>${list.stk_rel}</td>								
      </tr>
      </c:forEach>
      
    </tbody>
  </table>
</div>
</div>

<br>


</body>

<script>
$( document ).ready(function() {
	setTimeout('location.reload()',150000); 
});
	
/* function ajaxcli2(){

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
 */

 
</script>


</html>

