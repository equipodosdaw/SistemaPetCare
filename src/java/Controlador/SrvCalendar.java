package Controlador;

import Modelo.Cita;
import Modelo.DAOCITA;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;


import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SrvCalendar", urlPatterns = {"/SrvCalendar"})
public class SrvCalendar extends HttpServlet {
     

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        List<Cita> citas = new ArrayList<>();
        try {
            if (action != null) {
                switch (action) {
                    case "listarCitas":
                        citas = listarCitas(request, response);
                        break;
                    case "guardarCita":
                        guardarCita(request,response);
                        break;
                    case "editarCita":
                        editarCita(request,response);
                        break;
                    case "eliminarCita":
                        eliminarCita(request,response);
                        break;
                    default:
                        System.out.println("Error no se ha especificado opcion");
                        
                }
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/error-404.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }

        // Configurar respuesta para devolver JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Escribir la lista de eventos JSON en la respuesta
        response.getWriter().write(convertirCitasAJSON(citas));
    }
    
    public String convertirCitasAJSON(List<Cita> citas) {
        StringBuilder jsonCitas = new StringBuilder();
        jsonCitas.append("[");

        for (Cita cita : citas) {
            if (jsonCitas.length() > 1) {
                jsonCitas.append(",");
            }

            jsonCitas.append("{");
            jsonCitas.append("\"id\":\"").append(cita.getId_cita()).append("\",");
            jsonCitas.append("\"title\":\"").append(escapeJSON(cita.getMotivo())).append("\",");
            jsonCitas.append("\"start\":\"").append(cita.getFecha()).append("\",");
            jsonCitas.append("\"mascota\":\"").append(cita.getId_mascota()).append("\",");
            jsonCitas.append("\"centro\":\"").append(cita.getCif()).append("\"");
            
            //Más propiedades de la cita, si es necesario
            jsonCitas.append("}");
        }

        jsonCitas.append("]");

        return jsonCitas.toString();
    }
  
    private String escapeJSON(String input) {
        // Escapar caracteres especiales
        return input.replace("\"", "\\\"");
    }

    
    public List<Cita> listarCitas(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao = new DAOCITA();
        List<Cita> citas = new ArrayList<Cita>();
        try {
            citas = dao.listarCitas();           
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las citas" + e.getMessage());
        } finally {
            dao = null;
        }
        return citas;
    }
    
    
    public void guardarCita(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA daocita;
        Cita cita;
        
        if (request.getParameter("mascota") != null
            && request.getParameter("motivo") != null
            && request.getParameter("fecha") != null
            && request.getParameter("hora") != null
            && request.getParameter("cif_centro") != null){
            
         
            int idMascota = Integer.parseInt(request.getParameter("mascota"));


            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");

            String formattedDate = null;

            try {
                // Parsea la fecha y la hora en los formatos esperados
                LocalDate localDate = LocalDate.parse(fecha);
                LocalTime localTime = LocalTime.parse(hora);

                // Combina la fecha y la hora en un objeto LocalDateTime
                LocalDateTime localDateTime = LocalDateTime.of(localDate, localTime);

                DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                formattedDate = localDateTime.format(myFormatObj);

            } catch (DateTimeParseException e) {
                request.setAttribute("msje", "Formato de fecha u hora incorrecto: " + e.getMessage());
            }
            
            cita = new Cita();
            cita.setId_mascota(idMascota);
            cita.setMotivo(request.getParameter("motivo"));
            cita.setFechaFormateada(formattedDate);
            cita.setCif(request.getParameter("cif_centro"));
            
            daocita = new DAOCITA();
            try {
                daocita.insertarCita(cita);
                response.sendRedirect("srvUsuario?accion=calendario");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo insertar la cita" + e.getMessage());
            }
            
        }
    }
    
    private void editarCita(HttpServletRequest request, HttpServletResponse response) {
        DAOCITA dao;
        Cita cita = null;

        if (request.getParameter("id_cita_edit") != null) {

            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");

            String formattedDate = null;

            try {
                // Parsea la fecha y la hora en los formatos esperados
                LocalDate localDate = LocalDate.parse(fecha);
                LocalTime localTime = LocalTime.parse(hora);

                // Combina la fecha y la hora en un objeto LocalDateTime
                LocalDateTime localDateTime = LocalDateTime.of(localDate, localTime);

                DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                formattedDate = localDateTime.format(myFormatObj);

            } catch (DateTimeParseException e) {
                request.setAttribute("msje", "Formato de fecha u hora incorrecto: " + e.getMessage());
            }
            
            cita = new Cita();
            cita.setId_cita(Integer.parseInt(request.getParameter("id_cita_edit")));
            cita.setId_mascota(Integer.parseInt(request.getParameter("mascota")));
            cita.setMotivo(request.getParameter("motivo"));
            cita.setFechaFormateada(formattedDate);
            cita.setCif(request.getParameter("cif_centro"));
            
            dao = new DAOCITA();
            try {
                dao.actualizarCita(cita);
                response.sendRedirect("srvUsuario?accion=calendario");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar la cita" + e.getMessage());
                request.setAttribute("cita", cita);

            }
        }
    }
    
    public void eliminarCita(HttpServletRequest request, HttpServletResponse response){
        DAOCITA dao = new DAOCITA();
        Cita cita = new Cita();

        if (request.getParameter("id_cita") != null) {
            cita.setId_cita(Integer.parseInt(request.getParameter("id_cita")));
            
            System.out.println(cita);
            try {
                dao.eliminarCita(cita);
                response.sendRedirect("srvUsuario?accion=calendario");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontró la cita");
        }
    }
  /*  
    public Cita obtenerDetallesCita(int id_cita) {
        DAOCITA dao = new DAOCITA();
        Cita cita = null;
        try {
            cita = dao.listarCitaPorId(id_cita);
        } catch (Exception e) {
            // Manejar la excepción según tus necesidades
            e.printStackTrace();
        } finally {
            dao = null; // Asegúrate de cerrar la conexión a la base de datos
        }
        return cita;
    }
    */
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
