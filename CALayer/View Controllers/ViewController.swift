//
//  ViewController.swift
//  CALayer
//
//  Created by John on 2020-02-11.
//  Copyright © 2020 John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var imageLayer : CALayer?
    @IBOutlet var sgDiff : UISegmentedControl!
    
    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
    let moveAnimation = CABasicAnimation(keyPath: "position")
    let fadeAnimation = CABasicAnimation(keyPath: "opacity")

    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
     
        
        
        
        // ease rotation in and out
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        // from 0 degrees
        rotateAnimation.fromValue = 0
        // to 360 degrees
        rotateAnimation.toValue = 2 * Double.pi
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 1.0
        // repeat forever
        rotateAnimation.repeatCount=Float.infinity
        // attach animation to layer image
        
        
        // ease in and out movement
        moveAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        // starting location is 0,0
        moveAnimation.fromValue = NSValue.init(cgPoint: CGPoint(x: 0,y: 0))
        // end location is 700,500
        moveAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: 700, y: 500))
        moveAnimation.isRemovedOnCompletion = false
        // takes 3 seconds to move
        moveAnimation.duration = 3.0
        // repeat forever
        moveAnimation.repeatCount=Float.infinity
        // attach animation to image layer
        
        
        // fade animation
        // ease fade in and out
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        // from alpha of 1.0
        fadeAnimation.fromValue = NSNumber.init(value: 1.0)
        // to alpha of 0.0 - invisible
        fadeAnimation.toValue = NSNumber.init(value: 0.0)
        fadeAnimation.isRemovedOnCompletion = false
        // 3 seconds long fade
        fadeAnimation.duration = 3.0
        fadeAnimation.beginTime = 1.0
        fadeAnimation.isAdditive = false
        // fill both forwards and backwards
        fadeAnimation.fillMode =  CAMediaTimingFillMode.both
        // repeat forever
        fadeAnimation.repeatCount=Float.infinity
       
        
    }
    
    
    func addImage() {
        let spinImage = UIImage(named: "bird.png")
        imageLayer = CALayer.init()
        imageLayer?.contents = spinImage?.cgImage
        // hardcode location and size
        imageLayer?.bounds = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 150.0)
        imageLayer?.position = CGPoint(x: 200, y: 400)
        // add image layer to view
        self.view.layer.addSublayer(imageLayer!)
    }
    
    func updateImage() {
        let option = sgDiff.selectedSegmentIndex;
        imageLayer?.removeFromSuperlayer()
        addImage()
        switch option {
        case 0:
            imageLayer?.add(rotateAnimation, forKey: nil)
        case 1:
             imageLayer?.add(fadeAnimation, forKey: nil)
        default:
            imageLayer?.add(moveAnimation, forKey: nil)
        }
    }
    
    @IBAction func segmentDidChange(sender : UISegmentedControl) {
        updateImage()
    }
    
    
    @IBAction func unwindToHome(segue : UIStoryboardSegue)
    {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

