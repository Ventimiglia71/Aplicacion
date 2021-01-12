<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="../bootstrap-4.5.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/estiloal.css">
<link rel="stylesheet" href="../css/navbarmio.css">
<title>Listado de Usuarios</title>
<script>	
	function configurarBorrado(id) {
		idUsuario = id;
	}
	function borrar() {
		window.location.href = "borrarUsuario?id=" + idUsuario;
	}
</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark purpura-navbar">
		<a class="navbar-brand" href="/mantenimiento/MenuPrincipal"> <img
			class="logo" src="../imagenes/CICE.PNG" alt="Mantenimiento">
		</a>
		<c:import url="navbarAdmin.jsp" />
	</nav>
	<div class="container-md w-75 my-5">
		<h2 class="paddingTop20">
			LISTADO <span class="badge badge-secondary">USUARIOS</span>
		</h2>

		<c:if test="${msg != null}">
			<p class="alert alert-success" role="alert">${msg}</p>
		</c:if>

		<table class="table table-striped table-rosa">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Activo</th>
					<th scope="col">Usuario</th>
					<th scope="col">Password</th>
					<th scope="col">Borrar</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuario">
					<tr>
						<th scope="row" class="align-middle text-center">${usuario.id}</th>
						<td class="align-middle text-left">${usuario.enabled}</td>
						<td class="align-middle text-left">${usuario.username}</td>
						<td class="align-middle text-left">${usuario.password}</td>
						<td class="align-middle text-center">
							<button type="button" class="btn btn-secondary"
								data-toggle="modal" data-target="#divBorrado"
								onclick="configurarBorrado('${usuario.id}')">Borrar</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="modal fade" id="divBorrado" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-cice">
					<h5 class="modal-title text-white" id="exampleModalLongTitle">Borrar
						usuario</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">¿Estas seguro que quieres borrar este
					registro?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" onclick="borrar()">Aceptar</button>
					<button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>