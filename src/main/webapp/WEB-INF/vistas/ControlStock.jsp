<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <title>Listar Stock</title>
	    <link rel="icon" type="image/png" href="img/sandwich-icon.png" />
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
	<!-- MENU -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
			
		    	<!-- Logo -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
		    		<a href="../Sangucheto/" class="navbar-brand">Sanguchetto</a>
				</div>
		
				<!-- Menu Items -->
				<div class="collapse navbar-collapse" id="mainNavBar">
				    <ul class="nav navbar-nav">
				        <li ><a href="../Sangucheto/">Home</a></li>
				        <li><a href="../Sangucheto/armar">Armar</a></li>
				        <li class="active"><a href="/Sangucheto/ControlStock">Listar Stock</a></li>
				
				        <!-- drop down menu -->
				    	<li class="dropdown">
					        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Producto <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					            <li><a href="../Sangucheto/daralta">Dar Alta</a></li>
					            <li><a href="../Sangucheto/eliminar">Eliminar</a></li>
					            <li><a href="../Sangucheto/agregarstock">Comprar Prod Stockeado</a></li>
				        	</ul>
				    	</li> <!-- /dropdown -->
					</ul>	<!-- /nav navbar-nav -->
				</div> <!-- /collapse navbar-collapse -->
		     </div>	<!-- /container-fluid -->
		</nav> <!-- /navbar navbar-inverse -->
		
		<br/><br/><br/><br/>
		
		<div class="container">
			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" align="center">
				<h1>Stock disponible</h1>
			</div>	<!-- /jumbotron -->
			
			<div class="well">
				<h1>Ingredientes</h1><br />		  
					<div class="container-fluid">
						<div class="row"  style="border: solid 2px lightgray;">
						    <div class="col-md-6" style="border-right: solid 2px lightgray;">
							    <table class="table table-striped table-responsive table-condensed">
							        <thead>
							  			<tr>
							    			<th>Nombre Ingrediente</th>
							  			</tr>
									</thead>
								      <c:forEach items="${ingredientes}" var="ing">
									      <tr>
									      	<td>${ing.nombre}</td>
									      </tr>
									</c:forEach>
								</table>
						    </div>
						    <div class="col-sm-6">
							    <table class="table table-striped table-responsive table-condensed"> 
							    <thead>
						  			<tr>
						    			<th>Cantidad en Stock</th>
						  			</tr>
								</thead> 		
									<c:forEach items="${cantidad_ingredientes}" var="cantidad">
										<tr>
										<td>${cantidad}</td>	
										</tr>
									</c:forEach>
								</table>
						    </div>
					  </div>			
				  </div>
				<br />
				<h1>Condimentos</h1>
				<br />
					<div class="container-fluid">
						<div class="row" style="border: solid 2px lightgray;">
						    <div class="col-md-6" style="border-right: solid 2px lightgray;">
							    <table class="table table-striped table-responsive table-condensed">
						        <thead>
						  			<tr>
						    			<th>Nombre Condimento</th>
						  			</tr>
								</thead>
							      <c:forEach items="${condimentos}" var="cond">
							      <tr>
							      <td>${cond.nombre}</td>
							      </tr>
								</c:forEach>
								</table>
						    </div>
						    <div class="col-sm-6">
							    <table class="table table-striped table-responsive table-condensed"> 
							    <thead>
						  			<tr>
						    			<th>Cantidad en Stock</th>
						  			</tr>
								</thead> 		
									<c:forEach items="${cantidad_condimentos}" var="cantidad">
										<tr>
										<td>${cantidad}</td>	
										</tr>
									</c:forEach>
								</table>
						    </div>
					  </div>	
				  </div>
			</div>
		</div>
		
		<hr class="featurette-divider">
		
		<!-- FOOTER -->
        <footer>
	        <p class="pull-right"><a href="#">Back to top</a></p>
	        <p>&copy; 2017 Sanguchetto, Inc.</p>
        </footer>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery-1.11.3.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>