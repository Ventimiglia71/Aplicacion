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
	<c:import url="navbar.jsp"/>
    <form action="/aulas/reserva">
        <div class="colorCabecera partir20">
            <span class="claspan margenSup" id="usuario">Usuario: albertorpon@gmail</span>
			<input class="invisible" name="usuario" value="albertorpon@gmail">
        </div>
        <div class="colorCabecera partir20">
            <span class="claspan margenSup partir50">Seleccione Año: </span>
			<c:choose>
                <c:when test="${empty anyo}">
		            <input 	class="leerAnyo partir50" type="text" name="anoSelec" id="anoSelec"
		            		placeholder="Año" onchange="refresAnyo(${sedeElegida})" size=4>
               	</c:when>
                <c:otherwise>
		            <input 	class="leerAnyo partir50" type="text" name="anoSelec" id="anoSelec"
		            		value="${anyo}" onchange="refresAnyo(${sedeElegida})" size=4>
	          	</c:otherwise>
			</c:choose>
        </div>
        <div class="colorCabecera partir20">
            <span class="claspan margenSup partir35">Seleccione Sede: </span>
			<c:choose>
                <c:when test="${empty anyo}">
		            <select class="listas partir65" id="sedeElegida" name="sedeSelec" onchange="selecAulas(0)">
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
		        </c:when>
                <c:otherwise>
		            <select class="listas partir65" id="sedeElegida" name="sedeSelec" onchange="selecAulas(${anyo})">
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
                </c:otherwise>
            </c:choose>
        </div>
        <div class="colorCabecera partir20">
            <span class="claspan margenSup partir35">Seleccione Aula: </span>
            <select class="listas partir65" name="aulaSelec">
            	<c:forEach items="${aulasXSede}" var="aula">
	                <option value="${aula.cod_aula}">${aula.nombre_aula}</option> 
            	</c:forEach>
            </select>
        </div>
        <div class="colorCabecera partir20">
            <button class="botonCons" type="submit">Calendario</button>    
        </div>
    </form>
    </body>
</html>