/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package u.n.a_fruteria;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author adria
 */
public class Archivo_Object {
    
    String ruta;
    
    
    public Archivo_Object(){}
    
    public void Guardar_ArrayList_Trabajador(String ruta, ArrayList<Trabajador> trabajador){
        
        try {
            ObjectOutputStream oos = new ObjectOutputStream (new FileOutputStream(ruta));
            oos.writeObject(trabajador);
            System.out.println("Datos trabajador guardados correctamente");
            oos.close();
        } catch (IOException ex) {
            Logger.getLogger(Archivo_Object.class.getName()).log(Level.SEVERE, null, ex);
        }
                   
}
    
    public ArrayList <Trabajador> leerArrayList_Trabajador (String ruta){
             ArrayList<Trabajador> trabajador = new ArrayList<>();
        
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(ruta))){
            trabajador = (ArrayList<Trabajador>) ois.readObject();
            
        } catch (IOException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return trabajador;
        
    }
    
    public void Guardar_ArrayList_Cliente(String ruta, ArrayList<Cliente> cliente ){
        
        try {
            ObjectOutputStream oos = new ObjectOutputStream (new FileOutputStream(ruta));
            oos.writeObject(cliente);
            System.out.println("Datos cliente guardados correctamente");
            oos.close();
        } catch (IOException ex) {
            Logger.getLogger(Archivo_Object.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
    public void Guardar_ArrayList_(String ruta, ArrayList<Proveedor> proveedor){
        
        try {
            ObjectOutputStream oos = new ObjectOutputStream (new FileOutputStream(ruta));
            oos.writeObject(proveedor);
            System.out.println("Datos proveedor guardados correctamente");
            oos.close();
        } catch (IOException ex) {
            Logger.getLogger(Archivo_Object.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }


}
