<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/aulas/css/resulClas.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/aulas/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/aulas/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/aulas/css/navbarmio.css">
    <link rel="stylesheet" href="/aulas/css/sedes.css">
    <title>Modificación Sede</title>
</head>

<body>
	<c:import url="navbar.jsp"/>
    <h1 id="tit-listado">
        MODIFICACIÓN DE SEDE
    </h1>
    <div class="container-md w-50 table-responsive borde-fucsia-1 disabled-fondo font-blkchcry">
        <form action="/aulas/sedes/modifSede" method="GET">
            <fieldset class="fieldset-border" id="fsidentificacion">
              <legend class="fieldset-border">Identificación</legend>
              <div class="form-group">
                <label class="etiqueta" for="fcodigo" id="lbcodigo">Código:</label>
              <input type="number" class="input-field disabled-obj" name="codigo-deshab" id="fcodigo" value="${sede.getCod_sede()}" disabled>
              <input type="hidden" class="input-field" name="codigo" value="${sede.getCod_sede()}">
              </div>
            </fieldset>

            <fieldset class="fieldset-border" id="fsidentificacion">
                <legend class="fieldset-border">Datos complementarios</legend>
                <div class="form-group">
                    <div class="margen-botton03">
                        <label class="etiqueta" for="fnombre" id="lbcodigo">Nombre:</label>
                        <input type="text" class="input-field" name="nombre" id="fnombre" maxlength="30" value="${sede.getNombre_sede()}" required autofocus>
                    </div>
                    <div class="margen-botton03">
                        <label class="etiqueta" for="fdireccion" id="lbdireccion">Dirección:</label>
                        <input type="text" class="input-field" name="direccion" id="fdireccion"  maxlength="150" value="${sede.getDireccion()}" required>
                    </div>
                    <div class="margen-botton03">
                        <label class="etiqueta" for="ftelefono" id="lbtelefono">Teléfono:</label>
                        <input type="text" class="input-field" name="telefono" id="ftelefono" maxlength="12" value="${sede.getTelefono()}" required>
                    </div>
                    <div class="margen-botton03">
                        <label class="etiqueta" for="fnumaulas" id="lbnumaulas">Aulas:</label>
                        <input type="number" class="input-field" name="numaulas" id="fnumaulas" min="1" max="99" value="${sede.getNum_aulas()}" required>
                    </div>
                </div>
              </fieldset>
              <div>
                <button type="submit" class="btn btn-secondary btn-operacion" id="btn-modificar">
                    Modificar
                </button>            
              </div>              
        </form>
    </div>
</body>
</html>