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
    var margin:CGFloat = 50
    var narginVerical: CGFloat = 100
    
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
                self.view.addSubview(ball)
            }
        }
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

