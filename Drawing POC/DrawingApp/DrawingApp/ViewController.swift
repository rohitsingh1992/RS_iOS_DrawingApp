//
//  ViewController.swift
//  DrawingApp
//
//  Created by Rohit Singh on 04/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func colorTapper(sender : UIButton) {
        var obj = drawView as DrawingView
        if sender.titleLabel?.text == "Red" {
        obj.drawColor = UIColor.redColor()
        }
        else {
        obj.drawColor = UIColor.blackColor()
        }
    
    }
    
    @IBAction func clearColorTapped(sender:UIButton) {
    
        var objDrawView = drawView as DrawingView
        objDrawView.lines = []
        objDrawView.setNeedsDisplay()
        
    }


    
    
}

