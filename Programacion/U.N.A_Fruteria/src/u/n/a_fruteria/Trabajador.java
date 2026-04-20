/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package u.n.a_fruteria;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author adria
 */
public class Trabajador implements Serializable {
    private String nombre;
    private String apellido;
    private String DNI;
    private int id;
    private Date fecha_nacimiento = new Date();
    private String Disponibilidad;

    public Trabajador(String nombre, String apellido, String DNI, int id, String Disponibilidad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.DNI = DNI;
        this.id = id;
        this.Disponibilidad = Disponibilidad;
        
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the DNI
     */
    public String getDNI() {
        return DNI;
    }

    /**
     * @param DNI the DNI to set
     */
    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the fecha_nacimiento
     */
    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    /**
     * @param fecha_nacimiento the fecha_nacimiento to set
     */
    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    /**
     * @return the Disponibilidad
     */
    public String getDisponibilidad() {
        return Disponibilidad;
    }

    /**
     * @param Disponibilidad the Disponibilidad to set
     */
    public void setDisponibilidad(String Disponibilidad) {
        this.Disponibilidad = Disponibilidad;
    }
    
}
