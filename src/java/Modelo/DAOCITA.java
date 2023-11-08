package Modelo;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAOCITA extends Conexion {
              

    public List<Cita> listarCitas() throws Exception {
        List<Cita> citas;
        Cita cita;
        ResultSet rs = null;
        String selectCita = "SELECT c.id_cita,c.fecha,c.motivo,c.id_mascota,c.cif FROM cita c ORDER BY fecha DESC";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(selectCita);
            citas = new ArrayList<>();
            //devuelve un conjunto de datos
            while (rs.next() == true) {
                cita = new Cita();
                cita.setId_cita(rs.getInt("id_cita"));
                cita.setFecha(rs.getTimestamp("fecha"));
                cita.setMotivo(rs.getString("motivo"));
                cita.setId_mascota(rs.getInt("id_mascota"));
                cita.setCif(rs.getString("cif"));
                

                citas.add(cita);

            }
           
            for(Cita cit: citas){
                System.out.println(cit.toString());
            }
            
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return citas;
    }
    
    public Cita listarCitaPorId(int id_cita) throws Exception {
        Cita cita = null;
        ResultSet rs = null;
        String selectCitaId = "SELECT id_cita, fecha, motivo, id_mascota, cif FROM cita WHERE id_cita = " + id_cita;

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(selectCitaId);

            if (rs.next()) {
                cita = new Cita();
                cita.setId_cita(rs.getInt("id_cita"));
                cita.setFecha(rs.getTimestamp("fecha"));
                cita.setMotivo(rs.getString("motivo"));
                cita.setId_mascota(rs.getInt("id_mascota"));
                cita.setCif(rs.getString("cif"));
            }

            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

        return cita;
    }

    public void insertarCita(Cita cita) throws Exception {
        String insertCita;
        insertCita = "INSERT INTO cita (fecha, motivo, id_mascota, cif) VALUES"
                + " ('" + cita.getFechaFormateada() + "', '" + cita.getMotivo() + "',"
                +  cita.getId_mascota() + ", '" + cita.getCif() + "')";
        try {
            this.conectar(false);
            this.ejecutarOrden(insertCita);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;

        } finally {

        }
    }

    public void actualizarCita(Cita cita) throws Exception {
        String updateCita = "UPDATE cita SET"
                + " id_mascota = " + cita.getId_mascota()
                + " , fecha = '" + cita.getFechaFormateada() + "'"
                + " , motivo = '" + cita.getMotivo() + "'"
                + " , cif = '" + cita.getCif() + "'"
                + " WHERE id_cita = " + cita.getId_cita();
        System.out.println(updateCita);
        try {
            this.conectar(false);
            this.ejecutarOrden(updateCita);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void eliminarCita(Cita cita) throws Exception {
        String deleteCita = "DELETE FROM cita"
                          + " WHERE id_cita = " + cita.getId_cita();

        try {
            this.conectar(false);
            this.ejecutarOrden(deleteCita);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

    }  
    
    
    
}
