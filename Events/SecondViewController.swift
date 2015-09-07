//
//  SecondViewController.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 4/26/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    @IBOutlet weak var createSessionButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var sessiondDescriptionTextField: UITextField!
    
    @IBOutlet weak var deleteSessionButton: UIButton!
    @IBOutlet weak var objectIDTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func createSession(sender: AnyObject) {
        let parameters = ["title": self.titleTextField.text!,
                          "description": self.sessiondDescriptionTextField.text!]
        Alamofire.request(ParseRouter.CreateSession(parameters))
    }
    
    @IBAction func deleteSession(sender: AnyObject) {
        Alamofire.request(ParseRouter.DestroySession(self.objectIDTextField.text!))
    }
}

