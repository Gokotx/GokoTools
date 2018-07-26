//
//  UITextView+Blocks.m
//  UITextViewBlocks

#import "UITextView+Blocks.h"
#import <objc/runtime.h>

typedef BOOL (^UITextViewReturnBlock) (UITextView *textView);
typedef void (^UITextViewVoidBlock) (UITextView *textView);
typedef BOOL (^UITextViewCharacterChangeBlock) (UITextView *textView, NSRange range, NSString *replacementString);

@implementation UITextView (Blocks)

static const void *UITextViewDelegateKey                           = &UITextViewDelegateKey;

static const void *UITextViewShouldBeginEditingKey                 = &UITextViewShouldBeginEditingKey;
static const void *UITextViewShouldEndEditingKey                   = &UITextViewShouldEndEditingKey;

static const void *UITextViewDidBeginEditingKey                    = &UITextViewDidBeginEditingKey;
static const void *UITextViewDidEndEditingKey                      = &UITextViewDidEndEditingKey;
static const void *UITextViewDidChangeBlockKey                     = &UITextViewDidChangeBlockKey;


static const void *setShouldChangeTextInRangeKey                    = &setShouldChangeTextInRangeKey;

static const void *UITextViewShouldClearKey                        = &UITextViewShouldClearKey;
static const void *UITextViewShouldReturnKey                       = &UITextViewShouldReturnKey;

#pragma mark UITextView Delegate methods

+ (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    UITextViewReturnBlock block = textView.shouldBegindEditingBlock;
    if (block) {
        return block(textView);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
       return [delegate textViewShouldBeginEditing:textView];
    }
    // return default value just in case
    return YES;
}

+ (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    UITextViewReturnBlock block = textView.shouldEndEditingBlock;
    if (block) {
        return block(textView);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textViewShouldEndEditing:)]) {
        return [delegate textViewShouldEndEditing:textView];
    }
    // return default value just in case
    return YES;
}

+ (void)textViewDidBeginEditing:(UITextView *)textView
{
    UITextViewVoidBlock block = textView.didBeginEditingBlock;
    if (block) {
        block(textView);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        [delegate textViewDidBeginEditing:textView];
    }
}
+ (void)textViewDidChange:(UITextView *)textView
{
    UITextViewVoidBlock block = textView.textViewDidChangeBlock;
    if (block) {
        block(textView);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [delegate textViewDidChange:textView];
    }
}

+ (void)textViewDidEndEditing:(UITextView *)textView
{
    UITextViewVoidBlock block = textView.didEndEditingBlock;
    if (block) {
        block(textView);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
        [delegate textViewDidEndEditing:textView];
    }
}
+ (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    UITextViewCharacterChangeBlock block = textView.shouldChangeTextInRangeBlock;
    if (block) {
        return block(textView,range,text);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return [delegate textView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}

+ (BOOL)textViewShouldClear:(UITextView *)textView
{
    UITextViewReturnBlock block = textView.shouldClearBlock;
    if (block) {
        return block(textView);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textViewShouldClear:)]) {
        return [delegate textViewShouldClear:textView];
    }
    return YES;
}

+ (BOOL)textViewShouldReturn:(UITextView *)textView
{
    UITextViewReturnBlock block = textView.shouldReturnBlock;
    if (block) {
        return block(textView);
    }
    
    id delegate = objc_getAssociatedObject(self, UITextViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(textViewShouldReturn:)]) {
        return [delegate textViewShouldReturn:textView];
    }
    return YES;
}

#pragma mark Block setting/getting methods

- (BOOL (^)(UITextView *))shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, UITextViewShouldBeginEditingKey);
}

- (void)setShouldBegindEditingBlock:(BOOL (^)(UITextView *))shouldBegindEditingBlock
{
    [self setDelegateIfNoDelegateSet];
     objc_setAssociatedObject(self, UITextViewShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UITextView *))shouldEndEditingBlock
{
    return objc_getAssociatedObject(self, UITextViewShouldEndEditingKey);
}

- (void)setShouldEndEditingBlock:(BOOL (^)(UITextView *))shouldEndEditingBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextViewShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UITextView *))didBeginEditingBlock
{
    return objc_getAssociatedObject(self, UITextViewDidBeginEditingKey);
    
}

- (void)setDidBeginEditingBlock:(void (^)(UITextView *))didBeginEditingBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextViewDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UITextView *))didEndEditingBlock
{
    return objc_getAssociatedObject(self, UITextViewDidEndEditingKey);
}
-(void (^)(UITextView *))textViewDidChangeBlock{
    return objc_getAssociatedObject(self, UITextViewDidChangeBlockKey);
}

- (void)setDidEndEditingBlock:(void (^)(UITextView *))didEndEditingBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextViewDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void)setTextViewDidChangeBlock:(void (^)(UITextView *textView))textViewDidChangeBlock{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextViewDidChangeBlockKey, textViewDidChangeBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UITextView *, NSRange, NSString *))shouldChangeTextInRangeBlock
{
    return objc_getAssociatedObject(self, setShouldChangeTextInRangeKey);
}

- (void)setShouldChangeTextInRangeBlock:(BOOL (^)(UITextView *, NSRange, NSString *))shouldChangeTextInRange
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, setShouldChangeTextInRangeKey, shouldChangeTextInRange, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UITextView *))shouldReturnBlock
{
    return objc_getAssociatedObject(self, UITextViewShouldReturnKey);
}

- (void)setShouldReturnBlock:(BOOL (^)(UITextView *))shouldReturnBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextViewShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}

- (BOOL (^)(UITextView *))shouldClearBlock
{
    return objc_getAssociatedObject(self, UITextViewShouldClearKey);
}

- (void)setShouldClearBlock:(BOOL (^)(UITextView *textView))shouldClearBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextViewShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextView will use blocks if no delegate is set.
 */
- (void)setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UITextViewDelegate>)[self class]) {
        objc_setAssociatedObject(self, UITextViewDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextViewDelegate>)[self class];
    }
}

@end
