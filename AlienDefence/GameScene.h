//
//  GameScene.h
//  AlienDefence
//
//  Created by Tharshan on 20/07/2014.
//  Copyright (c) 2014 Tharshan. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@interface GameScene : SKScene <UIGestureRecognizerDelegate> {
  UISwipeGestureRecognizer* swipeRightGesture;
  UISwipeGestureRecognizer* swipeLeftGesture;
}

@property (nonatomic, strong) SKSpriteNode* tiles;
@property (nonatomic, strong) NSArray *towerBases;
@property (nonatomic, strong) NSMutableArray *towerBaseBounds;
@property (nonatomic, strong) NSMutableArray *towers;
@property (nonatomic, strong) NSMutableArray *creeps;
@property (nonatomic, strong) SKSpriteNode* selectedTower;
@property (nonatomic) BOOL isTowerSelected;
@property (nonatomic) NSTimeInterval timeOfLastMove;
@property (nonatomic, strong) NSArray *waveData;
@property (nonatomic) int waveNumber;
@property (nonatomic, strong) SKAction* followline;
- (void) addCreepWave;
@end
