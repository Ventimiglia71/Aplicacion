<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap-4.5.0-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/estiloal.css">
	<link rel="stylesheet" href="../css/navbarmio.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark purpura-navbar">
	    <a class="navbar-brand" href="/mantenimiento/MenuPrincipal">
	        <img class="logo" src="../imagenes/CICE.PNG" alt="Mantenimiento">
	    </a>
		<c:import url="navbarAdmin.jsp"/>
	</nav>
	<div class="container-md w-50 mt-5">
		<h2 class="paddingTop20">
			ALTA <span class="badge badge-secondary">USUARIO</span>
		</h2>
		<form action="altaUsuario/confirm" method="POST">

			<!-- User -->
			<div class="form-group mt-4">
				<label class="text-secondary font-weight-bold" for="username">Username</label>
				<input type="text" class="form-control" name="username"
					id="username" placeholder="User name" required>
			</div>

			<!-- Password -->
			<div class="form-group mt-4">
				<label class="text-secondary font-weight-bold" for="password">Password</label>
				<input type="password" class="form-control" name="password"
					id="password" placeholder="Password" required>
			</div>

			<div class="form-group mt-4 form-check">
				<input class="form-control form-check-input" type="radio"
					name="roleUser" id="roleUser" value=true disabled> <label
					class="text-secondary font-weight-bold form-check-label"
					for="roleUser">Role user</label>
			</div>

			<div class="form-group mt-4 form-check">
				<input class="form-control form-check-input" type="radio"
					name="roleUser" id="roleUser" value=false checked> <label
					class="text-secondary font-weight-bold form-check-label"
					for="roleUser">Role admin</label>
			</div>

			<!-- Boton enviar formulario -->
			<div class="botonEnviar mt-4 ">
				<button type="submit" class="btn btn btn-secondary">Crear</button>
			</div>
		</form>
	</div>
</body>
</html>