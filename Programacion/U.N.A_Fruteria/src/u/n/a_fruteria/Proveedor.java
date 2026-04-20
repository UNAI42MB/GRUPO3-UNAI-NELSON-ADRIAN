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
public class Proveedor implements Serializable  {
    
    private String Nombre_Empresa;
    private double Precio_unidad;
    private double Coste_envio;
    private Date fecha_entrega = new Date();
    private int tlfn_proveedor;

    public Proveedor(String Nombre_Empresa, double Precio_unidad, double Coste_envio, int tlfn_proveedor) {
        this.Nombre_Empresa = Nombre_Empresa;
        this.Precio_unidad = Precio_unidad;
        this.Coste_envio = Coste_envio;
        this.tlfn_proveedor = tlfn_proveedor;
    }

    /**
     * @return the Nombre_Empresa
     */
    public String getNombre_Empresa() {
        return Nombre_Empresa;
    }

    /**
     * @param Nombre_Empresa the Nombre_Empresa to set
     */
    public void setNombre_Empresa(String Nombre_Empresa) {
        this.Nombre_Empresa = Nombre_Empresa;
    }

    /**
     * @return the Precio_unidad
     */
    public double getPrecio_unidad() {
        return Precio_unidad;
    }

    /**
     * @param Precio_unidad the Precio_unidad to set
     */
    public void setPrecio_unidad(double Precio_unidad) {
        this.Precio_unidad = Precio_unidad;
    }

    /**
     * @return the Coste_envio
     */
    public double getCoste_envio() {
        return Coste_envio;
    }

    /**
     * @param Coste_envio the Coste_envio to set
     */
    public void setCoste_envio(double Coste_envio) {
        this.Coste_envio = Coste_envio;
    }

    /**
     * @return the fecha_entrega
     */
    public Date getFecha_entrega() {
        return fecha_entrega;
    }

    /**
     * @param fecha_entrega the fecha_entrega to set
     */
    public void setFecha_entrega(Date fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }

    /**
     * @return the tlfn_proveedor
     */
    public int getTlfn_proveedor() {
        return tlfn_proveedor;
    }

    /**
     * @param tlfn_proveedor the tlfn_proveedor to set
     */
    public void setTlfn_proveedor(int tlfn_proveedor) {
        this.tlfn_proveedor = tlfn_proveedor;
    }
    
    
}
