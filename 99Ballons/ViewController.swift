//
//  ViewController.swift
//  99Ballons
//
//  Created by Carlos Beltran on 10/24/14.
//  Copyright (c) 2014 Carlos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var balloonArray:[Balloon] = []

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func NextButton(sender: AnyObject) {
        //have to update what's displayed...
        let randomNumber = Int(arc4random_uniform(UInt32(100)))
        var newBalloon = balloonArray[randomNumber]
        
        imageView.image = newBalloon.image
        numberLabel.text = "\(newBalloon.number)"
        //numberLabel.hidden = false
    }
    
    func createBalloonArray() {
        var imageArray:[UIImage] = []
        
        imageArray.append(UIImage(named:"BerlinTVTower.jpg"))
        imageArray.append(UIImage(named:"RedBalloon1.jpg"))
        imageArray.append(UIImage(named:"RedBalloon2.jpg"))
        imageArray.append(UIImage(named:"RedBalloon3.jpg"))
        imageArray.append(UIImage(named:"RedBalloon4.jpg"))
        
        for var i = 0; i < 100; i++ {
            let randomNumber = Int(arc4random_uniform(UInt32(100)))
            let randomNumber2 = Int(arc4random_uniform(UInt32(4))) + 1
            var tempBalloon = Balloon()
            
            tempBalloon.number = randomNumber
            if randomNumber == 0 {
                tempBalloon.image = imageArray[0]
            }
            else {
                tempBalloon.image = imageArray[randomNumber2]
            }
            
            balloonArray.append(tempBalloon)
        }
        
        // We now have an array of Balloons to choose from...
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBalloonArray()
        
        numberLabel.text = "Press Next to create a random instance!"
        numberLabel.hidden = false

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

