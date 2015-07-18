//
//  ViewController.swift
//  SmartTasks
//
//  Created by Rohit Gurnani on 15/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var navBarAppearance = UINavigationBar.appearance()
        
        navBarAppearance.barTintColor = UIColor(red: 103 / 255, green: 188 / 255, blue: 228 / 255, alpha: 1.0)
        navBarAppearance.translucent = false
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

