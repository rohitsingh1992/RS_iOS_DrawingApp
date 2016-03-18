//
//  DrawingView.swift
//  DrawingApp
//
//  Created by Rohit Singh on 04/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    var lines : [Lines] = []
    var lastPoint : CGPoint!
    var drawColor : UIColor = UIColor.blackColor();

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()?.locationInView(self)
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
      
        var newPoint = touches.anyObject()?.locationInView(self)

        lines.append(Lines(start: lastPoint, end: newPoint!, color : drawColor))
        lastPoint = newPoint;
        self.setNeedsDisplay()
        
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, 5.0)

        
        for line in lines {
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
      //

        

    }


}