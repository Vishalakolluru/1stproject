<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3"></html>
<html>
<head>
<link rel="stylesheet"	href='<x:url value="/resources/css/bootstrap.min.css"></x:url>' />
<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
				<sec:authorize var="loggedIn" access="isAuthenticated()" />
				<sec:authorize access="permitAll">
					<li><a href="${pageContext.request.contextPath}/logout"><span>Logout</span></a></li>
				</sec:authorize>

				<!-- <li><a href="j_spring_security_logout">Logout</a></li> -->
			</ul>
		</div>
	</nav>
	<h1>
		Hello...
		<%=session.getAttribute("loggedInUser")%></h1>
	<div class="container">

		<div ng-app="myApp" ng-controller="customersCtrl">
			<input type="text" class="form-control" ng-model="searchBy.carName" />
			<table class="table table-hover table-bordered">
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Price</th>
					<th>Product Quantity</th>
					<th>Product Description</th>
    				<th>action</th>
				</tr>
				<tr ng-repeat="x in names | filter:searchBy">
					<td>{{x.Id}}</td>
					<td>{{x.Name}}</td> 
					<td>{{x.Price}}</td>
					<td>{{x.quantity}}</td>
					<td>{{x.Description}}</td>
				
					<td><a href="${pageContext.request.contextPath}/viewPro?id={{x.id}}"><span>View</span></a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
									<sec:authorize access="hasRole('ROLE_USER')">	
							<a href="${pageContext.request.contextPath}/editPro?id={{x.id}}"><span>|Edit |</span></a>
							<a href="${pageContext.request.contextPath}/delete?id={{x.id}}"><span>Delete</span></a>
						</sec:authorize>
						</sec:authorize></td>
				</tr>
			</table>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="addproduct" class="btn btn-info">Add Product</a>
			</sec:authorize>

		</div>

		<script>
			var app = angular.module('myApp', []);
			app.controller('customersCtrl', function($scope, $http) {
				$http.get("list").then(function(response) {
					$scope.names = response.data;
				});
			});
		</script>
	</div>
	
</body>
</html>



