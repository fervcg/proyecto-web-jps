<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - TechSpot</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos Personalizados -->
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="buscar.jsp">Buscar</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="container mt-5">
        <h2>Inicio de Sesión</h2>
        <form action="<%= request.getContextPath() %>/login" method="post">
            <div class="form-group">
                <label for="emailLogin">Correo Electrónico</label>
                <input type="email" class="form-control" id="emailLogin" name="emailLogin" required>
            </div>
            <div class="form-group">
                <label for="passwordLogin">Contraseña</label>
                <input type="password" class="form-control" id="passwordLogin" name="passwordLogin" required>
            </div>
            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
        </form>
    </div>

    <!-- Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
