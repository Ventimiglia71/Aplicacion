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
	<div class="container-md w-50">
		<h2 class="paddingTop20">
			MODIFICAR <span class="badge badge-secondary">AULA</span>
		</h2>

		<form action="modificarAula" method="GET">
		
			<div class="form-group">
				<label for="cod_aula">Código Aula</label> <input type="number"
					class="form-control-rosa" name="cod_aula" id="cod_aula" value="${cod_aula}"
					placeholder="Código Aula" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="nombre_aula">Nombre Aula</label> <input type="text"
					class="form-control-rosa" name="nombre_aula" id="nombre_aula" value="${nombre_aula}"
					placeholder="Nombre Aula" required>
			</div>

			<div class="form-group">
				<label for="nombre_aula">Número Aula</label> <input type="number"
					class="form-control-rosa" name="num_aula" id="num_aula" value="${num_aula}"
					placeholder="Número Aula" required>
			</div>

			<div class="form-group">
				<label for="nombre_aula">Número Puestos</label> <input type="number"
					class="form-control-rosa" name="num_puestos" id="num_puestos" value="${num_puestos}"
					placeholder="Número Puestos" required>
			</div>

			<div class="form-group">
				<label for="cod_tipord">Tipo Ordenador</label>
				<select class="form-control-rosa" id="cod_tipord" name="cod_tipord">
					<c:forEach items="${tiposOrdenadores}" var="tipoOrdenador">
					<c:choose>
								<c:when test="${cod_tipord == tipoOrdenador.cod_tipord}">
									<option selected value="${tipoOrdenador.cod_tipord}">${tipoOrdenador.tipo}</option>									
								</c:when>
								<c:otherwise>
									<option value="${tipoOrdenador.cod_tipord}">${tipoOrdenador.tipo}</option>	
								</c:otherwise>
					</c:choose>						
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="nombre_aula">Código Equipo</label>
				<select class="form-control-rosa" id="cod_equipo" name="cod_equipo">
					<c:forEach items="${equipamientos}" var="equipamiento">
					<c:choose>
								<c:when test="${cod_equipo == equipamiento.cod_equipo}">
									<option selected value="${equipamiento.cod_equipo}">${equipamiento.nombre_equipo}</option>								
								</c:when>
								<c:otherwise>
									<option value="${equipamiento.cod_equipo}">${equipamiento.nombre_equipo}</option>
								</c:otherwise>
					</c:choose>							
					</c:forEach>					
				</select>
			</div>

			<div class="form-group">
				<label for="nombre_aula">Código Sede</label>
				<select class="form-control-rosa" id="cod_sede" name="cod_sede">
					<c:forEach items="${sedes}" var="sede">
						<c:choose>
								<c:when test="${cod_sede == sede.cod_sede}">
									<option selected value="${sede.cod_sede}">${sede.nombre_sede}</option>								
								</c:when>
								<c:otherwise>
									<option value="${sede.cod_sede}">${sede.nombre_sede}</option>
								</c:otherwise>
						</c:choose>	
					</c:forEach>					
				</select>
			</div>
			<div class="partirNo">
				<button type="submit" class="btn-mio btn-secondary-mio">Confirmar</button>
			</div>
		</form>
	</div>



</body>
</html>