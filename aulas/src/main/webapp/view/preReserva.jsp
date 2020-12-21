<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mantenimiento</title>
    <script type="text/javascript">
	    function selecAulas() {
			var codSede = document.getElementById("sedeElegida").value;
	    	window.location.href = "/aulas/cambiaSede?codSede=" + codSede;
	    }
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="./bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" 	href="./bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/estilo.css"></head>
    <link rel="stylesheet" href="./css/navbarmio.css"></head>
</head>
<body>
	<c:import url="navbar.jsp"/>
    <form action="/aulas/consulta">
        <div class="colorCabecera partirEn4">
            <span class="claspan margenSup" id="usuario">Usuario: albertorpon@gmail</span>
        </div>
        <div class="colorCabecera partirEn4">
            <span class="claspan margenSup partirEn2">Seleccione Año: </span>
            <input class="leerAnyo partirEn2" type="text" name="anoSelec" placeholder="${anyo}">
        </div>
        <div class="colorCabecera partirEn4">
            <span class="claspan margenSup partir35">Seleccione Sede: </span>
            <select class="listas partir65" id="sedeElegida" name="jornada" onchange="selecAulas()">
            	<c:forEach items="${sedes}" var="sede">
					<c:choose>
		                <c:when test="${sede.cod_sede eq sedeElegida}">
	                		<option value="${sede.cod_sede}" selected>${sede.nombre_sede}</option>
	                	</c:when>
		                <c:otherwise>
	                		<option value="${sede.cod_sede}">${sede.nombre_sede}</option>
	                	</c:otherwise>
					</c:choose>
				</c:forEach>
            </select>
        </div>
        <div class="colorCabecera partirEn4">
            <span class="claspan margenSup partir35">Seleccione Aula: </span>
            <select class="listas partir65" name="jornada">
            	<c:forEach items="${aulasXSede}" var="aula">
	                <option value="${aula.cod_aula}">${aula.nombre_aula}</option> 
            	</c:forEach>
            </select>
        </div>
        <div class="colorCabecera partirEn4">
            <button class="botonCons" type="submit">Consultar</button>    
        </div>
        </form>
    </body>
</html>