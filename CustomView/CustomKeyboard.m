//
//  CustomKeyboard.m
//  CustomView
//
//  Created by Yoshifuji Hiroki on 12/04/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomKeyboard.h"

@implementation CustomKeyboard

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 10, 100, 30);
        [btn setTitle:@"btn1" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(btnDown)
      forControlEvents:UIControlEventTouchDown];

        [self addSubview:btn];
        [self setBackgroundColor:[UIColor grayColor]];
    }
    return self;
}

- (void) btnDown {
    NSLog(@"btnDown");
    if (_delegate && [_delegate respondsToSelector:@selector(keyboard:didKeyInput:)]) {
        [_delegate keyboard:self didKeyInput:@"btn down"];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
