//
//  ViewController.m
//  FamiConApp
//
//  Created by kaneoka on 2013/06/04.
//  Copyright (c) 2013年 kaneoka. All rights reserved.
//

#import "ViewController.h"
#import <AZSocketIO.h>
#import "SRWebSocket.h"

#define OPERATION_UP 0
#define OPERATION_LEFT 1
#define OPERATION_DOWN 2
#define OPERATION_RIGHT 3
#define OPERATION_A 4
#define OPERATION_B 5

@interface ViewController () <SRWebSocketDelegate>

@end

@implementation ViewController {
    SRWebSocket *web_socket;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    web_socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://change/to/host/name:port/"]]];
    [web_socket setDelegate:self];
    [web_socket open];
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket{

}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendOperation:(UIButton *)sender:(int)tag:(NSString*)operaion {

    NSError *error = nil;
    if (sender.tag == tag) {
        NSLog(@"%@ Button clicked", operaion);
        [web_socket send:operaion];
    }
    
}

-(IBAction)clickUpButton:(UIButton *)sender {
    [self sendOperation:sender:OPERATION_UP:@"UP"];
}

-(IBAction)clickLeftButton:(UIButton *)sender {
    [self sendOperation:sender:OPERATION_LEFT:@"LEFT"];
}

-(IBAction)clickDownButton:(UIButton *)sender {
    [self sendOperation:sender:OPERATION_DOWN:@"DOWN"];
}

-(IBAction)clickRightButton:(UIButton *)sender {
    [self sendOperation:sender:OPERATION_RIGHT:@"RIGHT"];
}

-(IBAction)clickAButton:(UIButton *)sender {
    [self sendOperation:sender:OPERATION_A:@"A"];
}

-(IBAction)clickBButton:(UIButton *)sender {
    [self sendOperation:sender:OPERATION_B:@"B"];
}

@end
