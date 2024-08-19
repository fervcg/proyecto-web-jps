<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscador</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/styles.css" rel="stylesheet">
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
    <header>
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
                </ul>
            </div>
        </nav>
    </header>
    <div class="container search-container">
        <h2>Buscar Productos</h2>
        <form action="<%= request.getContextPath() %>/catalogo.jsp" method="get">
            <div class="form-group">
                <label for="busqueda">¿Qué estás buscando?</label>
                <input type="text" class="form-control" id="busqueda" name="busqueda" placeholder="Buscar productos..." required>
            </div>
            <button type="submit" class="btn btn-primary">Buscar</button>
        </form>
    </div>

    <!-- Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
