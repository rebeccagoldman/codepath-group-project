 //
//  BubbleScene.swift
//  Circles2
//
//  Created by Rebecca Goldman on 6/13/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import SpriteKit

class BubbleScene: SKScene {
    
    
    var deltaPoint = CGPointZero
    var myLabel:SKLabelNode!

    override func didMoveToView(view: SKView) {
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
    }
    
  
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        
//        for touch: AnyObject in touches{
//            let location = touch.locationInNode(self)
//            let sprite = self.nodeAtPoint(location)
//            if self.nodeAtPoint(location) == sprite {
//                
//                sprite.removeFromParent()
//            }
//        }
//    }


    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    
    for touch: AnyObject in touches{
    let location = touch.locationInNode(self)
    let sprite = self.nodeAtPoint(location)
        var currentPoint:CGPoint! = touch.locationInNode(self)
        var previousPoint:CGPoint! = touch.previousLocationInNode(self)
        sprite.position = CGPointMake(currentPoint.x - previousPoint.x, currentPoint.y - previousPoint.y)

    }
    
    }
    
    func addBubble(#size: CGSize, #string: String, #location: CGPoint) {
        
        let sprite = SKSpriteNode(imageNamed:"circle")
        sprite.size = CGSize(width: size.width, height: size.height)
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        sprite.position = location
        
        myLabel = SKLabelNode(fontNamed: "Arial")
        myLabel.fontColor = UIColor.whiteColor()
        myLabel.text = string
        myLabel.fontSize = 17

        println("\(myLabel)")
        
        var action = SKAction.scaleTo(0.8, duration: 0.6)
        sprite.runAction(SKAction.repeatActionForever(action))
        
        
        sprite.physicsBody = SKPhysicsBody(circleOfRadius:sprite.size.width/2)
        sprite.physicsBody!.dynamic = true
        
        self.addChild(sprite)
        sprite.addChild(myLabel)

    }
   
    override func update(currentTime: CFTimeInterval) {
    }
    
    

    
}
