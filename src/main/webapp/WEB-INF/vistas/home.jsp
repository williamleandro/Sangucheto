<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<link rel="icon" type="image/png" href="img/sandwich-icon.png" />
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Sanguchetto</title>
		
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
	</head>
	
	<body background="img/back.jpg">
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
		    		<a href="../Sangucheto/" class="navbar-brand" >Sanguchetto</a>
				</div>
		
				<!-- Menu Items -->
				<div class="collapse navbar-collapse" id="mainNavBar">
				    <ul class="nav navbar-nav">
				        <li class="active"><a href="../Sangucheto/">Home</a></li>
				        <li><a href="../Sangucheto/armar">Armar</a></li>
				        <li><a href="/Sangucheto/ControlStock">Listar Stock</a></li>
				
				        <!-- drop down menu -->
				    	<li class="dropdown">
					        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Producto <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					            <li><a href="../Sangucheto/daralta">Dar Alta</a></li>
					            <li><a href="../Sangucheto/eliminar">Eliminar</a></li>
					            <li><a href="../Sangucheto/agregarstock">Comprar Prod Stockeado</a></li>
				        	</ul>
				    	</li>
					</ul>
				</div>
		     </div>
		</nav>
		
		<br/><br/><br/><br/>
		
		<div class="container" align="center">
			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" align="center">
				<h1>¡Bienvenido a Sanguchetto!</h1>
			</div>
			<form action="armar">
				<input type="submit" class="btn btn-lg btn-success" value="Armar Sanguchetto" />
			</form>
		</div>
		
		 <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	
	    <div class="container marketing">
	    
	    	<!-- START THE FEATURETTES -->

	      <hr class="featurette-divider">
	
	      <div class="row featurette">
	        <div class="col-md-7">
	          <h2 class="featurette-heading" align="center" style="font-family: cursive;color: navy;"> ¡Super Descuento! </h2>
	          <p class="lead" align="center" style="color: navy;">Solo por hoy con la compra desde $50 tenes al instante un descuento del 15% .</p>
	          <p class="lead" align="center" style="color: navy;">No te lo pierdas. Arma tu Sanguchetto Ya!!.</p>
	        </div>
	        <div class="col-md-5">
	          <img class="featurette-image img-responsive center-block" src="img/desc.gif" alt="Generic placeholder image">
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