//
//  GameScene.swift
//  Circle_test
//
//  Created by Jennifer Zeller on 9/9/16.
//  Copyright (c) 2016 Alex. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let manager = CMMotionManager()
    var crosshair = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        scene?.backgroundColor = SKColor.blackColor()

        let OuterRing = SKShapeNode(circleOfRadius: 100 ) // Size of Circle
        OuterRing.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        OuterRing.zPosition = -1.0
        OuterRing.strokeColor = SKColor.blackColor()
        OuterRing.glowWidth = 1.0
        OuterRing.fillColor = SKColor.whiteColor()
        self.addChild(OuterRing)
        
        let OuterRing2 = SKShapeNode(circleOfRadius: 80 ) // Size of Circle
        OuterRing2.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        OuterRing2.zPosition = -1.0
        OuterRing2.strokeColor = SKColor.whiteColor()
        OuterRing2.glowWidth = 1.0
        OuterRing2.fillColor = SKColor.blackColor()
        self.addChild(OuterRing2)
        
        let MiddleRing = SKShapeNode(circleOfRadius: 60 ) // Size of Circle
        MiddleRing.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        MiddleRing.zPosition = -1.0
        MiddleRing.strokeColor = SKColor.blackColor()
        MiddleRing.glowWidth = 1.0
        MiddleRing.fillColor = SKColor.blueColor()
        self.addChild(MiddleRing)
        
        let InnerRing = SKShapeNode(circleOfRadius: 40 ) // Size of Circle
        InnerRing.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        InnerRing.zPosition = -1.0
        InnerRing.strokeColor = SKColor.blackColor()
        InnerRing.glowWidth = 1.0
        InnerRing.fillColor = SKColor.redColor()
        self.addChild(InnerRing)
        
        let BullsEye = SKShapeNode(circleOfRadius: 20 ) // Size of Circle
        BullsEye.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        BullsEye.zPosition = -1.0
        BullsEye.strokeColor = SKColor.blackColor()
        BullsEye.glowWidth = 1.0
        BullsEye.fillColor = SKColor.yellowColor()
        self.addChild(BullsEye)
        
        // manager.startGyroUpdates()
        manager.deviceMotionUpdateInterval=0.1
        manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()){
            (data,error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.attitude.roll)!*10),CGFloat(((data?.attitude.pitch)! - 1) * (-10)))
        }
        // physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        crosshair = SKSpriteNode(imageNamed: "crosshairs.png")
        crosshair.position = CGPointMake(frame.midX-500, frame.midY-500)
        crosshair.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        // crosshair.physicsBody!.affectedByGravity = false
        


//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!"
//        myLabel.fontSize = 45
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
//        
//        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let shape = SKShapeNode(circleOfRadius: 10)
            shape.strokeColor = SKColor.blackColor()
            shape.fillColor = SKColor.greenColor()
            shape.xScale = 0.5
            shape.yScale = 0.5
            shape.position = location
            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
//            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(shape)
        }
    }
    
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
