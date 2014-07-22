//
//  TowerNode.m
//  AlienDefence
//
//  Created by Tharshan on 20/07/2014.
//  Copyright (c) 2014 Tharshan. All rights reserved.
//

#import "TowerNode.h"

@implementation TowerNode
+(instancetype) towerOfType:(TowerType)type withLevel:(NSInteger)level{
  TowerNode *tower;
  tower = [self spriteNodeWithImageNamed:[NSString stringWithFormat:@"turret-%d-%d",type, level]];
  tower.anchorPoint = CGPointMake(0.5, 0.5);
  return tower;
}
-(void) pointToTargetAtPoint:(CGPoint)target {
  CGPoint cannonPointOnScene = [self.scene convertPoint:self.position fromNode:self.parent];
  if (self.zRotation < 0) {
    self.zRotation = self.zRotation + M_PI * 2;
  }
  float angle = [self getRotationWithPoint:cannonPointOnScene endPoint:target];
//  [self runAction:[SKAction rotateToAngle:angle duration:1.0f]];
  self.zRotation = angle;
  SKSpriteNode *bullet = [SKSpriteNode spriteNodeWithImageNamed:@"bullet_6"];
  bullet.position = CGPointMake(cannonPointOnScene.x, cannonPointOnScene.y);
  bullet.color = [SKColor greenColor];
  bullet.colorBlendFactor = 0.7;
  bullet.alpha = 0.4;
  bullet.anchorPoint = CGPointMake(0.5, 0.5);
  bullet.zRotation = angle;
  [self.parent.parent addChild:bullet];
  SKAction *move = [SKAction moveTo:target duration:0.2];
  [bullet runAction:move completion:^{
    [bullet removeFromParent];
  }];
}
- (float)getRotationWithPoint:(CGPoint)spoint endPoint:(CGPoint)epoint {
  CGPoint originPoint = CGPointMake(epoint.x - spoint.x, epoint.y - spoint.y); // get origin point to origin by subtracting end from start
  float bearingRadians = atan2f(originPoint.y, originPoint.x); // get bearing in radians
  return bearingRadians;
}
@end
