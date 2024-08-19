<%@ page import="java.net.URLEncoder" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechSpot</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos Personalizados -->
    <link href="styles.css" rel="stylesheet">
    <style>
    .carousel-item img {
        max-height: 400px; /* Ajusta la altura máxima según sea necesario */
        object-fit: cover; /* Asegura que la imagen cubra el área sin deformarse */
    }
    .carousel-caption {
        color: #fff !important; /* Cambia el color del texto a blanco */
        background-color: rgba(0, 0, 0, 0.5); /* Añade un fondo semi-transparente para mejorar la legibilidad */
        padding: 10px;
    }
    </style>
</head>
<body>
    <%
        // Obtener la sesión del usuario
        String userPreference = (String) session.getAttribute("userPreference");

        // Si no hay preferencia almacenada, establecer un valor por defecto
        if (userPreference == null) {
            userPreference = "Smartphones";
            session.setAttribute("userPreference", userPreference);
        }

        // Codificar valores de los productos
        String nombre1 = "Audífonos Gama Alta";
        String descripcion1 = "Audífonos con graves potentes y sonido sólido.";
        String imagen1 = "producto4.JPG";
        String precio1 = "199.990";

        String nombre2 = "Smartphone XYZ";
        String descripcion2 = "El último modelo con tecnología avanzada.";
        String imagen2 = "producto1.JPG";
        String precio2 = "499.990";

        // Codificar las URLs para los productos recomendados
        String urlProducto1 = "producto.jsp?nombre=" + URLEncoder.encode(nombre1, "UTF-8")
                            + "&descripcion=" + URLEncoder.encode(descripcion1, "UTF-8")
                            + "&imagen=" + URLEncoder.encode(imagen1, "UTF-8")
                            + "&precio=" + URLEncoder.encode(precio1, "UTF-8");

        String urlProducto2 = "producto.jsp?nombre=" + URLEncoder.encode(nombre2, "UTF-8")
                            + "&descripcion=" + URLEncoder.encode(descripcion2, "UTF-8")
                            + "&imagen=" + URLEncoder.encode(imagen2, "UTF-8")
                            + "&precio=" + URLEncoder.encode(precio2, "UTF-8");

        // URLs para agregar al carrito
        String addToCart1 = "addCarrito.jsp?nombre=" + URLEncoder.encode(nombre1, "UTF-8")
                            + "&descripcion=" + URLEncoder.encode(descripcion1, "UTF-8")
                            + "&imagen=" + URLEncoder.encode(imagen1, "UTF-8")
                            + "&precio=" + URLEncoder.encode(precio1, "UTF-8");

        String addToCart2 = "addCarrito.jsp?nombre=" + URLEncoder.encode(nombre2, "UTF-8")
                            + "&descripcion=" + URLEncoder.encode(descripcion2, "UTF-8")
                            + "&imagen=" + URLEncoder.encode(imagen2, "UTF-8")
                            + "&precio=" + URLEncoder.encode(precio2, "UTF-8");
    %>
  
    <!-- Header con Navbar -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">
                <img src="<%= request.getContextPath() %>/imagenes/logo.JPG" alt="TechSpot Logo" style="max-width: 150px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="<%= request.getContextPath() %>/index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/catalogo.jsp">Catálogo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/carrito.jsp">Carrito</a>
                    </li>
                    <!-- Enlaces a los formularios -->
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/formularios/registro.jsp">Registrarse</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/formularios/login.jsp">Iniciar Sesión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/formularios/buscar.jsp">Buscar Productos</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    
    <main class="container mt-5">
        <h2 class="text-center">No te pierdas nuestros lanzamientos</h2>
        <!-- Carrusel de Productos -->
        <div id="productCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#productCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#productCarousel" data-slide-to="1"></li>
                <li data-target="#productCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <!-- Primer Slide -->
                <div class="carousel-item active">
                    <a href="http://localhost:8080/ProyectoWeb/producto.jsp?nombre=Smartphone+XYZ&descripcion=Smartphone+XYZ+Negro+5G+500gb&imagen=producto1.JPG&precio=499.990">
                        <img class="d-block w-100" src="<%= request.getContextPath() %>/imagenes/imagen2.JPG" alt="Smartphone XYZ">
                    </a>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Smartphone XYZ</h5>
                    <p>Smartphone XYZ Negro 5G 500gb</p>
                </div>
            </div>
                <!-- Segundo Slide -->
                <div class="carousel-item">
                   <a href="http://localhost:8080/ProyectoWeb/producto.jsp?nombre=Televisor+ABC&descripcion=Smart+TV+55%27%27+4K+Ultra+HD&imagen=producto3.JPG&precio=799.990"> <!-- Enlace al producto 1 -->
                        <img class="d-block w-100" src="<%= request.getContextPath() %>/imagenes/imagen1.JPG" alt="Televisor ABC">
                    </a>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Televisor ABC</h5>
                    <p>Smart TV 55'' 4K Ultra HD</p>
                </div>
            </div>
                <!-- Tercer Slide -->
                <div class="carousel-item">
                   <a href="http://localhost:8080/ProyectoWeb/producto.jsp?nombre=Laptop+GAMER+5000&descripcion=Laptop+GAMER+I7+10th+1T+SSD&imagen=producto2.JPG&precio=1.299.990"> <!-- Enlace al producto 3 -->
                        <img class="d-block w-100" src="<%= request.getContextPath() %>/imagenes/imagen3.JPG" alt="Laptop GAMER">
                    </a>
                <div class="carousel-caption d-none d-md-block">
                    <h5>Laptop GAMER 5000</h5>
                    <p>Laptop GAMER I7 10th 1T SSD</p>
                </div>
                </div>
            <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            </div>
       </div>             

        <div class="container mt-5">
            <h2>¡Nuestra Selección para ti!</h2>
            <p>Porque te gustan los <%= userPreference %>, te recomendamos:</p>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/imagenes/producto4.JPG" class="card-img-top" alt="Audífonos Gama Alta">
                        <div class="card-body">
                            <h5 class="card-title">Audífonos Gama Alta</h5>
                            <p class="card-text">Audífonos con graves potentes y sonido sólido.</p>
                            <a href="<%= addToCart1 %>" class="btn btn-primary">Añadir al Carrito</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/imagenes/producto1.JPG" class="card-img-top" alt="Smartphone XYZ">
                        <div class="card-body">
                            <h5 class="card-title">Smartphone XYZ</h5>
                            <p class="card-text">El último modelo con tecnología avanzada.</p>
                            <a href="<%= addToCart2 %>" class="btn btn-primary">Añadir al Carrito</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>&copy; 2024 TechSpot. Todos los derechos reservados.</p>
    </footer>

    <!-- Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
