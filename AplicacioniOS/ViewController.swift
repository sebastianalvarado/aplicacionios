//
//  MasterViewController.swift
//  Tarea.U3.Sebastian.Alvarado
//
//  Created by Sebastian Alvarado on 8/26/16.
//  Copyright © 2016 Sebastian Alvarado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    @IBOutlet weak var errorLabelField: UILabel!

    var usuarios: [(nombre:String, contrasena:String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "salvarado",contraseña: "salvarado"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "pcruzn",contraseña: "12345"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "test",contraseña: "clavetest"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "user",contraseña: "userclave"))
        
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "ralvarez",contraseña: "ralvarez"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "aanaiz",contraseña: "aanaiz"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "rcontreras",contraseña: "rcontreras"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "zzet",contraseña: "zzet"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "rduarte",contraseña: "rduarte"))
        Usuarios.instanciaCompartida.agregarUsuario(Usuario(nombre: "ljara",contraseña: "ljara"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func iniciarSesionStoryID(sender: AnyObject) {
        if Usuarios.instanciaCompartida.validarLogin(usuarioTextField.text! ,contraseña: contrasenaTextField.text!) {
            let siguienteVista = self.storyboard?.instantiateViewControllerWithIdentifier("NewViewController") as! NewViewController
            self.navigationController?.showViewController(siguienteVista, sender: sender)
        }
        else {
            errorLabelField.text = "Credenciales Incorrectas"
        }
    }
    @IBAction func limpiar(sender: AnyObject) {
        usuarioTextField.text = ""
        contrasenaTextField.text = ""
    }
    
    @IBAction func editar(sender: AnyObject) {
        errorLabelField.text = ""
    }
    
    @IBAction func iniciarSesionIdentifier(){
        
        if Usuarios.instanciaCompartida.validarLogin(usuarioTextField.text! ,contraseña: contrasenaTextField.text!) {
            self.performSegueWithIdentifier("sesionUsuario", sender: nil)
        }
        else {
            errorLabelField.text = "Credenciales Incorrectas"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
