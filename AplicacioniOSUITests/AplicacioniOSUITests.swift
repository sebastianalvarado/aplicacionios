//
//  AplicacioniOSUITests.swift
//  AplicacioniOSUITests
//
//  Created by Sebastian Alvarado on 9/8/16.
//  Copyright © 2016 Sebastian Alvarado. All rights reserved.
//


import UIKit
import XCTest
@testable import AplicacioniOS

class AplicacioniOSUITests: XCTestCase {
    
    
    var nombreUsuario = "salvarado"
    var contrasenaUsuario = "salvarado"
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

 
    func testInicioSesion(){
        self.measureBlock {
            
            let app = XCUIApplication()
            app.buttons["Limpiar"].tap()
            app.textFields["Usuario"].tap()
            app.textFields["Usuario"].typeText(self.nombreUsuario)
            app.secureTextFields["Contraseña"].tap()
            app.secureTextFields["Contraseña"].typeText(self.contrasenaUsuario)
            app.navigationBars.buttons["Iniciar Sesión"].tap()
            app.buttons["Volver"].tap()
            
        }
    }
    
    func testReordenarLista() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        self.measureBlock {
            
            let app = XCUIApplication()
            app.buttons["Limpiar"].tap()
            app.textFields["Usuario"].tap()
            app.textFields["Usuario"].typeText(self.nombreUsuario)
            app.secureTextFields["Contraseña"].tap()
            app.secureTextFields["Contraseña"].typeText(self.contrasenaUsuario)
            /*
            app.textFields.element.tap()
            app.textFields.element.typeText(self.nombreUsuario)
            app.secureTextFields.element.tap()
            app.secureTextFields.element.typeText(self.contrasenaUsuario)
            */
            app.navigationBars.buttons["Iniciar Sesión"].tap()
            
            app.buttons["Reordenar"].tap()
            app.buttons["Volver"].tap()
            
          
            
            
        }
        
        
    }
    
}
