//
//  RootViewController.h
//  CustomView
//
//  Created by Yoshifuji Hiroki on 12/04/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomKeyboard.h"

@interface RootViewController : UIViewController <UITextFieldDelegate, CustomKeyboardDelegate>
{
    UITextField* _textField;
    UIView* keyboardView;
}

@end
