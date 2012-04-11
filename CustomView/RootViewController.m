//
//  RootViewController.m
//  CustomView
//
//  Created by Yoshifuji Hiroki on 12/04/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "CustomKeyboard.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_textField release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CGRect bounds = self.view.bounds;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.tag = 1;
    btn.frame = CGRectMake(5, 5, 80, 35);
    [btn setTitle:@"switch" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchDown];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.tag = 2;
    btn2.frame = CGRectMake(bounds.size.width-55, 5, 50, 35);
    [btn2 setTitle:@"close" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor lightGrayColor]];
    [btn2 addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchDown];


    UIView* toolView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, 44)];
;
    [toolView autorelease];
    [toolView setBackgroundColor:[UIColor lightGrayColor]];
    [toolView addSubview:btn];
    [toolView addSubview:btn2];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, bounds.size.width - 20, 30)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    CustomKeyboard* keyboard1 = [[CustomKeyboard alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, 200)];
    keyboard1.delegate = self;
    keyboardView = keyboard1;
    _textField.inputView = keyboard1;
    _textField.inputAccessoryView = toolView;

    [self.view addSubview:_textField];

    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)btnDown:(UIButton*)button
{
    switch (button.tag) {
        case 1:
        {
            if (_textField.inputView)
            {
                _textField.inputView = nil;
            } else 
            {
                _textField.inputView = keyboardView;
            }
            [_textField reloadInputViews];
            
        }
            break;
        case 2:
        {
            [_textField resignFirstResponder];
        }
            break;
        default:
            break;
    }
}
-(void) keyboard:(CustomKeyboard *)keyboard didKeyInput:(NSString *)str
{
    NSLog(@"keyboard delegate");
    if (_textField) {
        _textField.text = [NSString stringWithFormat:@"%@%@", _textField.text, str];
    }
}
@end
