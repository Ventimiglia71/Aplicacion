<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendario</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="./bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" 	href="./bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/estiloal.css"></head>
    <link rel="stylesheet" href="./css/navbarmio.css"></head>
	<script>
		function volver(){
			window.location.href = "/aulas/preConsulta";
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark purpura-navbar">
	    <a class="navbar-brand" href="/mantenimiento/MenuPrincipal">
	        <img class="logo" src="./imagenes/CICE.PNG" alt="Mantenimiento">
	    </a>
		<c:import url="navbar.jsp"/>
	</nav>
    <form action="/aulas/calendario">
	    <div class="colorContraCabecera partir15 centrado largo2000">
		    <div class="colorContraCabecera partir25 fl izqda">
		        <span class="claspan partirNo ml-1 pt-3_3">Sede:</span>
		        <span class="claspan partirNo ml-1 pt-3">Aula:</span>
		        <span class="claspan partirNo ml-1 pt-3">Año:</span>
		        <span class="claspan partirNo ml-1 pt-3">Mes:</span>
	    	</div>
		    <div class="colorContraCabecera partir75 fl izqda">
		        <input class="leerUsuario mt-1" name="usuario" value="${usuario}" readonly="readonly">
	            <select class="listas mt-1" name="sedeSelec">
	            	<c:forEach items="${sedes}" var="sede">
						<c:choose>
			                <c:when test="${sede.cod_sede eq codSede}">
		                		<option class="desplegable" value="${sede.cod_sede}" selected>${sede.nombre_sede}</option>
		                	</c:when>
			                <c:otherwise>
		                		<option value="${sede.cod_sede}">${sede.nombre_sede}</option>
		                	</c:otherwise>
						</c:choose>
					</c:forEach>
	            </select>
	            <select class="listas mt-1" name="tipoElegido">
	            	<c:forEach items="${tipos}" var="tipo">
						<c:choose>
			                <c:when test="${tipo.cod_tipord eq codTipo}">
		                		<option value="${tipo.cod_tipord}" selected>${tipo.tipo}</option>
		                	</c:when>
			                <c:otherwise>
		                		<option value="${tipo.cod_tipord}">${tipo.tipo}</option>
		                	</c:otherwise>
						</c:choose>
					</c:forEach>
	            </select>
				<c:choose>
	                <c:when test="${empty numPuestos}">
	            		<input 	class="leerAnyo mt-1" type="text" name="numPuestos" placeholder="Num. Puestos" size=2 readonly="readonly">
	               	</c:when>
	                <c:otherwise>
	            		<input 	class="leerAnyo mt-1" type="text" name="numPuestos" value="${numPuestos}" size=2 readonly="readonly">
		          	</c:otherwise>
				</c:choose>
				<c:choose>
	                <c:when test="${seleccionAulas[0].cod_aula eq 0}">
			            <select class="listas mt-1 badge-error" name="aulaSelec">
			            	<c:forEach items="${seleccionAulas}" var="aula">
								<c:choose>
					                <c:when test="${aula.cod_aula eq codAula}">
				                		<option value="${aula.cod_aula}" selected>${aula.nombre_aula}</option>
				                	</c:when>
					                <c:otherwise>
				                		<option value="${aula.cod_aula}">${aula.nombre_aula}</option>
				                	</c:otherwise>
								</c:choose>
							</c:forEach>
			            </select>
			        </c:when>
			        <c:otherwise>
			            <select class="listas mt-1" name="aulaSelec">
			            	<c:forEach items="${seleccionAulas}" var="aula">
								<c:choose>
					                <c:when test="${aula.cod_aula eq codAula}">
				                		<option value="${aula.cod_aula}" selected>${aula.nombre_aula}</option>
				                	</c:when>
					                <c:otherwise>
				                		<option value="${aula.cod_aula}">${aula.nombre_aula}</option>
				                	</c:otherwise>
								</c:choose>
							</c:forEach>
			            </select>
			        </c:otherwise>
				</c:choose>
				<c:choose>
	                <c:when test="${empty anoSelec}">
			            <input 	class="leerAnyo mt-1" type="text" name="anoSelec" id="anoSelec" placeholder="Año" size=4 required>
	               	</c:when>
	                <c:otherwise>
			            <input 	class="leerAnyo mt-1" type="text" name="anoSelec" id="anoSelec" value="${anoSelec}" size=4 required>
		          	</c:otherwise>
				</c:choose>
	            <select class="listas mt-1" name="mesSelec">
					<c:import url="meses.jsp"/>
	            </select>
	    	</div>
	    	<div class="partirNo espacio"><p></p></div>
			<c:choose>
				<c:when test="${seleccionAulas[0].cod_aula ne 0}">
				    <div class="colorContraCabecera">
				            <button class="botonCons" type="submit">Ver Calendario</button>    
				    </div>
			    </c:when>
		    </c:choose>
	    	<div class="partirNo espacio"><p></p></div>
		    <div class="colorContraCabecera">
		            <button class="botonCons" onclick="volver()">Volver</button>    
		    </div>
		</div>
	</form>	
</body>
</html>