//
//  ViewController.swift
//  cjsase
//
//  Created by Jonas Schramm on 17.01.15.
//  Copyright (c) 2015 Jonas Schramm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var pinchView: UIView!
    @IBOutlet weak var rotateView: UIView!
    @IBOutlet weak var panView: UIView!
    @IBOutlet weak var longPressView: UIView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var labelTap: UILabel!
    
    @IBOutlet weak var labelAction: UILabel!
    
    @IBAction func helloAction(sender: UIButton) {
        println("Buttonpress")
        labelAction.text = "Button"
        
    }
    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        println("LongPress")
        labelAction.text = "LongPress"
    }
    
    @IBAction func pinchGesture(sender: UIPinchGestureRecognizer) {
        println("pinched")
        labelAction.text = "Pinch"
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform,
            sender.scale, sender.scale)
        sender.scale = 1
    }
    
    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        println("pan")
        labelAction.text = "Pan"
        let translation = sender.translationInView(self.view)
        sender.view!.center = CGPoint(x:sender.view!.center.x + translation.x,
            y:sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
        
    }
    
    
    @IBAction func rotateGesture(sender: UIRotationGestureRecognizer) {
        println("rotated")
        labelAction.text = "Rotate"
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tapGesture = UITapGestureRecognizer(target: self, action: "tappedView:")
        tapGesture.numberOfTapsRequired = 1
        tapView.addGestureRecognizer(tapGesture)
        
        swipeView.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: "swipedView:"))
    }
    func tappedView(jonasGestureRecognizer: UITapGestureRecognizer) {
        println("tab")
        labelAction.text = "Tap"
    }
    
    func swipedView(jonasGestureRecognizers: UISwipeGestureRecognizer) {
        println("swiped")
        labelAction.text = "Swipe"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}