<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<title>King Of The Hill</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <style>
.container-fluid {
	background-color: #2b2b2b;
}

.container {
	color: #fff;
	padding-top: 10px;
	font-size: 40px;
	width: 100px;
	text-align: center;
}

.container button {
	border-radius: 60px;
	background-color: #919191;
	font-family: 'fantasy';
	font-weight: bold;
	margin-right: 20px;
}

.headerMenu .btn {
	width: 180px;
	height: 50px;
	box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.3);
	/*text-shadow: 2px 2px 4px #ffffff;*/
}

.all {
	background-color: #3c3c3c;
	border-radius: 80px;
	padding: 30px;
	margin-bottom: 100px;
	margin-left: 100px;
	margin-right: 100px;
}

#panel-head {
	background-color: #919191;
	color: white;
}

#view {
	background-color: #3c3c3c;
	color: white;
}

#view td {
	vertical-align: middle;
	text-align: center;
}

#view td a {
	color: white;
	text-decoration: none;
}

#wform {
	background-color: #3c3c3c;
	color: white;
}
</style>


  <script>
     $(document).ready(function(){
        foodList();
        
     })
     function foodList(){
        $.ajax({
           url:"desk/foodList",
           type:"get",
           dataType:"json",
           success:createView,
           error:function(){
              alert("error");
           }
        });
     }
     
     function createView(data){
        var count = 0;
        var list="<table class='table table-bordered'>";
        list+="<tr>"; // id='food0tr'
        $.each(data, function(index, obj){
           count++;
           list+="<input type='hidden' value='0' id='order_Count"+obj.food_idx+"'>"
           list+="<td><label><a href='javascript:fOrder("+obj.food_idx+")'>";
           list+="<img src='${contextPath}/resources/upload/"+obj.food_Image+"' alt='food' style='width:200px; height:200px;'><br>";
           list+=""+obj.food_Name+"";
           list+="<br>"+obj.food_Price+"</a></label></td>";
           if(count % 5 === 0){
              list+="</tr>";
              list+="<tr>"; // id='food0tr'
           }
           
        })
        list+="</tr>";
        list+="</table>";
        $('#view').html(list);
        $('#view').css("display", "block");
      $('#wform').css("display", "none");
     }
     
     function fOrder(food_idx){
        getOneFoodInfo(food_idx);
        
     }
     
     function getOneFoodInfo(food_idx){
        $.ajax({
           url:"desk/oneFoodInfo/"+food_idx,
           type:"post",
           data:{"food_idx":food_idx},
           dataType:"json",
           success:createOneFoodInfo,
           error:function(){
              alert("error");
           }
        });
     }
     
     function createOneFoodInfo(data){
        var list="";
        var total_Price = parseInt($('#total_Price_td').html());
        
        $.each(data, function(index, obj){
           var order_Count =  $('#order_Count'+obj.food_idx).val();
           var food_Order_Count = parseInt(order_Count)+1;
           $('#order_Count'+obj.food_idx).val(food_Order_Count);
           list="<tr id='"+obj.food_idx+"'>";
           list+="<td id='food_Name"+obj.food_idx+"' class='food_Name'>"+obj.food_Name+"</td>";
           list+="<td class='food_Count'>"+food_Order_Count+"</td>";
           var priceByCount = food_Order_Count * obj.food_Price;
           list+="<td id='food_Price"+obj.food_idx+"' class='food_Price'>"+priceByCount+"</td>";
           list+="<td><button type='button' class='btn btn-danger remove_btn' onclick='delete_btn("+obj.food_idx+")'>삭제</button></td>";
           list+="</tr>";
           if(parseInt($('#order_Count'+obj.food_idx).val())>=2){
              total_Price -= parseInt($('#food_Price'+obj.food_idx).html());
              $('#'+obj.food_idx).remove();
           }
           total_Price += priceByCount;
        });
        $('#none_Order_tr').hide();
        $('.order_table').append(list);
        $('#total_Price_td').html(total_Price);
        $('#wform').show();
        $('#total_Price_tr').show();
     }
     
     function delete_btn(food_idx){
        var total_Price = parseInt($('#total_Price_td').html());
        total_Price -= parseInt($('#food_Price'+food_idx).html());
        $('#total_Price_td').html(total_Price);
        $('tr').remove('#'+food_idx);
        $('#order_Count'+food_idx).val('0');
        if(parseInt($('#total_Price_td').html())==0){
           $('#total_Price_tr').hide();
        }
     }
     
  </script>
</head>
<body style="background-color: #2b2b2b;">
<div class="container-fluid" style="width:1850px;">
<div class="container">
<jsp:include page="../../common/headerMenu.jsp"/>
</div>
<div class="all">
      <div class="panel panel-default" style="width:100%;">
         <div class="panel-heading" id="panel-head">음식주문</div>
         <div class="panel-body" id="view">Content</div>
         <div class="panel-body" id="wform" style="display:none">
            <form id="order_form">
               <input type="hidden" id="food_Name" name="food_Name">
               <input type="hidden" id="food_Count" name="temp_food_Count">
               <input type="hidden" id="food_Price" name="temp_food_Price">
               <table class="table table-bordered order_table">   
                 <tr id="total_Price_tr">
                    <td>합계</td>
                    <td colspan="2" id="total_Price_td">0</td>
                    <td>
                       <button type="button" class="btn btn-success" id="order_complete_btn" onclick="order()">주문하기</button>
                     <button type="button" class="btn btn-warning" id="order_cancel_btn">닫기</button>
                  </td>
                 </tr>
                  <tr id="none_Order_tr">
                     <td>주문 내역이 없습니다</td>
                  </tr>
               </table>
            </form>
         
         
         </div>
      </div>
      </div>
</div>


<script>

   $('#order_cancel_btn').click(function(){
      $('#wform').hide();
   })
   
   function order(){
      const food_Name_ByClassName = document.getElementsByClassName("food_Name");
      console.log(food_Name_ByClassName);
      const food_Count_ByClassName = document.getElementsByClassName("food_Count");
      const food_Price_ByClassName = document.getElementsByClassName("food_Price");
      var food_Name = "";
      var food_Count = "";
      var food_Price = "";
      for(var i=0; i<food_Name_ByClassName.length; i++){

         food_Name += food_Name_ByClassName[i].innerText + " ";
         food_Count += food_Count_ByClassName[i].innerText + " ";
         food_Price += food_Price_ByClassName[i].innerText + " ";
      }
      // hidden으로 보낼 food_Name, food_Count, food_Price 값 설정
      $('#food_Name').attr("value", food_Name);
      $('#food_Count').attr("value", food_Count);
      $('#food_Price').attr("value", food_Price);
      
      alert("재고가 없는 제품을 제외하고 주문이 접수되었습니다. 홈에서 주문 내역을 확인하세요");
      
      $('#order_form').attr("action", "${contextPath}/inner/desk/foodOrderPro");
      $('#order_form').attr("method", "post");
      $('#order_form').submit();
   }
   
   
</script>

</body>
</html>