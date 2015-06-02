//
//  GameScene.swift
//  Swiftris
//
//  Created by Molly Kent on 6/1/15.
//  Copyright (c) 2015 Molly Kent. All rights reserved.
//

import SpriteKit

let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if lastTick == nil {
            return
        }
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate()
            tick?()
        }
    }
    
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    required init(coder aDecoder : NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
    }
    func startTicking() {
        lastTick = NSDate()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}

