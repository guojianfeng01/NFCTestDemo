//
//  ViewController.m
//  NFCTest
//
//  Created by guojianfeng on 2018/1/2.
//  Copyright © 2018年 guojianfeng. All rights reserved.
//

#import "ViewController.h"
#import <CoreNFC/NFCReaderSession.h>

@interface ViewController ()<NFCNDEFReaderSessionDelegate>
@property (nonatomic, strong) NFCNDEFReaderSession *session;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.session = [[NFCNDEFReaderSession alloc] initWithDelegate:self queue:dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT) invalidateAfterFirstRead:NO];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.session beginSession];
}

- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error{
    NSLog(@"%@",error);
}

- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages{
    for (NFCNDEFMessage *message in messages) {
        for (NFCNDEFPayload *payload in message.records) {
            NSLog(@"Payload data:%@",payload.payload);
        }
    }
}


@end
