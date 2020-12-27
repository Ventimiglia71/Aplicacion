<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/bootstrap-4.5.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/hoteleclipse.css">
<title>Alta Ordenador</title>
</head>

<body>

	<c:import url="mantenimiento.jsp" />

	<div class="container-md w-75">
		<h2 class="paddingTop20">
			ALTA <span class="badge badge-secondary">ORDENADOR</span>
		</h2>

		<form action="/aulas/altaordenador" method="POST">
		
			<div class="form-group">
				<label for="tipo_ordenador">Tipo Ordenador</label> <input
					type="text" class="form-control" name="tipo_ordenador"
					id="tipo_ordenador" placeholder="Tipo ordenador" required>
			</div>
			<div class="form-group">
				<label for="tamano_pant">Tamaño pantalla</label> <input type="text"
					class="form-control" name="tamano_pant" id="tamano_pant"
					placeholder="Tamaño pantalla" required>
			</div>
			<div class="form-group">
				<label for="cpu">CPU</label> <input type="text" class="form-control"
					name="cpu" id="cpu" placeholder="Tipo de CPU" required>
			</div>
			<div class="form-group">
				<label for="ram">RAM</label> <input type="text" class="form-control"
					name="ram" id="email" placeholder="Numero de RAM" required>
			</div>

			<div class="botonEnviar">
				<button type="submit" class="btn btn-secondary">Crear</button>
			</div>
		</form>
	</div>



</body>
</html>