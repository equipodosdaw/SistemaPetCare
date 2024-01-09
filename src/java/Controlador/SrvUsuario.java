package Controlador;

import Modelo.CentroVet;
import Modelo.DAOCENTROVET;
import Modelo.DAOMASCOTA;
import Modelo.DAOPERFIL;
import Modelo.DAOPROVINCIA;
import Modelo.DAOUSUARIO;
import Modelo.Mascota;
import Modelo.PerfilUsuario;
import Modelo.Provincias;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class SrvUsuario extends HttpServlet {
    @RequestMapping(value = "/srvUsuario", method = RequestMethod.POST)
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                        break;
                    case "listasUsuarios":
                        listarUsuarios(request, response);
                        break;
                    case "nuevo":
                        presentarFormulario(request, response);
                        break;
                    case "registrar":
                        registrarUsuario(request, response);
                        break;
                    case "leerUsuario":
                        presentarUsuario(request, response);
                        break;
                    case "actualizarUsuario":
                        actualizarUsuario(request, response);
                        break;
                    case "eliminarUsuario":
                        eliminarUsuario(request, response);
                        break;
                    case "calendario":
                        reservaCita(request, response);
                        break;
                    case "desactivarUsuario":
                        desactivarUsuario(request, response);
                        break;
                    case "activarUsuario":
                        activarUsuario(request, response);
                        break;
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else {
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

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion;
        DAOUSUARIO dao;
        Usuario usuario;
        usuario = this.obtenerUsuario(request);

        dao = new DAOUSUARIO();
        usuario = dao.identificar(usuario);
        if (usuario != null && usuario.getPerfilUsuario().getNombrePerfil().equals("ADMINISTRADOR")) {
            sesion = request.getSession();
            sesion.setAttribute("admin", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/index-admin.jsp").forward(request, response);
        } else if (usuario != null && usuario.getPerfilUsuario().getNombrePerfil().equals("CLIENTE")) {
            sesion = request.getSession();
            sesion.setAttribute("cliente", usuario);
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/index-cliente.jsp").forward(request, response);
        } else {
            //request.setAttribute("msje", "El nombre de usuario o la contraseña que escribió son incorrectos.");
            request.setAttribute("loginFailed", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("admin", null);
        sesion.invalidate();
        response.sendRedirect("login.jsp");

    }

    private Usuario obtenerUsuario(HttpServletRequest request) {
        Usuario u = new Usuario();
        u.setEmail(request.getParameter("txtUsu"));
        u.setClave(request.getParameter("txtPass"));
        return u;
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        List<Usuario> usus = null;
        try {
            usus = dao.listarUsuario();
            request.setAttribute("usuarios", usus);

        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los usuarios" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/usuarios.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }
    }

    private void presentarFormulario(HttpServletRequest request, HttpServletResponse response) {

        try {
            //this.cargarCargos(request);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("vistas/signup.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar la vista");
        }

    }

    private void cargarPerfiles(HttpServletRequest request) {
        DAOPERFIL dao = new DAOPERFIL();
        List<PerfilUsuario> perfil = null;
        try {
            perfil = dao.listarPerfil();
            request.setAttribute("perfilUsuarios", perfil);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar los perfiles " + e.getMessage());
        } finally {
            perfil = null;
            dao = null;
        }

    }

    private void cargarProvincias(HttpServletRequest request) {
        DAOPROVINCIA dao = new DAOPROVINCIA();
        List<Provincias> provincias = null;
        try {
            provincias = dao.listarProvincias();
            request.setAttribute("listarProvincias", provincias);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar las provincias " + e.getMessage());
        } finally {
            provincias = null;
            dao = null;
        }

    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO daoUsu;
        Usuario usu = null;

        if (request.getParameter("txtNombre") != null
                && request.getParameter("txtEmail") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("txtClave2") != null
                && request.getParameter("txtClave").equals(request.getParameter("txtClave2"))) {

            usu = new Usuario();
            usu.setNombreUsuario(request.getParameter("txtNombre"));
            usu.setEmail(request.getParameter("txtEmail"));
            usu.setClave(request.getParameter("txtClave"));

            daoUsu = new DAOUSUARIO();
            try {
                daoUsu.registrarUsuarios(usu);
                request.setAttribute("registerOk", true);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el usuario" + e.getMessage());
                request.setAttribute("usuario", usu);
                this.presentarFormulario(request, response);
            }

        }

    }

    private void presentarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao;
        Usuario usus;
        if (request.getParameter("cod") != null) {
            usus = new Usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOUSUARIO();
            try {
                usus = dao.leerUsuario(usus);
                if (usus != null) {
                    request.setAttribute("usuario", usus);
                } else {
                    request.setAttribute("msje", "No se encontró el usuario");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        try {
            this.cargarPerfiles(request);
            this.cargarProvincias(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/actualizarUsuario.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    }
    
     /*private void presentarUsuarioCliente(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao;
        Usuario usus;
        if (request.getParameter("cod") != null) {
            usus = new Usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));
     
            dao = new DAOUSUARIO();
            try {
                usus = dao.leerUsuario(usus);
                if (usus != null) {
                    request.setAttribute("cliente", usus);
                } else {
                    request.setAttribute("msje", "No se encontró el usuario");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        try {
            this.cargarPerfiles(request);
            this.cargarProvincias(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/actualizarUsuario_2.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    } */

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO daoUsu;
        Usuario usus = null;
        PerfilUsuario perfil;

        if (request.getParameter("hCodigo") != null) {

            usus = new Usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("hCodigo")));
            usus.setNombreUsuario(request.getParameter("txtNombre"));
            usus.setApellidos(request.getParameter("txtApellidos"));
            usus.setDni(request.getParameter("txtDni"));
            usus.setTelefono(request.getParameter("txtTelefono"));
            usus.setDireccion(request.getParameter("txtDireccion"));
            usus.setCp(request.getParameter("txtCP"));
            usus.setClave(request.getParameter("txtClave"));
            usus.setEmail(request.getParameter("txtEmail"));
            perfil = new PerfilUsuario();
            perfil.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            usus.setPerfilUsuario(perfil);
            int provincia;
            provincia = Integer.parseInt(request.getParameter("txtProvincia"));
            if (request.getParameter("chkEstado") != null) {
                usus.setEstado(true);
            } else {
                usus.setEstado(false);
            }
            daoUsu = new DAOUSUARIO();
            try {
                daoUsu.actualizarUsuarios(usus);
                response.sendRedirect("srvUsuario?accion=listasUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el usuario" + e.getMessage());
                request.setAttribute("usuario", usus);

            }
            try {
                this.cargarPerfiles(request);
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/actualizarUsuario.jsp"
                        ).forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + ex.getMessage());
            }
        }
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        Usuario usus = new Usuario();

        if (request.getParameter("cod") != null) {
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));
            try {
                dao.eliminarUsuario(usus);
                response.sendRedirect("srvUsuario?accion=listasUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontró el usuario");
        }
    }
    
    private void reservaCita(HttpServletRequest request, HttpServletResponse response) {

        DAOMASCOTA dao = new DAOMASCOTA();
        List<Mascota> mascota = null;
        try {
            mascota = dao.listarTodasMascotas();
            request.setAttribute("mascotas", mascota);

        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las mascotas" + e.getMessage());
        } finally {
            dao = null;
        }
        DAOCENTROVET daocentro = new DAOCENTROVET();
        List<CentroVet> centros = null;
        try {
            centros = daocentro.listarCentros();
            request.setAttribute("centros", centros);

        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las mascotas" + e.getMessage());
        } finally {
            daocentro = null;
        }
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/reservaCita.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    }
    
    private void desactivarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        Usuario usus = new Usuario();

        if (request.getParameter("cod") != null) {
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));
            try {
                dao.desactivarUsuario(usus);
                response.sendRedirect("srvUsuario?accion=listasUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontró el usuario");
        }
    }
    
     private void activarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        Usuario usus = new Usuario();

        if (request.getParameter("cod") != null) {
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));
            try {
                dao.activarUsuario(usus);
                response.sendRedirect("srvUsuario?accion=listasUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontró el usuario");
        }
    }

}
