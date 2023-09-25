package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOPERFIL extends Conexion {

    public List<PerfilUsuario> listarPerfil() throws Exception {
        List<PerfilUsuario> perfilUsuarios;
        PerfilUsuario perfil;
        ResultSet rs = null;
        String sql = "SELECT C.id_perfil, C.nombreperfil, C.estado FROM perfil_usuario C "
                + "ORDER BY C.id_perfil";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            perfilUsuarios = new ArrayList<>();
            while (rs.next() == true) {
                perfil = new PerfilUsuario();
                perfil.setCodigo(rs.getInt("id_perfil"));
                perfil.setNombrePerfil(rs.getString("nombreperfil"));
                perfil.setEstado(rs.getBoolean("estado"));
                perfilUsuarios.add(perfil);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return perfilUsuarios;
    }

}
