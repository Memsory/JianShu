//
//  UCAudioManager.h
//  UCBooks
//
//  Created by kingmess on 2016/12/26.
//  Copyright © 2016年 wuribatu. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface UCAudioManager : NSObject

+(instancetype)shareVocieManager;


-(void)playVoiceWithUrl:(NSURL *)url;


@end
