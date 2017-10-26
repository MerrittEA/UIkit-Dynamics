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
    
    // Adding the UIDynamic Animator
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        view.addSubview(redSquareView)
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
    }
    
}

