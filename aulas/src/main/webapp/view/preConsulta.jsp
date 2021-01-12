<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mantenimiento</title>
    <script type="text/javascript">
	    function refresAnyo(codSede) {
			var anyo = document.getElementById("anoSelec").value;
	    	window.location.href = "/aulas/cambiaSede?anyo=" + anyo + "&codSede=" + codSede;
	    }
	    
	    function selecAulas(anyo) {
			var codSede = document.getElementById("sedeElegida").value;
	    	window.location.href = "/aulas/cambiaSede?anyo=" + anyo + "&codSede=" + codSede;
	    }
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="./bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" 	href="./bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/estiloal.css"></head>
    <link rel="stylesheet" href="./css/navbarmio.css"></head>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark purpura-navbar">
	    <a class="navbar-brand" href="/mantenimiento/MenuPrincipal">
	        <img class="logo" src="./imagenes/CICE.PNG" alt="Mantenimiento">
	    </a>
		<c:import url="navbar.jsp"/>
	</nav>
    <form action="/aulas/reserva">
	    <div class="colorContraCabecera partir15 centrado">
		    <div class="colorContraCabecera partir25 fl izqda">
			    <span class="claspan partirNo ml-1 pt-2_1">Usuario:</span>
		        <span class="claspan partirNo ml-1 pt-3_3">Sede:</span>
		        <span class="claspan partirNo ml-1 pt-3">Tipos:</span>
		        <span class="claspan partirNo ml-1 pt-3">Puestos:</span>
	    	</div>
		    <div class="colorContraCabecera partir75 fl izqda">
		        <input class="leerUsuario mt-1" name="usuario" value="${usuario}" readonly="readonly">
	            <select class="listas mt-1" name="sedeSelec">
	            	<c:forEach items="${sedes}" var="sede">
						<c:choose>
			                <c:when test="${sede.cod_sede eq codSede}">
		                		<option value="${sede.cod_sede}" selected>${sede.nombre_sede}</option>
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
	            <input 	class="leerAnyo mt-1" type="text" name="numPuestos" placeholder="Num. Puestos" size=2 required>
	    	</div>
	    	<div class="partirNo espacio"><p></p></div>
		    <div class="colorContraCabecera paddingSup paddingInf">
		            <button class="botonCons" type="submit">Ver Aulas</button>    
		    </div>
		</div>
    </form>
</body>
</html>