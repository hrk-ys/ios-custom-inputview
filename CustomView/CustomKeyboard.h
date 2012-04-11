//
//  CustomKeyboard.h
//  CustomView
//
//  Created by Yoshifuji Hiroki on 12/04/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomKeyboard;
@protocol CustomKeyboardDelegate <NSObject>

@optional
- (void)keyboard:(CustomKeyboard*)keyboard didKeyInput:(NSString*)str;

@end

@interface CustomKeyboard : UIView {
    id<CustomKeyboardDelegate> _delegate;
}

@property (assign) id<CustomKeyboardDelegate> delegate;

@end
