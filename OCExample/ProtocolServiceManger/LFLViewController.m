//
//  LFLViewController.m
//  ProtocolServiceManger
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

#import "LFLViewController.h"

#import <ProtocolServiceKit/ProtocolServiceKit.h>

#import <AccountBusiness/LFLVipProtocol.h>
#import <PlayBusiness/LFLPlayProtocol.h>

#import "LFLUnRuleProtocol.h"

@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self normalExample];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self unRuleExample];
}

/// Map  =》 LFLAppDelegate.m
- (void)unRuleExample {
    Class <LFLUnRuleProtocol> ruleService = ServiceWithProtocol(LFLUnRuleProtocol);
    // 此处Class 实际为LFLTestRuleIMP
    [ruleService unRuleMethod];
}

/// Normal
- (void)normalExample {
    
    // VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力
    Class <LFLVipProtocol> vipService = ServiceWithProtocol(LFLVipProtocol);
    // 不直接使用对应账户类
    // BOOL isVip = [LFLAccountTool isUserVipStatus];
    
    BOOL isVip = [vipService isCurrentUserVipStatus];
    
    if (vipService && isVip) {
        [ServiceWithCachedProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }
    
    if (vipService && [vipService isCurrentUserVipStatus]) {
        [ServiceWithCachedProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }
}

@end
