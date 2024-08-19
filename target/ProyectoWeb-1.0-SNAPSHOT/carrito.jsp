<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp">TechSpot</a>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Inicio</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="carrito.jsp">Carrito</a>
                </li>
            </ul>
        </div>
    </nav>

    <main class="container mt-5">
        <h2>Tu Carrito de Compras</h2>
        <%
            ArrayList<String[]> carrito = (ArrayList<String[]>) session.getAttribute("carrito");

            if (carrito == null) {
                carrito = new ArrayList<>();
                session.setAttribute("carrito", carrito);
            }

            // Añadir productos al carrito
            String action = request.getParameter("action");
            if ("add-to-cart".equals(action)) {
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String imagen = request.getParameter("imagen");
                String precio = request.getParameter("precio");

                if (nombre != null && descripcion != null && imagen != null && precio != null) {
                    // Decodificar los parámetros para manejar caracteres especiales
                    nombre = URLDecoder.decode(nombre, "UTF-8");
                    descripcion = URLDecoder.decode(descripcion, "UTF-8");
                    imagen = URLDecoder.decode(imagen, "UTF-8");
                    precio = URLDecoder.decode(precio, "UTF-8");
                    
                    carrito.add(new String[]{nombre, descripcion, imagen, precio});
                }
                response.sendRedirect("carrito.jsp");
                return;
            }

            // Eliminar producto del carrito
            if ("remove-from-cart".equals(action)) {
                int index = Integer.parseInt(request.getParameter("index"));
                if (index >= 0 && index < carrito.size()) {
                    carrito.remove(index);
                }
                response.sendRedirect("carrito.jsp");
                return;
            }

            if (carrito.size() == 0) {
                out.println("<p>Tu carrito está vacío.</p>");
            } else {
        %>
        <table class="table">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Imagen</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < carrito.size(); i++) {
                        String[] producto = carrito.get(i);
                        // Decodificar los datos para manejarlos correctamente en HTML
                        String nombre = URLDecoder.decode(producto[0], "UTF-8");
                        String descripcion = URLDecoder.decode(producto[1], "UTF-8");
                        String imagen = URLDecoder.decode(producto[2], "UTF-8");
                        String precio = URLDecoder.decode(producto[3], "UTF-8");
                %>
                <tr>
                    <td><%= nombre %></td>
                    <td><%= descripcion %></td>
                    <td>$<%= precio %></td>
                    <td><img src="<%= request.getContextPath() %>/imagenes/<%= imagen %>" alt="Imagen Producto" style="max-width: 100px;"></td>
                    <td>
                        <form action="carrito.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="action" value="remove-from-cart">
                            <input type="hidden" name="index" value="<%= i %>">
                            <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="formularios/compra.jsp" class="btn btn-primary btn-lg btn-block">Proceder al Pago</a>
        <% } %>
    </main>

    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>&copy; 2024 TechSpot. Todos los derechos reservados.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
