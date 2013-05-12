#import <CoreGraphics/CoreGraphics.h>

@interface UIKeyboardImpl
+ (id)sharedInstance;
- (void)setInputModeToNextInPreferredList;
@end
@interface UIKeyboardLayoutStar
- (id)keyHitTest:(CGPoint)arg1;
@end

@interface UITouch
-(id)view;
-(CGPoint)locationInView:(id)view;
@end

@interface UIKBTree
- (id)name;
@end

%hook UIKeyboardLayoutStar

- (void)touchUp:(UITouch *)touch {
    CGPoint point = [touch locationInView:touch.view];
    UIKBTree* kbTree = [self keyHitTest:point];
    
    if ([[kbTree name] isEqualToString:@"International-Key"]) {
        [[%c(UIKeyboardImpl) sharedInstance] setInputModeToNextInPreferredList];
    }else{
        %orig;
    }
}

%end