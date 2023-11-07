package Controlador;

import Modelo.DAOMASCOTA;
import Modelo.DAOUSUARIO;
import Modelo.Mascota;
import Modelo.PerfilUsuario;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvMascota", urlPatterns = {"/srvMascota"})
public class SrvMascota extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "listasMascotas":
                        listarMascotas(request, response);
                        break;
                    case "nuevaMascota":
                        nuevaMascota(request, response);
                        break;
                    case "registrarMascota":
                        registrarMascota(request, response);
                        break;
                    case "leerMascota":
                        presentarMascota(request, response);
                        break;
                    case "actualizarMascota":
                        actualizarMascota(request, response);
                        break;
                    case "eliminarMascota":
                        eliminarMascota(request, response);
                        break;
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else if (request.getParameter("cambiar") != null) {
                cambiarEstado(request, response);
            }  else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/error-404.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }

    }

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

    private void listarMascotas(HttpServletRequest request, HttpServletResponse response) {
        DAOMASCOTA dao = new DAOMASCOTA();
        List<Mascota> mascota = null;
        try {
            mascota = dao.listarMascota();
            request.setAttribute("mascotas", mascota);

        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las mascotas" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/mascotas.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }
    }

    private void nuevaMascota(HttpServletRequest request, HttpServletResponse response) {

        try {
            this.cargarUsuarios(request);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/nuevaMascota.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar la vista");
        }

    }

    private void cargarUsuarios(HttpServletRequest request) {
        DAOUSUARIO dao = new DAOUSUARIO();
        List<Usuario> usuario = null;
        try {
            usuario = dao.listarUsuario();
            request.setAttribute("usuarios", usuario);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar los usuarios" + e.getMessage());
        } finally {
            usuario = null;
            dao = null;
        }

    }

    private void registrarMascota(HttpServletRequest request, HttpServletResponse response) {
        DAOMASCOTA dao;
        Mascota mascota = null;
        Usuario usuario;
        

        if (request.getParameter("txtNombre") != null
                && request.getParameter("Cliente") != null
                && request.getParameter("txtEspecie") != null
                && request.getParameter("txtMicroChip") != null ) {
            String esterilizado = "N";

            mascota = new Mascota();
            mascota.setNombreMascota(request.getParameter("txtNombre"));
            mascota.setSexo(request.getParameter("txtSexo"));
            mascota.setRaza(request.getParameter("txtRaza"));
            mascota.setEspecie(request.getParameter("txtEspecie"));
            mascota.setMicrochip(request.getParameter("txtMicroChip"));
            if (request.getParameter("txtEsterilizada") != null) {
                if( request.getParameter("txtEsterilizada").toUpperCase().equals("S") ){
                    mascota.setEsterilizada(1);
                } else {
                    mascota.setEsterilizada(0);
                }
            }
            mascota.setPeso(Float.parseFloat(request.getParameter("txtPeso")));
            mascota.setColor(request.getParameter("txtColor"));
            usuario = new Usuario();
            usuario.setDni(request.getParameter("Cliente"));
            mascota.setUsuario(usuario);

            dao = new DAOMASCOTA();
            try {
                 dao.registrarMascota(mascota);
                 response.sendRedirect("srvMascota?accion=listasMascotas");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar la mascota" + e.getMessage());
                request.setAttribute("mascotas", mascota);
                   this.nuevaMascota(request, response);
            }

        }

    }

    private void presentarMascota(HttpServletRequest request, HttpServletResponse response) {
        DAOMASCOTA dao;
        Mascota mascota;
        if (request.getParameter("cod2") != null) {
            mascota = new Mascota();
            mascota.setId_mascota(Integer.parseInt(request.getParameter("cod2")));

            dao = new DAOMASCOTA();
            try {
                mascota = dao.leerMascota(mascota);
                if (mascota != null) {
                    request.setAttribute("mascotas", mascota);

                } else {
                    request.setAttribute("msje", "No se encontró la mascota");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        try {

            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/actualizarMascota.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    }

    private void actualizarMascota(HttpServletRequest request, HttpServletResponse response) {
        DAOMASCOTA daoMas;
        Mascota mascota = null;
        //PerfilUsuario perfil;

        if (request.getParameter("hCodigo") != null) {

            mascota = new Mascota();
            mascota.setId_mascota(Integer.parseInt(request.getParameter("hCodigo")));
            mascota.setNombreMascota(request.getParameter("txtNombre"));
            mascota.setSexo(request.getParameter("txtSexo"));
            mascota.setRaza(request.getParameter("txtRaza"));
            mascota.setEspecie(request.getParameter("txtEspecie"));
            mascota.setMicrochip(request.getParameter("txtMicroChip"));
            mascota.setPeso(Float.parseFloat(request.getParameter("txtPeso")));
            mascota.setColor(request.getParameter("txtColor"));

            //mascota.setFecha_nacimiento(request.getParameter("txtFechaN"));
            //perfil = new PerfilUsuario();
            //perfil.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            //usus.setPerfilUsuario(perfil);
            if (request.getParameter("chkEstado") != null) {
                mascota.setEstado(true);
            } else {
                mascota.setEstado(false);
            }
            daoMas = new DAOMASCOTA();
            try {
                daoMas.actualizarMascota(mascota);
                response.sendRedirect("srvMascota?accion=listasMascotas");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar la mascota" + e.getMessage());
                request.setAttribute("mascotas", mascota);

            }
            try {
                //this.cargarPerfiles(request);
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/actualizarMascota.jsp"
                        ).forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + ex.getMessage());
            }
        }
    }

    private void eliminarMascota(HttpServletRequest request, HttpServletResponse response) {
        DAOMASCOTA dao = new DAOMASCOTA();
        Mascota mascota = new Mascota();

        if (request.getParameter("cod") != null) {
            mascota.setId_mascota(Integer.parseInt(request.getParameter("cod")));
            try {
                dao.eliminarMascota(mascota);
                response.sendRedirect("srvMascota?accion=listasMascotas");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontró la mascota");
        }
    }

     private void cambiarEstado(HttpServletRequest request, HttpServletResponse response) {
        DAOMASCOTA dao;
        Mascota mascota;
        try {
            dao = new DAOMASCOTA();
            mascota = new Mascota();

            if (request.getParameter("cambiar").equals("activar")) {
                mascota.setEstado(true);
            } else {
                mascota.setEstado(false);
            }

            if (request.getParameter("cod") != null) {
                mascota.setId_mascota(Integer.parseInt(request.getParameter("cod")));
                dao.cambiarEstado(mascota);
            } else {
                request.setAttribute("msje", "No se obtuvo el id de la mascota");
            }

        } catch (Exception e) {
            request.setAttribute("msje", e.getMessage());
        }
        this.listarMascotas(request, response);
    }
}
