<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Obtener los parámetros del producto
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String imagen = request.getParameter("imagen");
    String precio = request.getParameter("precio");

    // Decodificar los parámetros para manejar caracteres especiales
    nombre = java.net.URLDecoder.decode(nombre, "UTF-8");
    descripcion = java.net.URLDecoder.decode(descripcion, "UTF-8");
    imagen = java.net.URLDecoder.decode(imagen, "UTF-8");
    precio = java.net.URLDecoder.decode(precio, "UTF-8");

    // Crear una lista de productos si no existe
    ArrayList<String[]> carrito = (ArrayList<String[]>) session.getAttribute("carrito");

    if (carrito == null) {
        carrito = new ArrayList<>();
    }

    // Añadir el producto al carrito
    String[] producto = {nombre, descripcion, imagen, precio};
    carrito.add(producto);

    // Guardar el carrito actualizado en la sesión
    session.setAttribute("carrito", carrito);

    // Redirigir al usuario a la página del carrito
    response.sendRedirect("carrito.jsp");
%>
