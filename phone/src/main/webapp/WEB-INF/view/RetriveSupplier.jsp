<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
  <head>
  <link rel="stylesheet" href='<x:url value="/resources/css/bootstrap.min.css"></x:url>' />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style type="text/css">
/* Remove the navbar's default rounded borders and increase the bottom margin */
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
</style>
</head>
<body>
 <h1>
		<center>
			<i>Welcome to Shopping Cart</i>
		</center>
	</h1>

<style>

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li

 

a


:hover


:not

 

(
.activ--

 

)
{
background-color


:

 

#111


;
}
.activ {
	background-color: blue;
}
</style>
</head>
<body>

	<ul>
		<li><a href="home">Home</a></li>
		<li><a href="retrieveUser">Manage users</a></li>
		<li><a href="retrive">Manage Products</a></li>
		<li><a href="retriveC">Manage Categories</a></li>
		<li><a href="RetriveSupplier">Manage Supplier</a></li>


	<li style="float: right"><a class="activ" href="${pageContext.request.contextPath}">Logout</a></li>
	</ul>
	</nav>
 <h1>Hello... <%=session.getAttribute("loggedInUser")%></h1>
    <div class="container">
        
<div ng-app="myApp" ng-controller="customersCtrl">
<input type="text" class="form-control" ng-model="searchBy.name"/>
<table class="table table-hover table-bordered">
  <tr>
       <th>Supplier Id</th> 
       <th>Supplier name</th>
       <th>Supplier address</th>
       <th>Supplier Categoryid</th>
       <th>Supplier Category name</th>
       <th>Supplier product id</th>
       <th>Supplier product name</th>    
      <th>Action</th>
  </tr>
  <tr ng-repeat="s in names | filter:searchBy">
    <td>{{s.supid}}</td>
    
    <td>{{s.supname}}</td>
    <td>{{s.suplocation}}</td>
    <td>{{s.categoryid}}</td>
     <td>{{s.categoryname}}</td>
      <td>{{s.productid}}</td>
      <td>{{s.productname}}</td>
    <td>
    <a href="${pageContext.request.contextPath}/viewsupplier?id={{s.id}}"><span>View</span></a>
    <a href="${pageContext.request.contextPath}/editsupplier?id={{s.id}}"><span>| Edit |</span></a>
    <a href="${pageContext.request.contextPath}/deletesupplier?id={{s.id}}"><span>Delete</span></a>
   </td>  
  </tr>
</table>
<a href="AddSupplier" class="btn btn-info">Add Supplier</a>
</div>
<script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
    $http.get("list2")
    .then(function (response) {$scope.names = response.data;});
});
</script>
</div>
<footer class="container-fluid text-center">
		<p>Copy rights</p>
		<P>2016-2020</P>
	</footer>
</body>
</html>