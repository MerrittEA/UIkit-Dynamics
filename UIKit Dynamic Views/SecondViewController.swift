//
//  SecondViewController.swift
//  UIKit Dynamic Views
//
//  Created by PotPie on 10/20/17.
//  Copyright © 2017 PotPie - CareerFoundry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let circleView = UIView()
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createCircle() {
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250.0, height: 250.0))
        circle.backgroundColor = UIColor.blue
        circleView.frame = circle.frame
        
    }
    
    @IBAction func addBehaviors(_ sender: UIButton!) {
        let gravityBehavior = UIGravityBehavior(items: [circleView])
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: [circleView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)
    }


}

