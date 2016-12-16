<div class="container top-desk navbar-fixed-top">
  <img id="back-cmpny-sym" src="${pageContext.request.contextPath}/resources/visuals/cmpny-sym.jpg" alt ="company-symbol">
  <span id="back-cmpny-name">Cleany Clean</span>
  <img id="profile-pic" class = "img-circle" src="${pageContext.request.contextPath}/resources/visuals/demo-profile-pic.jpg" alt ="company-symbol">
  
  <ul class="nav nav-tabs">
    
  <li class="dropdown drpdwn">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
    ${username}
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
   <li><a href="login">Home</a></li>
      <li><a href="#">Profile</a></li>
      <li><a href="order_history">Order History</a></li>
      <li><a href="prices">Prices</a></li>
       <li><a href="logout">Logout</a></li> 
    </ul>
  </li>
   </ul>
  </div>
 
<div class="container side-bar">
  
      <ul class="nav nav-pills nav-stacked">
        <li id = "home"><a href = "login"  id ="list-itm">Home</a></li>
        <li class = "prices"><a href = "prices"  id ="list-itm">Prices</a></li>
      
        <li id = "order-form"><a title = "" id = "btnClick" href = "#">Order Now</a></li>
        <li id = "order_history"><a id = "oderHistory" href = "order_history" >Order History</a></li>
       
      </ul>
   
    <div class="clearfix visible-lg"></div>
  </div>

