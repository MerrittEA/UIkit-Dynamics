//
//  FirstViewController.swift
//  UIKit Dynamic Views
//
//  Created by PotPie on 10/20/17.
//  Copyright © 2017 PotPie - CareerFoundry. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //Properties
    let redSquareView = UIView()
    let blueSquareView = UIView()
    
    // Adding the UIDynamic Animator
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addRedSquareView()
        //addBlueSquareView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Functions
    
   /* func addRedSquareView() {
        let frame = CGRect(x: 50, y: 70, width: 150, height: 150)
        let redSquareView = UIView(frame: frame)
        redSquareView.backgroundColor = .red
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.redSquareTapped(gestureRecognizer:)))
        redSquareView.addGestureRecognizer(tapGestureRecognizer)
        return redSquareView // why is this non-void?
    }
    
    func addBlueSquareView() {
        let frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        let blueSquareView = UIView(frame: frame)
        blueSquareView.backgroundColor = .blue
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.blueSquareTapped(gestureRecognizer:)))
        blueSquareView.addGestureRecognizer(tapGestureRecognizer)
        return blueSquareView // why is this non-void
    }*/
    
    func randomNumber(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max) * (max - min) + min
        
    }
    // blueSquareTapped
    
    @objc func blueSquareTapped(gestureRecognizer: UITapGestureRecognizer) {
        if let view = gestureRecognizer.view {
            let pushBehavior = UIPushBehavior(items: [view], mode: .instantaneous)
            pushBehavior.pushDirection = CGVector(dx: randomNumber(min: -5, max: 5), dy: randomNumber(min: -5, max: 5))
            animator.addBehavior(pushBehavior)
        }
    }
    
    //red square tapped
    @objc func redSquareTapped(gestureRecognizer: UITapGestureRecognizer) {
        if let view = gestureRecognizer.view {
            let pushBehavior = UIPushBehavior(items: [view], mode: .instantaneous)
            pushBehavior.pushDirection = CGVector(dx: randomNumber(min: -5, max: 5), dy: randomNumber(min: -5, max: 5))
            animator.addBehavior(pushBehavior)
        }
    }
   
    /*func createCircle() {
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        circle.center = self.view.center
        circle.layer.cornerRadius = 50
        circle.backgroundColor = UIColor.black
        circle.clipsToBounds = true
        circleView.frame = circle.frame
    
        
        circle.addSubview(circleView)
        self.view.addSubview(circleView)
    }*/
    
    @IBAction func addBehaviors(_ sender: UIButton!) {
        let gravityBehavior = UIGravityBehavior(items: [redSquareView])
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: [redSquareView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)
        
        let elasticityBehavior = UIDynamicItemBehavior(items: [redSquareView])
        elasticityBehavior.elasticity = 0.6;
        animator.addBehavior(elasticityBehavior)
        
        // Blue square dynamics
    
        let gravityBehaviorBlue = UIGravityBehavior(items: [blueSquareView])
        animator.addBehavior(gravityBehaviorBlue)
        
        let collisionBehaviorBlue = UICollisionBehavior(items: [blueSquareView])
        collisionBehaviorBlue.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehaviorBlue)
        
        let elasticityBehaviorBlue = UIDynamicItemBehavior(items: [blueSquareView])
        elasticityBehaviorBlue.elasticity = 0.6;
        animator.addBehavior(elasticityBehaviorBlue)
    }
    
}

