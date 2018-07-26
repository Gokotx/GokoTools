//
//  UITextView+Blocks.h
//  UITextViewBlocks
#import <UIKit/UIKit.h>

@interface UITextView (Blocks)

@property (copy, nonatomic) BOOL (^shouldBegindEditingBlock)(UITextView *textView);
@property (copy, nonatomic) BOOL (^shouldEndEditingBlock)(UITextView *textView);

@property (copy, nonatomic) void (^didBeginEditingBlock)(UITextView *textView);
@property (copy, nonatomic) void (^didEndEditingBlock)(UITextView *textView);

@property (copy, nonatomic) BOOL (^shouldChangeTextInRangeBlock)(UITextView *textView, NSRange range, NSString *replacementString);
@property (copy, nonatomic) void (^textViewDidChangeBlock)(UITextView *textView);

@property (copy, nonatomic) BOOL (^shouldReturnBlock)(UITextView *textView);
@property (copy, nonatomic) BOOL (^shouldClearBlock)(UITextView *textView);

- (void)setShouldBegindEditingBlock:(BOOL (^)(UITextView *textView))shouldBegindEditingBlock;
- (void)setShouldEndEditingBlock:(BOOL (^)(UITextView *textView))shouldEndEditingBlock;

- (void)setDidBeginEditingBlock:(void (^)(UITextView *textView))didBeginEditingBlock;
- (void)setDidEndEditingBlock:(void (^)(UITextView *textView))didEndEditingBlock;

- (void)setShouldChangeTextInRangeBlock:(BOOL (^)(UITextView *textView, NSRange range, NSString *string))shouldChangeTextInRange;
- (void)setTextViewDidChangeBlock:(void (^)(UITextView *textView))didEndEditingBlock;

- (void)setShouldClearBlock:(BOOL (^)(UITextView *textView))shouldClearBlock;
- (void)setShouldReturnBlock:(BOOL (^)(UITextView *textView))shouldReturnBlock;

@end
