//
//
//  AplicacioniOS
//
//  Created by Sebastian Alvarado on 9/14/16.
//  Copyright © 2016 Sebastian Alvarado. All rights reserved.
//

import UIKit

public class Usuario : NSObject {
    
    private var nombre: String
    private var contraseña: String
    
    init(nombre: String, contraseña: String){
        self.nombre = nombre
        self.contraseña = contraseña
        
    }
    
    public func getNombre() -> String {
        return self.nombre
    }
    
    public func getContraseña() -> String {
        return self.contraseña
    }
    
}

public class Usuarios : NSObject {
    
    //se guarda la lista en memoria y se comparte
    class var instanciaCompartida: Usuarios {
        struct Static{
            static let intancia: Usuarios = Usuarios()
        }
        return Static.intancia
    }
    
    private var listaUsuarios = [Usuario]()
    
    func listaUsuariosOrdenada() -> [Usuario]{
        let sortedArray = listaUsuarios.sort { (element1, element2) -> Bool in
            return element1.nombre < element2.nombre
        }
        return sortedArray
    }
    
    func listaCompletaUsuarios() -> [Usuario]{
        return listaUsuarios
    }
    
    func agregarUsuario(usuario: Usuario) {
            self.listaUsuarios.append(usuario)
    }
    //se busca si existe el usuario en la lista y se validan las credenciales
    func validarLogin(nombre: String, contraseña: String) -> Bool{
        for _usuario in self.listaUsuarios {
            if _usuario.getNombre() == nombre && _usuario.getContraseña() == contraseña {
                return true
            }
        }
        return false
    }
    
    
}
