//
//  GameScene.swift
//  flappyBird
//
//  Created by Kaylan Smith on 9/10/16.
//  Copyright (c) 2016 Kaylan Smith. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode()
    
    var bg = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        // add background first so it is in the background
        let bgTexture = SKTexture(imageNamed: "bg.png")

        
        // move background to left to give it appearance of moving
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        
        // move the whole width of bg to original position
        let replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        
        // keep action going forever, combine both actions
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
        
        // create background 3 times to keep it from running off screen
        for var i:CGFloat = 0; i < 3; i++ {
        
            bg = SKSpriteNode(texture: bgTexture)
            
            // align 3 bgs, align first bg to left of screen, align second bg next to the first
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i, y:CGRectGetMidY(self.frame))
            
            bg.zPosition = -1
            
            // define size for background
            bg.size.height = self.frame.height
            
            bg.runAction(movebgForever)
            
            self.addChild(bg)
            
        }
        
        
        
        // add bird second to put it in foreground
        // image you use to display a certain sprite is referred to as a texture
        let birdTexture = SKTexture(imageNamed: "flappy1.png")
        // to animate:
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        // animate between bird texture 1 and 2
        let animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.1)
        // to repeat the animation forever
        let makeBirdFlap = SKAction.repeatActionForever(animation)
        
        // apply it to bird
        bird = SKSpriteNode(texture: birdTexture)
        
        // give it a location in the middle of the screen
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        bird.zPosition = 1
        
        // apply the animation to the bird node
        bird.runAction(makeBirdFlap)
        
        // add to scene (screen)
        self.addChild(bird)
        

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
