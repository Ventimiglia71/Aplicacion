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
<link rel="stylesheet" href="/css/estiloan.css">
<title>Listado de Ordenadores</title>
</head>

<body>

	<c:import url="mantenimiento.jsp" />

	<div class="container-md w-75">
		<h2 class="paddingTop20">
			LISTADO <span class="badge badge-secondary">ORDENADORES</span>
		</h2>
		<table class="table table-striped table-dark">
			<thead>
				<tr>
					<th scope="col">Código Ordenador</th>
					<th class="derecha" scope="col">Tipo Ordenador</th>
					<th class="derecha" scope="col">Tamaño de la Pantalla</th>
					<th class="derecha" scope="col">CPU</th>
					<th class="derecha" scope="col">RAM</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ordenadores}" var="ordenador">
					<tr>
						<th scope="row">${ordenador.cod_ordenador}</th>
						
						<td class="derecha">${ordenador.cod_tipord}</td>
						<td class="derecha">${ordenador.tamano_pant}</td>
						<td class="derecha">${ordenador.cpu}</td>
						<td class="derecha">${ordenador.ram}</td>					
						<td><img src=""></td>
						<td class="derecha"><a href="/aulas/borrarordenador?cod_ordenador=${ordenador.cod_ordenador}">Borrar</a></td>
						<td class="derecha"><a href="/aulas/preModificar?cod_ordenador=${ordenador.cod_ordenador}&
							cod_tipord=${ordenador.cod_tipord}&
							tamano_pant=${ordenador.tamano_pant}&
							cpu=${ordenador.cpu}&
							ram=${ordenador.ram}">Modificar</a></td>
					</tr>	
					
				</c:forEach>
			</tbody>
			
			
		</table>


	</div>
</body>

</html>