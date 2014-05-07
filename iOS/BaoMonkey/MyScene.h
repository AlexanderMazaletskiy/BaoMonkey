//
//  MyScene.h
//  iosGame
//

//  Copyright (c) 2014 iPPLE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
#import "Item.h"
#import "TreeBranch.h"
#import "Monkey.h"
#import "EnemiesController.h"


@interface MyScene : SKScene {
    Monkey *monkey;
    EnemiesController *enemiesController;
}

@property (nonatomic) int sizeBlock;
@property (nonatomic) TreeBranch *treeBranch;
@property (nonatomic) NSMutableArray *wave;

@end
