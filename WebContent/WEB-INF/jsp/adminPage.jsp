<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<title>Admin Page</title>
		<link rel="stylesheet" type = "text/css"  href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_page.css">
		
		<link href="https://fonts.googleapis.com/css?family=Lato|Quicksand" rel="stylesheet">
		
		
		<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/jquery.min.js"></script>
		<script type = "text/javascript" src = "${pageContext.request.contextPath}/resources/jQuery/bootstrap.min.js"></script>
</head>

<body>
<div class="row">
	<div class="col-md-12">
		<div class="row top-deck">
			<div class="col-md-9">
				<div class="row" >
					<div class="col-md-1">
						<a href="#" id="home-link">
							<img src="C:\Users\Dell\Downloads\demo-profile-pic.jpg" alt="compan-image" id="company-image">
						</a>
					</div>
					<div class="col-md-11 head-text">
							<span class="" id="company-name">${c_details.getCompany_name()}</span>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-2">
						<span class="admin-image glyphicon glyphicon-cog" ></span>
					</div>
					<div class="col-md-10 head-text">
						<span id="admin-account">Admin Account</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-2 side-panel">
		<p id="change">Change</p>
		<div class="side-row">
			<ul class="side-list">
			<li><button class="btn btnl" data-toggle = "modal" data-target="#c-details">Company Details</button></li>
			<li><button class="btn btnl" data-toggle = "modal" data-target="#cloth-cost">Cloth Cost</button></li>
			<li><button class="btn btnl" data-toggle = "modal" data-target="#off-offer">%OFF Offer</button></li>
			<li><button class="btn btnl" data-toggle = "modal" data-target="#banner-text">Bannar Text</button></li>
			<li><button class="btn btnl" data-toggle = "modal" data-target="#del-cloth-item">Minimum Order Cost</button></li>
			<li><button class="btn btnl" data-toggle = "modal" data-target="#query-order">Query Order</button></li>
			</ul>
		</div>
	</div>
	<div class="col-md-3">
		<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Total Users</h3>
      					</div>
     					<div class="panel-body panel-div-body">
	     					<p class="text-body">Total users of ${c_details.getCompany_name()}</p>
     					 	<p class="text-body-detail">${all_users}</p>
     					 </div>
    				</div><br/>
    				<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Total Orders</h3>
      					</div>
     					<div class="panel-body panel-div-body">
	     					<p class="text-body">Total Orders placed till date</p>
	     					<p class="text-body-detail">${all_orders}</p>
	     					
	     				</div>
    				</div>
	</div>
	<div class="col-md-3">
	<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Total Orders Served</h3>
      					</div>
     					<div class="panel-body panel-div-body">
							<p class="text-body">Total orders served sussessfully</p>
							<p class="text-body-detail">${done_orders}</p>	     		
	     				 </div>
    				</div><br/>
    				<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Orders in Processing</h3>
      					</div>
     					<div class="panel-body panel-div-body">
							<p class="text-body">Total orders in processing</p>
							<p class="text-body-detail">${processing_orders}</p>	     		
	     				 </div>
    				</div>
	</div>
	<div class="col-md-3">
	<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Amount Recieved</h3>
      					</div>
     					<div class="panel-body panel-div-body">
							<p class="text-body">Total business done</p>
							
							<p class="text-body-detail">Rs. ${total_served_order_cost}</p>
								     		
	     				 </div>
	     				</div>
					<br/>
    				<div class="panel panel-info">
      					<div class="panel-heading">
      						<h3>Potential business</h3>
      					</div>
     					<div class="panel-body panel-div-body">
							<p class="text-body">Cost for orders in process</p>
							<p class="text-body-detail">Rs. ${processing_order_cost}</p>	     		
	     				 </div>
    				</div>
	
</div>
</div>

