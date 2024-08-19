<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Producto</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/styles.css" rel="stylesheet">
</head>
<%
    // Obtener los parámetros del producto
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String imagen = request.getParameter("imagen");
    String precio = request.getParameter("precio");

    // Decodificar los parámetros para evitar problemas de codificación
    if (nombre != null) {
        nombre = URLDecoder.decode(nombre, "UTF-8");
        descripcion = URLDecoder.decode(descripcion, "UTF-8");
        imagen = URLDecoder.decode(imagen, "UTF-8");
        precio = URLDecoder.decode(precio, "UTF-8");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= nombre %> - TechSpot</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        .navbar-brand img {
            max-height: 60px;
        }
        .search-container {
            margin-top: 50px; 
            text-align: center; 
        }
        .search-container form {
            max-width: 500px; 
            margin: 0 auto; 
        }
    </style>    
</head>
<body>
    <<header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="../index.jsp">
                <img src="<%= request.getContextPath() %>/imagenes/logo.JPG" alt="TechSpot Logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="../index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../catalogo.jsp">Catálogo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../carrito.jsp">Carrito</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../formularios/registro.jsp">Registrarse</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../formularios/login.jsp">Iniciar Sesión</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="buscar.jsp">Buscar</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <main class="container mt-4">
        <h2><%= nombre %></h2>
        <div class="row">
            <div class="col-md-6">
                <img src="imagenes/<%= imagen %>" class="img-fluid" alt="<%= nombre %>">
            </div>
            <div class="col-md-6">
                <h3>$<%= precio %></h3>
                <p><%= descripcion %></p>
                
                <form action="carrito.jsp" method="post">
                    <input type="hidden" name="nombre" value="<%= URLEncoder.encode(nombre, "UTF-8") %>">
                    <input type="hidden" name="descripcion" value="<%= URLEncoder.encode(descripcion, "UTF-8") %>">
                    <input type="hidden" name="imagen" value="<%= URLEncoder.encode(imagen, "UTF-8") %>">
                    <input type="hidden" name="precio" value="<%= URLEncoder.encode(precio, "UTF-8") %>">
                    <button type="submit" name="action" value="add-to-cart" class="btn btn-primary">Añadir al Carrito</button>
                </form>
            </div>
        </div>
    </main>

    <footer class="bg-dark text-white text-center p-3 mt-4">
        <p>&copy; 2024 TechSpot. Todos los derechos reservados.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
