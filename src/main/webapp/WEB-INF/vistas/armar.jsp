<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="icon" type="image/png" href="img/sandwich-icon.png" />
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Arma Sanguchetto</title>
		
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
				        <li class="active"><a href="../Sangucheto/armar">Armar</a></li>
				        <li><a href="/Sangucheto/ControlStock">Listar Stock</a></li>
				
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
				<h1>Arma tu Sanguchetto</h1>
			</div>	<!-- /jumbotron -->
		
			<div class="row">
				<div class="col-lg-6">
					<h2>Ingredientes</h2>
					<table class="table table-striped" >
						<thead>
							<tr>
								<th align="center"> Nombre </th>
								<th align="center"> Precio </th>
								<th align="center"> Stock </th>
								<th align="center"> Acci&oacute;n </th>
							</tr>
						</thead>
						<c:forEach items="${stockIng}" var="ingrediente">
							<tr>
								<td align="left"> ${ingrediente.key.nombre} </td>
								<td align="left"> $ ${ingrediente.key.precio} </td>
								<td align="left"> ${ingrediente.value} </td>
								<td align="left">
									<a href="agregarIngrediente?ingrediente=${ingrediente.key.nombre}">
										<button type="button" class="btn btn-primary">Agregar</button>
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>	<!-- /table table-striped -->
				</div>	<!-- /col-lg-4 -->
				
				<div class="col-lg-6">
					<h2>Condimentos</h2>
					<table class="table table-striped">
						<thead>
							<tr>
								<th align="center"> Nombre </th>
								<th align="center"> Precio </th>
								<th align="center"> Stock </th>
								<th align="center"> Acci&oacute;n </th>
							</tr>
						</thead>
						<c:forEach items="${stockCond}" var="condimento">
							<tr>
								<td align="left"> ${condimento.key.nombre} </td>
								<td align="left"> $ ${condimento.key.precio} </td>
								<td align="left"> ${condimento.value} </td>
								<td align="left">
									<a href="agregarIngrediente?ingrediente=${condimento.key.nombre}">
										<button type="button" class="btn btn-primary">Agregar</button>
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>	<!-- /col-lg-4 -->
			</div>	<!-- /row -->
			
			 <hr class="featurette-divider">
			 
			<div class="container" align="center">
				<h1>Tu Sangucheto</h1>
				<div class="col-md-12" align="center">
					<table class="table table-striped" align="center">
						<thead>
						<tr>
							<th align="center"> Nombre </th>
							<th align="center"> Precio </th>
						</tr>
						<thead>
						<tr> 
							<th colspan="3" class="info"> Ingredientes </th>
						</tr>
						<c:forEach items="${miSanguchettoIng}" var="miIngrediente">
							<tr>
								<td> ${miIngrediente.nombre} </td>
								<td> $ ${miIngrediente.precio} </td>
								<td align="center"> 
									<a href="eliminarIngrediente?ingrediente=${miIngrediente.nombre}">
										<button type="button" class="btn btn-danger">Quitar</button>
									</a>
							    </td>
							</tr>
						</c:forEach>
						<tr> 
							<th colspan="3" class="success"> Condimentos </th>
						</tr>
						<c:forEach items="${miSanguchettoCond}" var="miCondimento">
							<tr>
								<td> ${miCondimento.nombre} </td>
								<td> $ ${miCondimento.precio} </td>
								<td align="center"> 
									<a href="eliminarIngrediente?ingrediente=${miCondimento.nombre}">
											<button type="button" class="btn btn-danger">Quitar</button>
									</a>
							    </td>
							</tr>
						</c:forEach>
					</table>	<!-- /table table-striped -->
				</div> <!-- /col-md-6 -->
			</div>	<!-- /container -->
			
			<hr class="featurette-divider">
			
			<div class="container" align="center">
				<div class="page-header" align="center">
        			<h1>Precio</h1>
        			<div class="alert alert-danger" role="alert"> SOLO POR HOY: Con tu compra mayor de $50 tenes un 15% de descuento.</div>
     			 </div>
				
				<div class="jumbotron" align="center" style="width: 400px;">
					<c:if test="${precioSanguchetto<=50.0}">
					 <h1 align="center">$${precioSanguchetto}</h1>
					 <h5 align="center" style="color: red;">No se aplica descuento</h5>
					</c:if>
					
					<c:if test="${precioSanguchetto>50.0}">
						<h1 align="center"><c:out value="$${precioDescontado}"></c:out></h1>
						<h5 align="center"> Precio Anterior = <c:out value="$${precioSanguchetto}"></c:out></h5>
						<h5 align="center" style="color: red;"> Descuento = <c:out value="$${descuento}"></c:out></h5>
					</c:if>
			    </div>	<!-- /jumbotron -->
			</div>	<!-- /container -->
			
			<div class="container" align="center">
				<form:form action="disfrutaSanguchetto" method="POST" style="display:inline">
					<c:if test="${bandera==true}">
						<input type="submit" class="btn btn-lg btn-success" value="ARMAR"> 
					</c:if>
					<c:if test="${bandera==false}">
						<input type="submit" disabled="disabled" class="btn btn-lg btn-success" value="ARMAR"> 
					</c:if>
				</form:form>
				
				
				<form:form action="limpiarSanguchetto" method="POST" style="display:inline">
					<c:if test="${bandera==true}">
						<input type="submit" class="btn btn-lg btn-danger" value="DESARMAR"> 
					</c:if>
					<c:if test="${bandera==false}">
						<input type="submit" disabled="disabled" class="btn btn-lg btn-danger" value="DESARMAR"> 
					</c:if>
				</form:form>
			</div>	<!-- /container -->
		</div>	<!-- /container -->
		
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