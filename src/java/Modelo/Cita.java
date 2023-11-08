package Modelo;

import java.util.Date;

public class Cita {
  

    private int id_cita;
    private Date fecha;
    private String fechaFormateada;
    private String motivo;
    private int id_mascota;
    private String cif;

    
    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public int getId_mascota() {
        return id_mascota;
    }

    public void setId_mascota(int id_mascota) {
        this.id_mascota = id_mascota;
    }

    public String getCif() {
        return cif;
    }

    public void setCif(String cif) {
        this.cif = cif;
    }

    public void setFechaFormateada(String fechaHoraFormateada) {
        this.fechaFormateada = fechaHoraFormateada;
    }
    
    public String getFechaFormateada() {
        return fechaFormateada;
    }
    
    @Override
    public String toString() {
        return "Cita{" + "id_cita=" + id_cita + ", fecha=" + fecha + ", motivo=" + motivo + ", id_mascota=" + id_mascota + ", cif=" + cif + '}';
    }
}