<div id="c-details" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Change Company Details</h2>
      </div>
      <div class="modal-body">
      	

	        <form class="form-horizontal" action="changeCompanyDetails" method="POST">
		  <div class="form-group">
		    <label class="control-label col-sm-4" for="email">Company Name :</label>
		    <div class="col-sm-8">
		      <input value="${c_details.getCompany_name()}" type="text" class="form-control" id="c-name" name="company_name" placeholder="old company name here!">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-4" for="text">Company Symbol :</label>
		    <div class="col-sm-8"> 
		      <input value="${c_details.getCompany_symbol()}" type="text" class="form-control" name="company_symbol" id="c-symbol" placeholder="old company Symbol!!">
		    </div>
		  </div>
		   <div class="form-group"> 
		   <div class="col-sm-4"></div>
		    <div class="col-sm-8">
		      <button type="submit" class="btn btn-success btn-margin">Save</button>
		    </div>
		  </div>
		</form>
		
      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div id="cloth-cost" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Update per Cloth Cost</h2>
      </div>
      <div class="modal-body">
      <form  action="updatePerItemCosts" method="POST">
        <table class="table">
        	<thead>
        		<tr>
        			<th>Cloth Code</th>
        			<th>Cost /piece</th>
        		</tr>
        	</thead>
        	<tbody>
        		<c:forEach items="${clothList}" var="list">
        			<tr>
        				<td>${list.getItem_name() }</td>
        				<td><input value="${list.getItem_cost()}" type="number" name="${list.getItem_name()}" class="input-class form-control" id="item_cost"></td>
        			</tr>
        		</c:forEach>
        	</tbody>
        </table>
        <button class="btn btn-success update-btn">Update Prices</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl  btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="off-offer" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Set New OFF rate</h2>
      </div>
      <div class="modal-body">
        
			<form class="form-inline" action="updateOff-Offer" method="POST">
				<div class="row">
					<div class="col-md-4">
			  <div class="form-group">
			    <label for="off-perceent" class="right-aligned">Off percent :</label></div>
			    </div>
			    <div class="col-md-3">
			    <input value= "${c_details.getOff_percentage() }" type="number" name="off_percentage" class="form-control" id="off-perceent" name="off-percent">
			  </div>
			  
			  <div class="col-md-5">
			  <button type="submit" class="btn btn-success">Save</button>
				</div>
				</div>
			</form>


      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="banner-text" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Edit Bannar Text</h2>
      </div>
      <div class="modal-body">
        <form class="form-horizontal"  action="updateBannerText" method="POST">
		<div class="form-div">        	
        	<div class="form-group">
        		<label for="banner-text">New Banner Text</label>
        		<textarea name="banner_text" id="banner-text" class="form-control" cols="1" rows="2">${c_details.getBanner_text()}</textarea>
        	</div>

        </div>	
        <button type="submit" class="btn btn-success button">Save</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl  btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="del-cloth-item" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Set Minimum Order Cost</h2>
      </div>
      <div class="modal-body">
			<form class="form-inline" action="updateMinimumOrderCost" method="POST">
				<div class="row">
					<div class="col-md-4">
			  <div class="form-group">
			    <label for="number" class="right-aligned">Minimum Cost :</label></div>
			    </div>
			    <div class="col-md-3">
			    <input value= "${c_details.getMinimum_order_cost()}" type="number" name="minimum_order_cost" class="form-control" id="minimum_order_cost" >
			  </div>
			  
			  <div class="col-md-5">
			  <button type="submit" class="btn btn-success">Save</button>
				</div>
				</div>
			</form>
		       
      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl  btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="off-offer" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Set New OFF rate</h2>
      </div>
      <div class="modal-body">
        
			<form class="form-inline" action="updateOff-Offer" method="POST">
				<div class="row">
					<div class="col-md-4">
			  <div class="form-group">
			    <label for="off-perceent" class="right-aligned">Off percent :</label></div>
			    </div>
			    <div class="col-md-3">
			    <input value= "${c_details.getOff_percentage() }" type="number" name="off_percentage" class="form-control" id="off-perceent" name="off-percent">
			  </div>
			  
			  <div class="col-md-5">
			  <button type="submit" class="btn btn-success">Save</button>
				</div>
				</div>
			</form>


      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="query-order" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">Query Ordert</h2>
      </div>
      <div class="modal-body">
        <form action="queryByOrderID" method="POST" id="query-by-order">
        	<div class="form-group">
        		<div class="row">
        			<div class="col-md-3">
        				<label for="order_id">Order ID:</label>
        			</div>
        			<div class="col-md-9">
       			 		<input type = "number" name="order_id" class="form-control" id="order_input"/>
       				</div>
       				</div>
        		</div>
        <button type="submit" class="btn btn-success button">Search by ID</button>
        
        </form>
        <hr id="form-seperator">
        <form action= "queryByOrderStage" method="POST" id="query-by-stage">
        	<div class="form-group">
        		<div class="row">
        			<div class="col-md-3">
        				<label for="stage">Select Order Stage:</label>
        			</div>
        			<div class="col-md-7">
        	<select id="stages" class="form-control" name="order_stage"> 
        		<option value="PROCESSING">Processing</option>
        		<option value ="SERVED">Served</option>
        	</select>
        	</div>
        	</div>
        	</div>
        	
        	 <button type="submit" class="btn btn-success button">Search by Stage</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class=" btn btnl btn btnl-default" data-dismiss="modal">Close</button>
      </div>
    </div>
</div>
  </div>
</body>
</html>