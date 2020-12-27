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
</head>
<body>
	<c:import url="navbar.jsp"/>
    <div class="colorCabecera partir15">
	    <div class="colorContraCabecera partir20">
		    <span class="claspan partirNo ml-1 pt-1">Usuario:</span>
	        <span class="claspan partirNo ml-1">Año:</span>
	        <span class="claspan partirNo ml-1">Sede:</span>
	        <span class="claspan partirNo ml-1">Aula:</span>
    	</div>
	    <div class="colorContraCabecera partir80">
		    <span class="claspan partirNo ml-1 pt-1">albertorpon@gmail.com</span>
	        <span class="claspan partirNo ml-1">${anoSelec}</span>
	        <span class="claspan partirNo ml-1">${nombreSede}</span>
	        <span class="claspan partirNo ml-1">${nombreAula}</span>
    	</div>
	    <div class="colorContraCabecera paddingSup paddingInf">
	            <button class="botonCons" type="submit">Volver</button>    
	    </div>
	</div>
	<div class="partir1 mt-1"><p></p></div>
	<div class="partir40 mt-1">
		<div class="partirNo colorContraCabecera centrarTexto letraSynemono">Enero</div>
		<div class="partirNo espacio"><p></p></div>
		<div class=partir1></div>
				
	</div>
	<div class="partir3 mt-1"><p></p></div>
	<div class="partir40 mt-1"><p></p></div>
	<div class="partir1 mt-1"><p></p></div>
	
</body>
</html>