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
        createCircle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createCircle() { // Why isn't my circle showing up?
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        circle.center = self.view.center
        circle.layer.cornerRadius = 50
        circle.backgroundColor = UIColor.blue
        circle.clipsToBounds = true
        circleView.frame = circle.frame
        self.view.addSubview(circleView)
        
    }
    
    @IBAction func addBehaviors(_ sender: UIButton!) {
        let gravityBehavior = UIGravityBehavior(items: [circleView])
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: [circleView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)
    }


}

