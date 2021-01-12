<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Agregar equipos</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap-4.5.0-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/navbarmio.css">
	<link rel="stylesheet" href="../css/estiloRegistro.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark purpura-navbar">
	    <a class="navbar-brand" href="/mantenimiento/MenuPrincipal">
	        <img class="logo" src="../imagenes/CICE.PNG" alt="Mantenimiento">
	    </a>
		<c:import url="navbarAdmin.jsp"/>
	</nav>
	<form action="grabarEquipamiento" class="form-registro">
		<h4>Ingrese nombre y descripción del equipo</h4>
		<label for="nombre_equipo">Nombre</label> 
		<input class="control" type="text" maxlength="20" name="nombre_equipo" id="nombre_equipo" placeholder="Nombre"> 
		<label for="descripcion">Descripción</label>
		<input class="control" type="text" maxlength="100" name="descripcion" id="descripcion" placeholder="Descripcion"> 
		<input class="boton" type="submit" value="Registrar"> 
		<a href="/aulas">Inicio</a><br>
	</form>
</body>
</html>