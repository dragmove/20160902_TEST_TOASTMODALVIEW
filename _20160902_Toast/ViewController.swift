//
//  ViewController.swift
//  _20160902_Toast
//
//  Created by vuild on 2016. 9. 2..
//  Copyright © 2016년 vuild. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func btnTapped(sender: AnyObject) {
        self.view.userInteractionEnabled = false
        
        let toastModalView = UIToastModalView(frame: <#T##CGRect#>)
        
        
        
        // setToast("hello world!!!!! hello world!!!!!\nhello world!!!!! hello world!!!!!")
    }
    
    class UIToastModalView: UIView {
        var overlayView:UIView
        var labelWrap:UIView
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.initialize()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        convenience init() {
            self.init(frame: CGRectZero)
            self.initialize()
        }
        
        func initialize() {
            // TODO - custom backgroundColor, alpha
            overlayView = UIView(frame: self.frame)
            overlayView.backgroundColor = UIColor.blueColor() //
            overlayView.alpha = 0.5 //
            self.addSubview(overlayView)
            
            // labelWrap
            // TODO - backgroundColor, cornerRadius
            labelWrap = UIView(frame: CGRectMake(0, 0, 100, 100))
            labelWrap.backgroundColor = UIColor.redColor()
            labelWrap.layer.cornerRadius = 4.0 //
            labelWrap.translatesAutoresizingMaskIntoConstraints = false
            overlayView.addSubview(labelWrap)
            
            // TODO - custom padding
            let labelWrapHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("|-20-[labelWrap]-20-|", options: [], metrics: nil, views: ["labelWrap":labelWrap])
            overlayView.addConstraints(labelWrapHorizontalConstraint) //
            
            let constraintCenterX = NSLayoutConstraint(item: labelWrap, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: overlayView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
            overlayView.addConstraint(constraintCenterX)
            
            let constraintCenterY = NSLayoutConstraint(item: labelWrap, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: overlayView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
            overlayView.addConstraint(constraintCenterY)
            
            // label
            // TODO - custom font, font size
            let font = UIFont(name: "Helvetica", size: 16.0)
            
            let label = UILabel(frame: CGRectMake(0, 0, 100, 100))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.ByWordWrapping
            label.font = font
            label.sizeToFit()
            
            // TODO - custom backgroundColor, cornerRadius, textColor
            label.backgroundColor = UIColor.blackColor() //
            label.layer.cornerRadius = 4.0 //
            // label.clipsToBounds = true
            // label.alpha = 0
            
            label.textColor = UIColor.whiteColor() //
            label.textAlignment = NSTextAlignment.Center
            label.text = msg // custom
            
            label.translatesAutoresizingMaskIntoConstraints = false
            labelWrap.addSubview(label)
            
            // TODO - custom horizontal padding, vertical padding
            let horizontalVFS = NSLayoutConstraint.constraintsWithVisualFormat("|-10-[label]-10-|", options: [], metrics: nil, views: ["label":label])
            labelWrap.addConstraints(horizontalVFS) //
            
            let verticalVFS = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[label]-10-|", options: [], metrics: nil, views: ["label":label])
            labelWrap.addConstraints(verticalVFS) //
        }
    }
    
    
    
    
    func setToast(msg: String) {
        // overlayView
        let frame = self.view.frame
        let overlayView = UIView(frame: CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height) )
        overlayView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(overlayView)
        
        // labelWrap
        let labelWrap = UIView(frame: CGRectMake(0, 0, 100, 100))
        labelWrap.backgroundColor = UIColor.redColor()
        labelWrap.layer.cornerRadius = 4.0
        labelWrap.translatesAutoresizingMaskIntoConstraints = false
        overlayView.addSubview(labelWrap)
        
        let labelWrapHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("|-20-[labelWrap]-20-|", options: [], metrics: nil, views: ["labelWrap":labelWrap])
        overlayView.addConstraints(labelWrapHorizontalConstraint)
        
        let constraintCenterX = NSLayoutConstraint(item: labelWrap, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: overlayView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        overlayView.addConstraint(constraintCenterX)
        
        let constraintCenterY = NSLayoutConstraint(item: labelWrap, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: overlayView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        overlayView.addConstraint(constraintCenterY)


        // label
        let font = UIFont(name: "Helvetica", size: 16.0)
        
        let label = UILabel(frame: CGRectMake(0, 0, 100, 100))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.sizeToFit()
        
        label.backgroundColor = UIColor.blackColor()
        label.layer.cornerRadius = 4.0
        // label.clipsToBounds = true
        // label.alpha = 0
        
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = msg
        
        label.translatesAutoresizingMaskIntoConstraints = false
        labelWrap.addSubview(label)
        
        let horizontalVFS = NSLayoutConstraint.constraintsWithVisualFormat("|-10-[label]-10-|", options: [], metrics: nil, views: ["label":label])
        labelWrap.addConstraints(horizontalVFS)
        
        let verticalVFS = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[label]-10-|", options: [], metrics: nil, views: ["label":label])
        labelWrap.addConstraints(verticalVFS)
        
        

        
        
        /*
        // set constraint
        let horizontalVFS = NSLayoutConstraint.constraintsWithVisualFormat("|-20-[label]-20-|", options: [NSLayoutFormatOptions.AlignAllCenterY], metrics: nil, views: ["superView":overlayView, "label":label])
        overlayView.addConstraints(horizontalVFS)
        
        let constraintCenterX = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: overlayView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        overlayView.addConstraint(constraintCenterX)
        
        let constraintCenterY = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: overlayView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        overlayView.addConstraint(constraintCenterY)
        
        UIView.animateWithDuration(0.7, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            label.alpha = 1.0
            }) { (finished: Bool) -> Void in
                // label.hidden = finished
        }
        */
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

