//
//  ViewController.m
//  AudioPlayer
//
//  Created by kingmess on 2016/12/26.
//  Copyright © 2016年 kingmess. All rights reserved.
//

#import "ViewController.h"
#import "UCAudioManager.h"

@interface ViewController ()
- (IBAction)playVoice:(id)sender;
- (IBAction)pauseVoice:(id)sender;
- (IBAction)stopVoice:(id)sender;
- (IBAction)palyAgain:(id)sender;


@property (nonatomic ,strong) NSMutableArray * players;
@property (nonatomic ,strong) NSMutableArray * musics;
@property (nonatomic ,strong) UCAudioManager * manager;


@end

@implementation ViewController


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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [UCAudioManager shareVocieManager];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)playVoice:(id)sender {
    
    NSString *string = [[NSBundle mainBundle] pathForResource:@"001" ofType:@"mp3"];
        //把音频文件转换成url格式
    NSURL *url = [NSURL fileURLWithPath:string];
    
    [self.manager playVoiceWithUrl:url];
    
}



-(void)playVoiceWithURL:(NSURL *)url{
    
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



- (IBAction)pauseVoice:(id)sender {
    
}

- (IBAction)stopVoice:(id)sender {
    
    
}

- (IBAction)palyAgain:(id)sender {
    
    NSString *string = [[NSBundle mainBundle] pathForResource:@"002" ofType:@"mp3"];
    //把音频文件转换成url格式
    NSURL *urll = [NSURL fileURLWithPath:string];
    [self.manager playVoiceWithUrl:urll];
}
@end
