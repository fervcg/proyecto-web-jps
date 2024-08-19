<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
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
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="carrito.jsp">Carrito</a>
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
        <h2>Catálogo de Productos</h2>

        <%
            // Obtener el término de búsqueda de los parámetros de solicitud
            String terminoBusqueda = request.getParameter("busqueda");

            // Productos en el catálogo
            List<String[]> productos = new ArrayList<>();
            productos.add(new String[] {"Smartphone XYZ", "Smartphone XYZ Negro 5G 500gb", "producto1.JPG", "499.990"});
            productos.add(new String[] {"Televisor ABC", "Smart TV 55'' 4K Ultra HD", "producto3.JPG", "799.990"});
            productos.add(new String[] {"Laptop GAMER 5000", "Laptop GAMER I7 10th 1T SSD", "producto2.JPG", "1.299.990"});
            productos.add(new String[] {"Audífonos II", "Audífonos inalámbricos noise cancelador de ruido", "producto4.JPG", "199.990"});

            // Lista para almacenar los resultados filtrados
            List<String[]> resultados = new ArrayList<>();

            // Filtrar productos según el término de búsqueda
            for (String[] producto : productos) {
                String nombre = producto[0].toLowerCase();
                String descripcion = producto[1].toLowerCase();
                if ((terminoBusqueda == null || terminoBusqueda.isEmpty()) ||
                    nombre.contains(terminoBusqueda.toLowerCase()) ||
                    descripcion.contains(terminoBusqueda.toLowerCase())) {
                    resultados.add(producto);
                }
            }
        %>

        <% if (resultados.isEmpty()) { %>
            <p>No se encontraron productos que coincidan con "<%= terminoBusqueda %>".</p>
        <% } else { %>
            <div class="row">
                <% for (String[] producto : resultados) { %>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <img src="imagenes/<%= producto[2] %>" class="card-img-top" alt="<%= producto[0] %>">
                            <div class="card-body">
                                <h5 class="card-title"><%= producto[0] %></h5>
                                <p class="card-text"><%= producto[1] %></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="producto.jsp?nombre=<%= URLEncoder.encode(producto[0], "UTF-8") %>&descripcion=<%= URLEncoder.encode(producto[1], "UTF-8") %>&imagen=<%= URLEncoder.encode(producto[2], "UTF-8") %>&precio=<%= URLEncoder.encode(producto[3], "UTF-8") %>" 
                                           class="btn btn-sm btn-outline-secondary">Ver más</a>
                                        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="addToCart('<%= URLEncoder.encode(producto[0], "UTF-8") %>', '<%= URLEncoder.encode(producto[1], "UTF-8") %>', '<%= URLEncoder.encode(producto[2], "UTF-8") %>', '<%= URLEncoder.encode(producto[3], "UTF-8") %>')">Añadir al Carrito</button>
                                    </div>
                                    <small class="text-muted">$<%= producto[3] %></small>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } %>
    </main>

    <footer class="bg-dark text-white text-center p-3 mt-4">
        <p>&copy; 2024 TechSpot. Todos los derechos reservados.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function addToCart(nombre, descripcion, imagen, precio) {
            let form = document.createElement('form');
            form.method = 'post';
            form.action = '<%= request.getContextPath() %>/addCarrito.jsp';

            form.appendChild(createHiddenInput('nombre', decodeURIComponent(nombre)));
            form.appendChild(createHiddenInput('descripcion', decodeURIComponent(descripcion)));
            form.appendChild(createHiddenInput('imagen', decodeURIComponent(imagen)));
            form.appendChild(createHiddenInput('precio', decodeURIComponent(precio)));

            document.body.appendChild(form);
            form.submit();
        }

        function createHiddenInput(name, value) {
            let input = document.createElement('input');
            input.type = 'hidden';
            input.name = name;
            input.value = value;
            return input;
        }
    </script>
</body>
</html>
