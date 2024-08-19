<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Compra - TechSpot</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos Personalizados -->
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
    <!-- Navegación -->
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
                    <li class="nav-item active">
                        <a class="nav-link" href="buscar.jsp">Buscar</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Formulario de Compra -->
    <div class="container mt-4">
        <h2>Realizar Compra</h2>
        <form id="checkoutForm" action="/compra" method="POST">
            <div class="form-group">
                <label for="nombreCompleto">Nombre completo:</label>
                <input type="text" class="form-control" id="nombreCompleto" name="nombreCompleto" required>
            </div>
            <div class="form-group">
                <label for="direccion">Dirección de envío:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" required>
            </div>
            <div class="form-group">
                <label for="emailCompra">Correo electrónico:</label>
                <input type="email" class="form-control" id="emailCompra" name="email" required>
            </div>
            <div class="form-group">
                <label for="tarjeta">Número de tarjeta:</label>
                <input type="text" class="form-control" id="tarjeta" name="tarjeta" required pattern="\d{16}" title="Ingrese un número de tarjeta válido de 16 dígitos">
            </div>
            <div class="form-group">
                <label for="fechaExpiracion">Fecha de expiración:</label>
                <input type="month" class="form-control" id="fechaExpiracion" name="fechaExpiracion" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV:</label>
                <input type="text" class="form-control" id="cvv" name="cvv" required pattern="\d{3}" title="Ingrese un código CVV válido de 3 dígitos">
            </div>
            <button type="submit" class="btn btn-primary">Realizar Compra</button>
        </form>
    </div>
</body>
</html>
