<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.sorters{
    display :inline;
    padding-left : 10px;
    font-size : 11px;
}
</style>

<div class = "table-holder">
<table class="table table-hover tablesorter" id="table-l">
    <thead>
      <tr>
      
        <th>Categories<div class="sorters"><span class="glyphicon glyphicon-triangle-bottom"></span><span class="glyphicon glyphicon-triangle-top"></span></div></th>
        
        <th>Prices<div class="sorters"><span class="glyphicon glyphicon-triangle-bottom"></span><span class="glyphicon glyphicon-triangle-top"></span></div></th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${not empty item_price }">
    	<c:forEach items="${item_price}" var="list" >
    		<c:choose>
    			<c:when test="${list.getItem_name()=='tshirt'}">
    				 <tr>
    					<td style="width: 250px;">T-Shirt</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'shirt'}">
    				 <tr>
    					<td>Shirt</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'pant'}">
    				 <tr>
    					<td>Pants</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>			
    			<c:when test="${list.getItem_name() == 'jeans'}">
    				 <tr>
    					<td>Jeans</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'ccoat'}">
    				 <tr>
    					<td>Causal Coat</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'fcoat'}">
    				 <tr>
    					<td>Formal Coat</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'sweater'}">
    				 <tr>
    					<td>Sweater</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'jacket'}">
    				 <tr>
    					<td>Jacket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'blanketL'}">
    				 <tr>
    					<td>Large Blanket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'blanketH'}">
    				 <tr>
    					<td>Heavy Blanket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'blanketLU'}">
    				 <tr>
    					<td>Luxary Blanket</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:when test="${list.getItem_name() == 'other'}">
    				 <tr>
    					<td>Other Clothes</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:when>
    			<c:otherwise>
    				<tr>
    					<td>${list.getItem_name()}</td>
        				<td>Rs. ${list.getItem_cost()}</td>
       				</tr>
    			</c:otherwise>
    		</c:choose>
    	</c:forEach>
    </c:if>
   </tbody>
  </table>
</div>
