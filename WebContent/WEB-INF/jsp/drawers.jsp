<link href="https://fonts.googleapis.com/css?family=Lato|Quicksand" rel="stylesheet">
<div class="container top-desk navbar-fixed-top">
  <img id="back-cmpny-sym" src="${pageContext.request.contextPath}/resources/visuals/${company_details.getCompany_symbol()}" alt ="company-symbol">
   <a href = "login" id="back-cmpny-name">${company_details.getCompany_name()}</a>
    <img id="profile-pic" class = "img-circle" src="${pageContext.request.contextPath}/resources/visuals/demo-profile-pic.jpg" alt ="company-symbol">
      <ul class="nav nav-tabs">
       <li class="dropdown drpdwn">
         <a class="dropdown-toggle" data-toggle="dropdown" href="#">${username}<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="login"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Home</a></li>
            <li><a href="order_history"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;Order History</a></li>
            <li><a href="prices"><span class="glyphicon glyphicon-usd"></span>&nbsp;&nbsp;Prices</a></li>
            <li><a href="logout"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Logout</a></li> 
          </ul>
         </li>
      </ul>
 </div>
  <div class="container side-bar">
   <ul class="nav nav-pills nav-stacked">
     <li id = "home"><a href="login"  id="list-itm"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Home</a></li>
     <li class = "prices"><a href="prices"  id="list-itm"><span class="glyphicon glyphicon-usd"></span>&nbsp;&nbsp;Prices</a></li>
     <li id="order-form"><a title="" id="btnClick" href="#"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;Order Now</a></li>
     <li id = "order_history"><a id ="oderHistory" href="order_history"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;Order History</a></li>
   </ul>
    <div class="clearfix visible-lg">
    </div>
  </div>

