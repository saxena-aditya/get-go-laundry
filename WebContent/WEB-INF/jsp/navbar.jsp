<nav class="navbar navbar-inverse navigation navbar-fixed-top">
  <div class="container-fluid nav-div">
    <div class="navbar-header ">
     <img id = "head-cmpny-sym" class="img-responsive" src = "${pageContext.request.contextPath}/resources/visuals/${company_details.getCompany_symbol()}" alt = "head-compny-symbol">
	   <a class="navbar-brand cmpny-title" href="home" style = "color : white;">${company_details.getCompany_name()}</a>
    </div>
      <ul class="nav navbar-nav navbar-right nav-act ul">
        <li><a href="registerMe" class = "a">Register Yourself</a></li>
        <li><a href="about-us" class = "a">About Us</a></li>
        <li><a href="home" class = "a">Home</a></li>
      </ul>
  </div>
</nav>