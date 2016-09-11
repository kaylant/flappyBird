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
    
    override func didMoveToView(view: SKView) {

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
