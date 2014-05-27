//
//  Settings.m
//  BaoMonkey
//
//  Created by iPPLE on 27/05/2014.
//  Copyright (c) 2014 BaoMonkey. All rights reserved.
//

#import "Settings.h"
#import "Define.h"
#import "SpriteKitCursor.h"

@interface Settings ()
@property (nonatomic, strong) SpriteKitCursor *cursorVolumeSound;
@property (nonatomic, strong) SpriteKitCursor *cursorVolumeMusic;
@property (nonatomic, strong) SpriteKitCursor *cursorAccelerometer;
@property (nonatomic, strong) id currentCursorClicked;
@end

@implementation Settings

- (instancetype) initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    
    if (self != nil) {
        self.backgroundColor = [SKColor blueColor];
        NSLog(@"Main Menu ok");
        
        _cursorVolumeSound = [[SpriteKitCursor alloc] initWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 2, 50)
                                               position:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 100)];
        _cursorVolumeMusic = [[SpriteKitCursor alloc] initWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 2, 50)
                                                          position:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 300)];
        _cursorAccelerometer = [[SpriteKitCursor alloc] initWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 2, 50)
                                                          position:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 500)];
        
        [_cursorAccelerometer addChild:self];
        [_cursorVolumeMusic addChild:self];
        [_cursorVolumeSound addChild:self];
    }
    return (self);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];

    if ([_cursorAccelerometer checkCursorClickWithNode:node] == YES)
        _currentCursorClicked = _cursorAccelerometer;
    else if ([_cursorVolumeMusic checkCursorClickWithNode:node] == YES)
        _currentCursorClicked = _cursorVolumeMusic;
    else if ([_cursorVolumeSound checkCursorClickWithNode:node] == YES)
        _currentCursorClicked = _cursorVolumeSound;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];

    if ([_currentCursorClicked isEqual:_cursorAccelerometer])
        [_cursorAccelerometer updatePositionCursorWithLocation:location];
    else if ([_currentCursorClicked isEqual:_cursorVolumeMusic])
        [_cursorVolumeMusic updatePositionCursorWithLocation:location];
    else if ([_currentCursorClicked isEqual:_cursorVolumeSound])
        [_cursorVolumeSound updatePositionCursorWithLocation:location];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    _currentCursorClicked = nil;
}

@end
