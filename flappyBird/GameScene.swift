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
    
    override func didMove(to view: SKView) {
        
        // add background first so it is in the background
        let bgTexture = SKTexture(imageNamed: "bg.png")

        
        // move background to left to give it appearance of moving
        let movebg = SKAction.moveBy(x: -bgTexture.size().width, y: 0, duration: 9)
        
        // move the whole width of bg to original position
        let replacebg = SKAction.moveBy(x: bgTexture.size().width, y: 0, duration: 0)
        
        // keep action going forever, combine both actions
        let movebgForever = SKAction.repeatForever(SKAction.sequence([movebg, replacebg]))
        
        // create background 3 times to keep it from running off screen
        for i in 0 ..< 3 {
            
            let someFloat = CGFloat(i)
        
            bg = SKSpriteNode(texture: bgTexture)
            
            // align 3 bgs, align first bg to left of screen, align second bg next to the first
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * someFloat, y:self.frame.midY)
            
            bg.zPosition = -1
            
            // define size for background
            bg.size.height = self.frame.height
            
            bg.run(movebgForever)
            
            self.addChild(bg)
            
        }
        
        
        
        // add bird second to put it in foreground
        // image you use to display a certain sprite is referred to as a texture
        let birdTexture = SKTexture(imageNamed: "flappy1.png")
        // to animate:
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        // animate between bird texture 1 and 2
        let animation = SKAction.animate(with: [birdTexture, birdTexture2], timePerFrame: 0.1)
        // to repeat the animation forever
        let makeBirdFlap = SKAction.repeatForever(animation)
        
        // apply it to bird
        bird = SKSpriteNode(texture: birdTexture)
        
        // give it a location in the middle of the screen
        bird.position = CGPoint(x: self.frame.midX, y:self.frame.midY)
        bird.zPosition = 1
        
        // apply the animation to the bird node
        bird.run(makeBirdFlap)
        
        // apply "gravity" and detect collisions
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height/2)
        bird.physicsBody!.isDynamic = true
        
        // add to scene (screen)
        self.addChild(bird)
        
        // second physics body is the ground to keep bird from falling off the screen
        var ground = SKNode()
        ground.position = CGPoint(x: 0,y: 0) // bottom left of screen
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width, height: 1))
        ground.physicsBody!.isDynamic = false
        
        self.addChild(ground)
        

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        bird.physicsBody!.velocity = CGVector(dx: 0, dy: 0)
        bird.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 50))
        
        
    }
   
    override func update(_ currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
