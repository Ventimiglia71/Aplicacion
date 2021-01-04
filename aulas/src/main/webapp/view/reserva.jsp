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

		<!-- Cabecera Calendario -->
		<div class="partir3"><p></p></div>
		<div class="partir10">
			<a class="dias" href="/aulas/seleccionar">L</a>
		</div>	
		<div class="partir4"><p></p></div>

		<div class="partir10">
			<a class="dias" href="/aulas/seleccionar">M</a>
		</div>	
		<div class="partir4"><p></p></div>
		<div class="partir10">
			<a class="dias" href="/aulas/seleccionar">X</a>
		</div>	
		<div class="partir4"><p></p></div>
		<div class="partir10">
			<a class="dias" href="/aulas/seleccionar">J</a>
		</div>	
		<div class="partir4"><p></p></div>
		<div class="partir10">
			<a class="dias" href="/aulas/seleccionar">V</a>
		</div>	
		<div class="partir4"><p></p></div>
		<div class="partir10">
			<a class="dias" href="/aulas/seleccionar">S</a>
		</div>	
		<div class="partir4"><p></p></div>
		<div class="partir10">
			<a class="dias" href="/aulas/seleccionar">D</a>
		</div>	
		<div class="partir3 numInvisible"><p>0</p></div>

		<!-- Primera Semana -->
		<div class="partir3"><p></p></div>
		<c:forEach begin="1" end="${diaSem - 2}" var="i">
			<div class="partir10 botonInvisible">
				<a class="numInvisible">0</a>
			</div>	
			<div class="partir4"><p></p></div>
		</c:forEach>		
		<div class="partir10 botonInvisible">
			<a class="numInvisible">0</a>
		</div>	


		<c:forEach begin="${reservasAula[0].dia}" end="${reservasAula[7 - diaSem].dia}" var="i">
			<div class="partir4"><p></p></div>
			<div class="partir10 botonCal">
				<a class="numCal" href="/aulas/seleccionar">${reservasAula[i - 1].dia}</a>
			</div>	
		</c:forEach>  
		<div class="partir3 numInvisible"><p>0</p></div>

		<!-- Cuerpo del mes -->
		<div class="partirNo espacio"><p></p></div>
		<div class="partir3"><p></p></div>
		<div class="partir10 botonCal">
			<a class="numCal" href="/aulas/seleccionar">${reservasAula[i - 1].dia}</a>
		</div>	


		<c:forEach begin="${reservasAula[0].dia}" end="${reservasAula[7 - diaSem].dia}" var="i">
			<div class="partir4"><p></p></div>
			<div class="partir10 botonCal">
				<a class="numCal" href="/aulas/seleccionar">${reservasAula[i - 1].dia}</a>
			</div>	
		</c:forEach>  
		
		<c:forEach begin="${reservasAula[0].dia}" end="${reservasAula[7 - diaSem].dia}" var="i">
			<div class="partir3 numInvisible"><p>0</p></div>
		</c:forEach>  
	</div>
	
	<div class="partir3 mt-1"><p></p></div>
	<div class="partir40 mt-1"><p></p></div>
	<div class="partir1 mt-1"><p></p></div>
	
</body>
</html>