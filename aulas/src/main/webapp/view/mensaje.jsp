<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liga Española</title>
    <link href="./css/mensaje.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="window-notice" id="window-notice">
        <div class="content">
            <div class="content-text">${texto}</div> 
            <div class="content-buttons">
                <button class="btn-mio" type="submit" onclick="window.location.href='${ruta}'">Aceptar</button>
            </div>
        </div>
    </div>
</body>
</html>