//
//  SplachScreenAnimationViewController.swift
//  TwitterSplashScreen
//
//  Created by gustavo r meyer on 1/25/17.
//  Copyright © 2017 gustavo r meyer. All rights reserved.
//

import UIKit
import QuartzCore



class SplachScreenAnimationViewController: UIViewController,CAAnimationDelegate {

    // MARK: - Variable
    var mask:CALayer?
    
    // MARK: - Outlets
    @IBOutlet var imageView:UIImageView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        
        self.mask = CALayer()
        self.mask!.contents = UIImage(named:"logoMask")!.cgImage
        self.mask!.contentsGravity = kCAGravityResizeAspect
        self.mask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask!.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        
        //add logo as mask to view
        self.imageView.layer.mask = mask
        
        //29 161 242
        self.view.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1.0)
        
       
        self.animate()
        
    }
    
    // MARK: - Functions
    func animate(){
        
        //1da1f2
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1 //Add delay 1 secund
        
        //start animation
        let initialBounds = NSValue(cgRect: self.mask!.bounds);
        
        //bounce/zooming effect 
        let middleBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 90))
        
        //final/zooming effect
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1500, height: 1500))
        
        //add NSValues and keytimes
        keyFrameAnimation.values = [initialBounds,middleBounds,finalBounds];
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        
        //animation timing funtions
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)]
        
        //add animations
        self.mask?.add(keyFrameAnimation, forKey: "bounds")
        
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            //remove mask when animation completes
        self.imageView.layer.mask = nil
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Navigation

}
