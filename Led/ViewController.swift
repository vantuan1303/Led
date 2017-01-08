//
//  ViewController.swift
//  Led
//
//  Created by Nguyen Van Tuan on 1/3/17.
//  Copyright © 2017 MyProjects. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txt: UITextField!
    
    var n = 4
    var lastOnLed = -1
    var margin:CGFloat = 50
    var narginVerical: CGFloat = 80
    var rowOnLed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Acc(sender: UIButton) {
        for v in view.subviews {
            if v is UIImageView {
                v.removeFromSuperview()
            }
        }
        n = Int(txt.text!)!
        if n > 1
        {
            for indexHang in 0..<n {
                for indexCot in 0..<n {
                    let img = UIImage(named: "Green")
                    let ball = UIImageView(image: img)
                    ball.center = CGPointMake(margin + CGFloat(indexHang) * spaceBetweenBall(), narginVerical + CGFloat(indexCot) * spaceCot())
                    ball.tag = indexHang + 100 + 100 * indexCot
                    self.view.addSubview(ball)
                }
            }
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("runningLed"), userInfo: nil, repeats: true)
    }
    

    
    func runningLed() {

        if lastOnLed != -1 {
            turnOffLed()
        }
        if lastOnLed != n - 1 {
            lastOnLed = lastOnLed + 1
        }
        else {
            lastOnLed = 0
            if rowOnLed < n - 1 {
                rowOnLed = rowOnLed + 1
            } else {
                rowOnLed = 0
            }
        }
        turnOnLed()
    }
    
    func turnOnLed() {
        if let ball = self.view.viewWithTag(100 + lastOnLed + 100 * rowOnLed) as? UIImageView {
            ball.image = UIImage(named: "Green")
        }
    }
    
    func turnOffLed() {
        if let ball = self.view.viewWithTag(100 + lastOnLed + 100 * rowOnLed) as? UIImageView {
            ball.image = UIImage(named: "Grey")
        }
    }
    
    func spaceBetweenBall() -> CGFloat {
        let space = (self.view.bounds.size.width - 2*margin) / CGFloat(n - 1)
        return space
        
    }
    
    func spaceCot() -> CGFloat {
        let space = (self.view.bounds.size.height - 2*narginVerical) / CGFloat(n - 1)
        return space
    }




}

