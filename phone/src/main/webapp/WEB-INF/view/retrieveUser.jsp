<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3"></html>
<html>
<head>

<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
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
					<th>user Id</th>
					<th>user Name</th>
					<th>user Role</th>
					<th>user Status</th>
					<th>user password</th>
					<th>Action</th>
    
				</tr>
				<tr ng-repeat="u in names | filter:searchBy">
					<td>{{u.id}}</td>
					<td>{{u.name}}</td> 
					<td>{{u.role}}</td>
					<td>{{u.status}}</td>
					<td>{{u.password}}</td>
				
					<td><a href="${pageContext.request.contextPath}/EditUser?id={{u.id}}"><span>Edit</span></a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<td><a href="${pageContext.request.contextPath}/deleteuser?id={{u.id}}"><span>Delete</span></a>
						</sec:authorize></td>
				</tr>
			</table>
			

		</div>

			<script>
			var app = angular.module('myApp', []);
			app.controller('customersCtrl', function($scope, $http) {
				$http.get("list3").then(function(response) {
					$scope.names = response.data;
				});
			});
		</script>
	</div>
	
</body>
</html>



