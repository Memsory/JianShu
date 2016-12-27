//
//  UCAudioManager.m
//  UCBooks
//
//  Created by kingmess on 2016/12/26.
//  Copyright © 2016年 wuribatu. All rights reserved.
//

#import "UCAudioManager.h"

@interface UCAudioManager ()

@property (nonatomic , strong) AVAudioPlayer * audioPlayer;
@property (nonatomic ,strong) NSMutableArray * players;
@property (nonatomic ,strong) NSMutableArray * musics;
@end


@implementation UCAudioManager


-(NSMutableArray *)players{
    
    if (_players == nil) {
        _players = [[NSMutableArray alloc]init];
    }
    return _players;
}

-(NSMutableArray *)musics{
    
    if (_musics == nil) {
        _musics = [[NSMutableArray alloc]init];
    }
    return _musics;
}


+(instancetype)shareVocieManager{
    
    static UCAudioManager * shareVoiceManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareVoiceManager = [[self alloc]init];
    });
    return shareVoiceManager;
}

-(void)playVoiceWithUrl:(NSURL *)url{
    
    
    [self.musics addObject:url];
    AVAudioPlayer * player = [[AVAudioPlayer alloc]initWithContentsOfURL:[_musics lastObject]  error:nil];
    
    [self.players addObject:player];
    
    if (self.players.count == 1) {
        AVAudioPlayer * player1 = self.players[0];
        [player1 play];
    }else if (self.players.count == 2){
        
        AVAudioPlayer * player1 = self.players[0];
        [player1 stop];
        
        
        [self.players removeObjectAtIndex:0];
        [self.musics removeObjectAtIndex:0];
        
        AVAudioPlayer * player2 = self.players[0];
        [player2 play];
    }

}



@end
