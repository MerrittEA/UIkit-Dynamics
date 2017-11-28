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
        
        addBlueSquareView()
        addRedSquareView()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    // MARK: Functions
    
    func addRedSquareView() {
        let frame = CGRect(x: 50, y: 70, width: 150, height: 150)
        redSquareView.frame = frame
        redSquareView.backgroundColor = .red
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.redSquareTapped(gestureRecognizer:)))
        redSquareView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(redSquareView)
    }
    
    func addBlueSquareView() {
        let frame = CGRect(x: 250, y: 250, width: 50, height: 50)
        blueSquareView.frame = frame
        blueSquareView.backgroundColor = .blue
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.blueSquareTapped(gestureRecognizer:)))
        blueSquareView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(blueSquareView)
    }
    
    func randomNumber(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max) * (max - min) + min
        
    }
    // blueSquareTapped
    
    @objc func blueSquareTapped(gestureRecognizer: UITapGestureRecognizer) {
        if let view = gestureRecognizer.view {
            let pushBehavior = UIPushBehavior(items: [view], mode: .instantaneous)
            pushBehavior.pushDirection = CGVector(dx: randomNumber(min: -5, max: 5), dy: randomNumber(min: -5, max: 5))
            animator.addBehavior(pushBehavior)
            
            let collisionBehaviorBlue = UICollisionBehavior(items: [blueSquareView])
            collisionBehaviorBlue.translatesReferenceBoundsIntoBoundary = true
            animator.addBehavior(collisionBehaviorBlue)
        }
    }
    
    //red square tapped
    @objc func redSquareTapped(gestureRecognizer: UITapGestureRecognizer) {
        if let view = gestureRecognizer.view {
            let pushBehavior = UIPushBehavior(items: [view], mode: .instantaneous)
            pushBehavior.pushDirection = CGVector(dx: randomNumber(min: -5, max: 5), dy: randomNumber(min: -5, max: 5))
            animator.addBehavior(pushBehavior)
        
            let collisionBehavior = UICollisionBehavior(items: [redSquareView])
            collisionBehavior.translatesReferenceBoundsIntoBoundary = true
            animator.addBehavior(collisionBehavior)
            
            let squareCollision = UICollisionBehavior(items: [redSquareView])
            collisionBehavior.addItem(blueSquareView)
            animator.addBehavior(squareCollision)
        
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
        
        let elasticityBehavior = UIDynamicItemBehavior(items: [redSquareView])
        elasticityBehavior.elasticity = 0.6;
        animator.addBehavior(elasticityBehavior)
        
        // Blue square dynamics
    
        let elasticityBehaviorBlue = UIDynamicItemBehavior(items: [blueSquareView])
        elasticityBehaviorBlue.elasticity = 0.6;
        animator.addBehavior(elasticityBehaviorBlue)
    }
    
}

