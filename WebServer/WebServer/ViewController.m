//
//  ViewController.m
//  WebServer
//
//  Created by Batu on 16/12/23.
//  Copyright © 2016年 King. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic , strong) UIWebView * webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL * fileURL = [NSURL URLWithString:@"http://localhost:22222/sv1/index.html"];
    [self.webView stopLoading];
    [self.webView loadRequest:[NSURLRequest requestWithURL:fileURL]];
}


-(UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:_webView];
        _webView.backgroundColor = [UIColor redColor];
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
