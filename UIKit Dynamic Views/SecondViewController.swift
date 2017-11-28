//
//  SecondViewController.swift
//  UIKit Dynamic Views
//
//  Created by PotPie on 10/20/17.
//  Copyright © 2017 PotPie - CareerFoundry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var circleView = UIView()
    
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
    
    
    func createCircle() { 
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        circle.center = self.view.center
        circle.layer.cornerRadius = 50
        circle.backgroundColor = UIColor.blue
        circle.clipsToBounds = true
        circleView.backgroundColor = UIColor.blue
        circleView = circle
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.blueCircleTapped(gestureRecognizer:)))
        circle.addGestureRecognizer(tapGestureRecognizer)
        
        self.view.addSubview(circleView)
        
    }
    
    
    func randomNumber(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max) * (max - min) + min
    }
    
    // Blue Circle Tapped
    
    @objc func blueCircleTapped(gestureRecognizer: UITapGestureRecognizer) {
        if let view = gestureRecognizer.view {
            let pushBehavior = UIPushBehavior(items: [view], mode: .instantaneous)
            pushBehavior.pushDirection = CGVector(dx: randomNumber(min: -5, max: 5), dy: randomNumber(min: -5, max: 5))
            animator.addBehavior(pushBehavior)
            
            let collisionBehaviorBlue = UICollisionBehavior(items: [circleView])
            collisionBehaviorBlue.translatesReferenceBoundsIntoBoundary = true
            animator.addBehavior(collisionBehaviorBlue)
        }
    }
    
    @objc func blueCircleStopped(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.view != nil {
            let resistanceBehavior = UIDynamicItemBehavior(items: [circleView])
            resistanceBehavior.resistance = 1.0;
            animator.addBehavior(resistanceBehavior)
        }
    }

}

