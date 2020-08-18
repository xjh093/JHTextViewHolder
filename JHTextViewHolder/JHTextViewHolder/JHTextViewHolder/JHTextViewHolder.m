//
//  JHTextViewHolder.m
//  JHTextViewHolder
//
//  Created by HaoCold on 2020/8/18.
//  Copyright © 2020 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2020 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JHTextViewHolder.h"

@interface JHTextViewHolder()
@property (nonatomic,  strong) UILabel *holderLabel;
@property (nonatomic,    weak) UITextView *textView;
@end

@implementation JHTextViewHolder

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textViewTextDidChanged:(NSNotification *)noti
{
    UITextView *textView = (UITextView *)noti.object;
    _holderLabel.hidden = textView.text.length;
}

- (void)setText:(NSString *)text{
    _text = text;
    
    _holderLabel.text = [NSString stringWithFormat:@" %@",text];
}

- (void)setColor:(UIColor *)color{
    _color = color;
    
    _holderLabel.textColor = color;
}

- (void)setTextView:(UITextView *)textView{
    _textView = textView;
    [_textView addSubview:self.holderLabel];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewTextDidChanged:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:textView];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewTextDidChanged:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:textView];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewTextDidChanged:)
                                                 name:UITextViewTextDidEndEditingNotification
                                               object:textView];
}

- (UILabel *)holderLabel{
    if (!_holderLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 10, _textView.frame.size.width, _textView.font.pointSize);
        label.text = @" 请在此输入内容";
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        label.font = _textView.font;
        label.textAlignment = NSTextAlignmentLeft;
        _holderLabel = label;
    }
    return _holderLabel;
}

@end
