//
//  ViewController.swift
//  LoopSwift
//
//  Created by Chung on 8/23/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Draw: UIButton!
    @IBOutlet weak var tfNumber: UITextField!
    var margin:CGFloat = 40
    var margin1:CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Draw.backgroundColor = UIColor.clearColor()
        Draw.layer.cornerRadius = 5
        Draw.layer.borderWidth = 1
        Draw.layer.borderColor = UIColor.blackColor().CGColor

        
    
    }
    
    @IBAction func Draw(sender: UIButton) {
        for subView in self.view.subviews {
            //check xem có phải là uiimageview hay không
            if subView.isKindOfClass(UIImageView){
                subView.removeFromSuperview()
            }
        }
        if let count = Int (tfNumber.text!) {
            print(count)
            drawBall(count)
        }
    }
    
    func drawBall(count: Int){
        if count == 1 {
            let image = UIImage(named: "green")
            let ball  = UIImageView(image: image)
            ball.center = CGPointMake(spaceRow(1), spaceCol(1))
            self.view.addSubview(ball)
        }else{
            for indexRow in 0..<count{
                for indexCol in 0..<count{
                    let image = UIImage(named: "green")
                    let ball  = UIImageView(image: image)
                    ball.center = CGPointMake(margin + CGFloat(indexRow) * spaceRow(count), 80 + CGFloat(indexCol) * spaceCol(count))
                    self.view.addSubview(ball)
                }
                
            }
        }
        
    
    }
    
    func spaceRow(count: Int) -> CGFloat {
        var  space: CGFloat
        if count == 1 {
            space = (self.view.bounds.size.width) / 2
        }else{
             space = (self.view.bounds.size.width - 2*margin)/CGFloat(count-1)
        }
        return space
    }
    
    func spaceCol(count: Int) -> CGFloat {
        var  space: CGFloat
        if count == 1 {
            space = (self.view.bounds.size.height) / 2
        }else{
             space = (self.view.bounds.size.height - 2*margin1)/CGFloat(count-1)
        }
       
        return space
    }


}

