//
//  BaseViewModel.m
//  TheLifeCircle
//
//  Created by xmfish on 14/12/30.
//  Copyright (c) 2014年 小鱼网. All rights reserved.
//

#import "BaseViewModel.h"
#import "AppDelegate.h"
#import "MainViewController.h"
@implementation BaseViewModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"errCode": @"ret",
             @"errMessage": @"msg",
             @"notReadCommentNum": @"notReadCommentNum",
             @"myNewFollowerCount": @"myNewFollowerCount",
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error
{
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self != nil)
    {
        if (_notReadCommentNum!=[AWordUser sharedInstance].notReadCommentNum || _myNewFollowerCount!=[AWordUser sharedInstance].myNewFollowerCount) {
            [AWordUser sharedInstance].notReadCommentNum = _notReadCommentNum;
            [AWordUser sharedInstance].myNewFollowerCount = _myNewFollowerCount;
            [((AppDelegate*)[UIApplication sharedApplication].delegate).mainViewController setupUnreadMessageCount];
        }else{
            [AWordUser sharedInstance].notReadCommentNum = _notReadCommentNum;
            [AWordUser sharedInstance].myNewFollowerCount = _myNewFollowerCount;
        }

    }
    return self;
}

- (BOOL)success
{
    return (self.errCode.integerValue == 0);
}

- (BOOL)needLogin
{
    return (self.errCode.integerValue == 1001);
}

@end
