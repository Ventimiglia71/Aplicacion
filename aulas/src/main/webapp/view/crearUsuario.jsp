<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/aulas/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/aulas/bootstrap-4.5.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/estiloan.css">
<link rel="stylesheet" href="/aulas/css/navbarmio.css">
</head>
<body>
	<c:import url="mantenimiento.jsp" />

	<div class="container-md w-50 mt-5">
		<div class="pt-5"></div>

		<!-- Titulo -->
		<h2 class="pt-3">
			Usuario <span class="badge badge-secondary">CREAR</span>
		</h2>

		<!-- Forumulario -->
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