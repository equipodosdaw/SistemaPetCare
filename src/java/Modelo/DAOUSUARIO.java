package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOUSUARIO extends Conexion {

    public Usuario identificar(Usuario user) throws Exception {
        Usuario usu = null;

        ResultSet rs = null;
        String sql = "SELECT U.id_usuario, U.nombreusuario, C.nombreperfil FROM usuario U "
                + "INNER JOIN perfil_usuario C ON U.idperfil = C.id_perfil "
                + "WHERE U.estado = 1 AND U.email = '" + user.getEmail() + "' "
                + "AND U.password = '" + user.getClave() + "'";

        try {
            //false porque no vamos a iniciar ninguna transacción
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            //verificar si encuentra algún registro
            if (rs.next() == true) {
                usu = new Usuario();
                usu.setId_usuario(rs.getInt("id_usuario"));
                usu.setNombreUsuario(rs.getString("nombreusuario"));
                usu.setEmail(user.getEmail());
                usu.setPerfilUsuario(new PerfilUsuario());
                usu.getPerfilUsuario().setNombrePerfil(rs.getString("nombreperfil"));
                usu.setEstado(true);
            }
            rs.close();
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            this.cerrar(false);
        }
        return usu;
    }

    public List<Usuario> listarUsuario() throws Exception {
        List<Usuario> usuarios;
        Usuario usu;
        ResultSet rs = null;
        String sql = "SELECT U.id_usuario, U.nombreusuario, U.estado, C.nombreperfil"
                + " FROM usuario U INNER JOIN perfil_usuario C "
                + "ON C.id_perfil = U.idperfil "
                + "ORDER BY U.id_usuario";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            usuarios = new ArrayList<>();
            //devuelve un conjunto de datos
            while (rs.next() == true) {
                usu = new Usuario();
                usu.setId_usuario(rs.getInt("id_usuario"));
                usu.setNombreUsuario(rs.getString("nombreusuario"));
                usu.setEstado(rs.getBoolean("estado"));
                usu.setPerfilUsuario(new PerfilUsuario());
                usu.getPerfilUsuario().setNombrePerfil(rs.getString("nombreperfil"));

                usuarios.add(usu);

            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return usuarios;
    }

    public void registrarUsuarios(Usuario usu) throws Exception {
        String sql;
        sql = "INSERT INTO usuario (nombreusuario, email, password) VALUES"
                + " ('" + usu.getNombreUsuario() + "', '" + usu.getEmail() + "',"
                + " '" + usu.getClave() + "')";
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;

        } finally {

        }
    }

    public Usuario leerUsuario(Usuario usu) throws Exception {
        Usuario usus = null;
        ResultSet rs = null;
        String sql = "SELECT U.id_usuario, U.nombreusuario, U.apellidos, U.dni, U.telefono, U.email,"
                + "U.direccion, U.cp, U.password, U.estado, U.idperfil"
                + " FROM usuario U WHERE id_usuario = " + usu.getId_usuario();

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);

            //devuelve solo un dato. Si el usuario existe o no
            if (rs.next() == true) {
                usus = new Usuario();
                usus.setId_usuario(rs.getInt("id_usuario"));
                usus.setNombreUsuario(rs.getString("nombreusuario"));
                usus.setApellidos(rs.getString("apellidos"));
                usus.setDni(rs.getString("dni"));
                usus.setTelefono(rs.getString("telefono"));
                usus.setDireccion(rs.getString("direccion"));
                usus.setCp(rs.getString("cp"));
                usus.setEmail(rs.getString("email"));
                usus.setClave(rs.getString("password"));
                usus.setEstado(rs.getBoolean("estado"));
                usus.setPerfilUsuario(new PerfilUsuario());
                usus.getPerfilUsuario().setCodigo(rs.getInt("idperfil"));

            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return usus;
    }

    public void actualizarUsuarios(Usuario usu) throws Exception {
        String sql = "UPDATE usuario SET nombreusuario = '"
                + usu.getNombreUsuario() + "' , apellidos = '"
                + usu.getApellidos() + "' , dni = '"
                + usu.getDni() + "' , telefono = '"
                + usu.getTelefono() + "' , direccion = '"
                + usu.getDireccion() + "' , cp = '"
                + usu.getCp() + "' , password = '"
                + usu.getClave() + "', email = '"
                + usu.getEmail() + "', estado = "
                + (usu.isEstado() == true ? "1" : "0")
                + ", idperfil = " + usu.getPerfilUsuario().getCodigo()
                + " WHERE id_usuario = " + usu.getId_usuario();
        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            //commit
            this.cerrar(true);
        } catch (Exception e) {
            //rollback
            this.cerrar(false);
            throw e;
        }
    }

    public void eliminarUsuario(Usuario usu) throws Exception {
        String sql = "DELETE FROM usuario"
                + " WHERE id_usuario = " + usu.getId_usuario();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
        
    public void desactivarUsuario(Usuario usu) throws Exception {
        String sql = "UPDATE usuario SET estado = 0"
                + " WHERE id_usuario = " + usu.getId_usuario();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

    }
    
        public void activarUsuario(Usuario usu) throws Exception {
        String sql = "UPDATE usuario SET estado = 1"
                + " WHERE id_usuario = " + usu.getId_usuario();

        try {
            this.conectar(false);
            this.ejecutarOrden(sql);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

    }

}
