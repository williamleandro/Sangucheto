<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Stockear</title>
	    <link rel="icon" type="image/png" href="img/sandwich-icon.png" />
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
        <li><a href="../Sangucheto/">Home</a></li>
        <li><a href="../Sangucheto/armar">Armar</a></li>
        <li><a href="/Sangucheto/ControlStock">Listar Stock</a></li>

        <!-- drop down menu -->
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Producto <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="../Sangucheto/daralta">Dar Alta</a></li>
            <li><a href="../Sangucheto/eliminar">Eliminar</a></li>
            <li class="active"><a href="../Sangucheto/agregarstock">Comprar Prod Stockeado</a></li>
        </ul>
    </li>
</ul>

            </div>

        </div>
</nav>

<br/><br/><br/><br/>

<div class="container">
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron" align="center">
		<h1>Comprar Stock</h1>
	</div>	<!-- /jumbotron -->
	<div class="well">
		<form:form action="agregarstock2" modelAttribute="stock_carga" role="form" method="POST">
			<div class="row"><br />
				<div class="form-group form-group-md form-inline col-md-12 text-center">
					<label for="NombreIngrediente">Producto</label>
					<form:select path="nombre" class="selectpicker form-control" data-width="fit" id="NombreIngrediente" >
						<form:options items="${nombres}" />
					</form:select>
					<label for="cantidad">Cantidad</label>
					<form:input class="form-control" required="required" data-width="35%" id="precio" type="number" 
					 min="1" path="cantidad" placeholder="Ingrese Cantidad" />
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-12 text-center">
					<button type="submit" class="btn btn-primary">Enviar</button><span> || </span>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</div>
		
		</form:form>
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