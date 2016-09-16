//
//  AplicacioniOSTests.swift
//  AplicacioniOSTests
//
//  Created by Sebastian Alvarado on 9/8/16.
//  Copyright © 2016 Sebastian Alvarado. All rights reserved.
//

import UIKit
import XCTest
@testable import AplicacioniOS

class AplicacioniOSTests: XCTestCase {
    
    
    let cantidadUsuarios = 5000
    var nombreUsuario = "salvarado"
    var contrasenaUsuario = "salvarado"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        //se generan la cantidad de usuarios indicada con nombres aleatorios y la misma contrasena por termino practicos
        for _ in 0..<self.cantidadUsuarios {
            let randomString : NSMutableString = NSMutableString(capacity: 5)
            for _ in 0..<5 {
                let length = UInt32 (letters.length)
                let rand = arc4random_uniform(length)
                randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
            }
            Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "\(randomString)",contraseña: "\(randomString)"))
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOrdenLista() {
        //por si quiere cambiar las credenciales solo para este caso descomentar siguientes lineas
        //nombreUsuario = "salvarado"
        //contrasenaUsuario = "salvarado"
        let listaCompleta = Usuarios.instanciaCompartida.listaCompletaUsuarios()
        let listaOrdenada = Usuarios.instanciaCompartida.listaUsuariosOrdenada()
       
        XCTAssertEqual(listaCompleta.first?.getNombre(),listaOrdenada.first?.getNombre())
        XCTAssertEqual(listaCompleta.last!.getNombre(),listaOrdenada.last!.getNombre())
        
        XCTAssertEqual(listaOrdenada.first?.getNombre(), "aanaiz")
        XCTAssertEqual(listaOrdenada.last!.getNombre(), "zzet")
    }
    
    func testIniciarSesion() {
        //por si quiere cambiar las credenciales solo para este caso descomentar siguientes lineas
        nombreUsuario = "aanaiz"
        contrasenaUsuario = "aanaiz"
        
        XCTAssertTrue(Usuarios.instanciaCompartida.validarLogin(nombreUsuario, contraseña: contrasenaUsuario),"El usuario no es válido")
    }
    
    
    func testValidarCrendeciales() {
        //por si quiere cambiar las credenciales solo para este caso descomentar siguientes lineas
        nombreUsuario = "salvarado"
        contrasenaUsuario = "salvarado"
        
        var validado = false
        for usuario in Usuarios.instanciaCompartida.listaUsuariosOrdenada() {
            if usuario.getNombre() == nombreUsuario {
                validado = true
                if usuario.getContraseña() == contrasenaUsuario {
                    XCTAssert(true)
                    break
                }
                else {
                    XCTFail("Contraseña Incorrecta")
                }
            }
        }
        XCTAssertTrue(validado, "Usuario no encontrado")
        //XCTAssertEqual(Usuario(nombre: "asd", contraseña: "").getNombre(), "asa", "Probando Creación")
    }
    
    func testOrdenarLista() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            Usuarios.instanciaCompartida.listaUsuariosOrdenada()
        }
    }
    
}
