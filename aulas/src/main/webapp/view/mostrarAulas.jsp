<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="./bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="./bootstrap-4.5.0-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/estiloal.css">
	<link rel="stylesheet" href="./css/navbarmio.css">
	<title>Listado de Aulas</title>
	<script>
		function configurarBorrado(id) {
			codAula = id;
		}
		function borrar() {
			window.location.href = "borrarAula?cod_aula=" + codAula;
		}
	</script>
</head>

<body>
	<c:import url="navbar.jsp" />
	<div class="container-md w-75 mt-5">
		<h2 class="paddingTop20">
			LISTADO <span class="badge badge-secondary">AULAS</span>
		</h2>

		<c:if test="${msg != null}">
			<p class="alert alert-success" role="alert">${msg}</p>
		</c:if>

		<table class="table table-striped table-rosa">
			<thead>
				<tr>
					<th scope="col">Código Aula</th>
					<th class="derecha" scope="col">Nombre Aula</th>
					<th class="derecha" scope="col">Num. Aula</th>
					<th class="derecha" scope="col">Num. Puestos</th>
					<th class="derecha" scope="col">Tipo Ordenador</th>
					<th class="derecha" scope="col">Código Equipo</th>
					<th class="derecha" scope="col">Código Sede</th>
					<th class="derecha" scope="col">Borrar</th>
					<th class="derecha" scope="col">Modificar</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${aulas}" var="aula">
					<tr>
						<th scope="row">${aula.cod_aula}</th>

						<td class="derecha">${aula.nombre_aula}</td>
						<td class="derecha">${aula.num_aula}</td>
						<td class="derecha">${aula.num_puestos}</td>
						<td class="derecha">${aula.cod_tipord}</td>
						<td class="derecha">${aula.cod_equipo}</td>
						<td class="derecha">${aula.cod_sede}</td>
						<td class="derecha">
							<button type="button" class="btn btn-success"
								data-toggle="modal" data-target="#divBorrado"
								onclick="configurarBorrado('${aula.cod_aula}')">Borrar
							</button>

						</td>
						<td class="derecha"><a
							href="/aulas/preModificarAula?cod_aula=${aula.cod_aula}&
							nombre_aula=${aula.nombre_aula}&
							num_aula=${aula.num_aula}&
							num_puestos=${aula.num_puestos}&
							cod_tipord=${aula.cod_tipord}&
							cod_equipo=${aula.cod_equipo}&
							cod_sede=${aula.cod_sede}"
							class="btn btn-success">Modificar</a></td>
					</tr>

				</c:forEach>
			</tbody>

		</table>
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


	</div>
</body>

</html>