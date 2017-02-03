//
//  ViewController.swift
//  Color
//
//  Created by 海野恵凜那 on 2017/02/03.
//  Copyright © 2017年 erina.umino. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    let count = SpringLabel()
    
    var number = 0
    var RED:Float = 0.1
    var GREEN:Float = 0.3
    var BLUE:Float = 0.6

    override func viewDidLoad() {
        super.viewDidLoad()

        count.center = self.view.center
        count.frame.size = CGSize(width: 30, height: 50)
        self.view.addSubview(count)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action(){
        let rand = arc4random_uniform(400)
        let rad = Int(rand)
        let rand2 = arc4random_uniform(800)
        let rad2 = Int(rand)
        
        let label = SpringLabel()
        label.frame.size = CGSize(width: 150, height: 150)
        label.backgroundColor = UIColor(red: CGFloat(RED) , green:CGFloat(GREEN), blue:CGFloat(BLUE), alpha:1)
        label.frame.origin = CGPoint(x: rad, y: rad2)
        label.layer.cornerRadius = 75
        label.layer.masksToBounds = true
        self.view.addSubview(label)
        
        label.animation = "zoomOut"
        label.animate()
        
        // 乱数生成.
        var random = getRandomNumber(Min: 0.01, Max: 0.05)
        var random2 = getRandomNumber(Min: 0.01, Max: 0.05)
        var random3 = getRandomNumber(Min: 0.01, Max: 0.05)

        if RED >= 1 {
            RED = 0
        }else if GREEN >= 1{
            GREEN = 0
        }else if BLUE >= 1{
            BLUE = 0
        }else{
            RED = RED + random
            GREEN = GREEN + random
            BLUE = BLUE + random
        }
        
        number  = number + 1
        count.text = String(number)
        count.animation = "pop"
        count.animate()
        
        view.backgroundColor = UIColor(red: CGFloat(GREEN) , green:CGFloat(BLUE), blue:CGFloat(RED), alpha:0.5)
        

    }
    
        func getRandomNumber(Min _Min : Float, Max _Max : Float)->Float {
        
        return ( Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX) ) * (_Max - _Min) + _Min
    }


}

