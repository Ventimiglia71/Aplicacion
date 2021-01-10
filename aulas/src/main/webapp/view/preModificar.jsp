<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="./bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="./bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/estiloal.css"></head>
    <link rel="stylesheet" href="./css/navbarmio.css"></head>
	<title>Modificar Ordenador</title>
</head>
<body>
	<c:import url="navbar.jsp" />
	<div class="partirNo espacio4"></div>
	<div class="container-md w-75">
		<h2 class="paddingTop20">
			MODIFICAR <span class="badge badge-secondary">ORDENADOR</span>
		</h2>
		<form action="/aulas/modificarOrdenador" method="GET">
			<div>
				<input class="invisible" name="cod_ordenador" value="${cod_ordenador}">
			</div>
			<div class="form-group">
				<label for="cod_tipord">Tipo Ordenador</label> 
	            <select class="form-control-rosa" id="cod_tipord" name="cod_tipord">
	           		<option value="1" selected>Windows</option>
					<option value="2">MAC</option>
	            </select>
			</div>
			<div class="form-group">
				<label for="tamano_pant">Tamaño pantalla</label> <input type="text"
					class="form-control-rosa" name="tamano_pant" id="tamano_pant"
					value="${tamano_pant}" required>
			</div>
			<div class="form-group">
				<label for="cpu">CPU</label> <input type="text" class="form-control-rosa"
					name="cpu" id="cpu" value="${cpu}" required>
			</div>
			<div class="form-group">
				<label for="ram">RAM</label> <input type="text" class="form-control-rosa"
					name="ram" id="email" value="${ram}" required>
			</div>

			<div class="partirNo">
				<button type="submit" class="btn-mio btn-secondary-mio">Modificar</button>
			</div>
		</form>
	</div>
</body>
</html>